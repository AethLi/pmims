package pmim.service;

import net.sf.json.JSONObject;
import org.apache.commons.lang3.RandomStringUtils;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.packages.SpreadsheetMLPackage;
import org.docx4j.openpackaging.parts.SpreadsheetML.WorkbookPart;
import org.docx4j.openpackaging.parts.SpreadsheetML.WorksheetPart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.xlsx4j.exceptions.Xlsx4jException;
import org.xlsx4j.org.apache.poi.ss.usermodel.DataFormatter;
import org.xlsx4j.sml.SheetData;
import org.xlsx4j.sml.Worksheet;
import pmim.mapper.ImportedPartyMemberMapper;
import pmim.mapper.PartyMemberShipDuesMapper;
import pmim.mapper.StudentMapper;
import pmim.mapper.UserMapper;
import pmim.model.*;
import pmim.tools.ObjectUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class PartyMemberService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    PartyMemberShipDuesMapper partyMemberShipDuesMapper;
    @Autowired
    StudentMapper studentMapper;
    @Autowired
    ImportedPartyMemberMapper importedPartyMemberMapper;

    public Object init(SysUser currentSysUser) {
        if (currentSysUser.getUserPermission() == 5 || currentSysUser.getUserPermission() == 6) {
            //创建返回值
            List<Map<String, Object>> results = new ArrayList<>();
            //查询所有党员
            List<SysUser> users = userMapper.selectUserByPermission(new SysUser("", 4, 0));
            //遍历所有的党员
            for (SysUser u : users) {
                u.setUserPwd("");
                //初始化单个返回值
                Map<String, Object> result;
                try {
                    //将单个党员的SysUser信息转化为Map
                    result = ObjectUtils.convertBean(u);
                    //查询该人的student信息，并将名字存入单个返回结果
                    Student student = studentMapper.selectStudentById(u);
                    result.put("studentName", student.getName());
                    //将单个返回结果存入最终返回结果
                    results.add(result);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

            return results;
        } else {
            SysUser thisUser = userMapper.selectUser_withNoPwd(currentSysUser);
            //调用getDatePoor（）计算入党多久，网上学习的
            return getDatePoor(System.currentTimeMillis(), thisUser.getPartyMemberDate().getTime());
        }
    }

    public String getDatePoor(long l1, long l2) {
        Date endDate = new Date(l1);
        Date nowDate = new Date(l2);
        long nd = 1000 * 24 * 60 * 60;
        long diff = endDate.getTime() - nowDate.getTime();
        long day = diff / nd;
        return String.valueOf(day);
    }

    /**
     * 获取党费记录
     *
     * @return
     * @throws Exception
     */
    public Object getShipDue() throws Exception {
        List<Map<String, Object>> results = new ArrayList<>();
        //获取导入记录
        List<PartyMemberShipDues> partyMemberShipDues = partyMemberShipDuesMapper.selectAll();
        //遍历导入记录
        for (PartyMemberShipDues p : partyMemberShipDues) {
            Map<String, Object> result = new HashMap<>();
            //添加用户的Id到党费信息中
            result.put("userId", p.getUserId());
            try {
                //获取这条用户信息的student信息，并将用户名放入党费信息中
                SysUser user = new SysUser();
                user.setUserId(p.getUserId());
                Student student = studentMapper.selectStudentById(user);
                result.put("name", student.getName());
                result.put("date", p.getDate());//时间
                result.put("amount", p.getAmount());//金额
                result.put("createBy", p.getCreateBy());//收费人
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
            results.add(result);
        }
        return JSONObject.fromObject(new ResponseMessage(0, "", results)).toString();
    }

    /**
     * 导入党费记录
     *
     * @param request  用于解析文件上传的实体对象
     * @param userId   当前用户Id
     * @param userPath 路径
     * @return
     */
    public Object uploadFile(HttpServletRequest request, String userId, String userPath) {
        File proposerPath = new File(userPath);
        if (!proposerPath.exists()) {
            proposerPath.mkdir();
        }
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator iter = multiRequest.getFileNames();
            if (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    String fileRandomName = RandomStringUtils.randomAlphabetic(5) + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date(System.currentTimeMillis())) + file.getOriginalFilename();
                    String path = proposerPath.getPath() + "/" + fileRandomName;
                    try {
                        file.transferTo(new File(path));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    try {
                        //将导入信息写入数据库，网上学习
                        SpreadsheetMLPackage importFile = SpreadsheetMLPackage.load(new File(path));
                        WorkbookPart workbookPart = importFile.getWorkbookPart();
                        WorksheetPart sheet = workbookPart.getWorksheet(0);
                        DataFormatter formatter = new DataFormatter();
                        insertContent(sheet, formatter, userId);
                    } catch (Docx4JException e) {
                        e.printStackTrace();
                    } catch (Xlsx4jException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null)).toString();
    }

    /**
     * 就是146行实际进行操作的
     *
     * @param sheet
     * @param formatter
     * @param userId
     * @throws Docx4JException
     */
    private void insertContent(WorksheetPart sheet, DataFormatter formatter, String userId) throws Docx4JException {

        Worksheet ws = sheet.getContents();
        SheetData data = ws.getSheetData();

        for (int i = 0; i < data.getRow().size(); i++) {
            if (i == 0) {
                continue;
            }
            System.out.println("row " + data.getRow().get(i));
            Map<String, Object> dues = new HashMap<>();
            for (int j = 0; j < data.getRow().get(i).getC().size(); j++) {
                String text = formatter.formatCellValue(data.getRow().get(i).getC().get(j));
                if (j == 0) {
                    dues.put("userId", text);
                } else if (j == 1) {
                    dues.put("amount", text);
                }
                if (userMapper.selectUsersById(dues) != null) {
                    dues.put("createBy", userId);
                    dues.put("date", new java.util.Date());
                }
            }
            partyMemberShipDuesMapper.insertWithAll(dues);
        }
    }

    /**
     * 获取转入的党员信息
     *
     * @return
     * @throws Exception
     */
    public Object getImportPartyMember() throws Exception {
        //查询所有转入党员
        List<ImportedPartyMember> importedPartyMembers = importedPartyMemberMapper.selectWithAll_New();
        //新建了一个最终结果
        List<Map<String, Object>> results = new ArrayList<>();
        //遍历所有导入党员，并将他的名字放入最终结果
        for (ImportedPartyMember ipm : importedPartyMembers) {
            Map<String, Object> mipm = ObjectUtils.convertBean(ipm); //将转入党员信息转换为Map，方便修改
            SysUser user = new SysUser();
            user.setUserId(ipm.getUserId());
            Student student = studentMapper.selectStudentById(user);
            //将每一条信息放入最终结果
            results.add(mipm);
            try {
                mipm.put("name", student.getName());
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return JSONObject.fromObject(new ResponseMessage(0, "", results)).toString();
    }

    /**
     * 同意转入
     *
     * @param userId
     * @return
     */
    public Object acceptImportPartyMember(String userId) {
        //查询同意转入的人的user信息
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        sysUser.setUserPermission(7);
        sysUser.setPartyMemberDate(new Timestamp(new java.util.Date().getTime()));
        //同意转入并写入数据库
        userMapper.update2PartyMember(sysUser);
        //避免重复查询到此条信息
        ImportedPartyMember ipm = new ImportedPartyMember();
        ipm.setUserId(userId);
        ipm.setStatus(1);
        importedPartyMemberMapper.updateWithStatus(ipm);
        return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null)).toString();
    }

    /**
     * 不同意转入
     *
     * @param userId
     * @return
     */
    public Object disAcceptImportPartyMember(String userId) {
        ImportedPartyMember ipm = new ImportedPartyMember();
        ipm.setUserId(userId);
        ipm.setStatus(2);
        importedPartyMemberMapper.updateWithStatus(ipm);
        return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null)).toString();
    }

    /**
     * 实际未启用
     *
     * @param currentUser
     * @return
     */
    public Object getMyImport(SysUser currentUser) {
        Map<String, Object> result = new HashMap<>();
        result.put("status", 0);
        ImportedPartyMember importedPartyMember = new ImportedPartyMember();
        importedPartyMember.setUserId(currentUser.getUserId());
        List<ImportedPartyMember> importedPartyMembers = importedPartyMemberMapper.selectByUserId(importedPartyMember);
        if (importedPartyMembers.size() != 0) {
            result.put("has", true);
        }
        if (currentUser.getUserPermission() == 7) {
            result.put("status", 1);
        }
        return result;
    }

    /**
     * 申请转出
     *
     * @param currentSysUser
     * @return
     */
    public Object applyForExport(SysUser currentSysUser) {
        currentSysUser.setUserPermission(10);
        userMapper.updatePermissionById(currentSysUser);
        return JSONObject.fromObject(new ResponseMessage(0, "申请成功", null)).toString();
    }


    /**
     * 操作是否同意转出
     * @param ra
     * @return
     */
    public Object exportPartyMemberAction(RequestAction ra) {
        SysUser user = new SysUser();
        user.setUserId(ra.getDesId());
        //同意转出
        if (ra.getCode().equals("0")) {
            user.setUserPermission(11);
            //不同意转出
        } else {
            user.setUserPermission(4);
        }
        userMapper.updatePermissionById(user);
        return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null)).toString();
    }
}
