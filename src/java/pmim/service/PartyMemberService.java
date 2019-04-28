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
            List<SysUser> users = userMapper.selectUserByPermission(new SysUser("", 4, 0));
            return users;
        } else if (currentSysUser.getUserPermission() == 4) {
            SysUser thisUser = userMapper.selectUser_withNoPwd(currentSysUser);
            return getDatePoor(System.currentTimeMillis(), thisUser.getPartyMemberDate().getTime());
        }
        return null;
    }

    public String getDatePoor(long l1, long l2) {
        Date endDate = new Date(l1);
        Date nowDate = new Date(l2);
        long nd = 1000 * 24 * 60 * 60;
        long diff = endDate.getTime() - nowDate.getTime();
        long day = diff / nd;
        return String.valueOf(day);
    }

    public Object getShipDue() throws Exception {
        List<Map<String, Object>> results = new ArrayList<>();
        List<PartyMemberShipDues> partyMemberShipDues = partyMemberShipDuesMapper.selectAll();
        for (PartyMemberShipDues p : partyMemberShipDues) {
            Map<String, Object> result = new HashMap<>();
            result.put("userId", p.getUserId());
//            Student student=new Student();
//            student.setUserId(p.getUserId());
            try {
                SysUser user = new SysUser();
                user.setUserId(p.getUserId());
                Student student = studentMapper.selectStudentById(user);
                result.put("name", student.getName());
                result.put("date", p.getDate());
                result.put("amount", p.getAmount());
                result.put("createBy", p.getCreateBy());
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
            results.add(result);
        }
        return JSONObject.fromObject(new ResponseMessage(0, "", results)).toString();
    }

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
        return null;
    }

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

    public Object getImportPartyMember() throws Exception {
        List<ImportedPartyMember> importedPartyMembers = importedPartyMemberMapper.selectWithAll_New();
        List<Map<String, Object>> result = new ArrayList<>();
        for (ImportedPartyMember ipm : importedPartyMembers) {
            Map<String, Object> mipm = ObjectUtils.convertBean(ipm);
            SysUser user = new SysUser();
            user.setUserId(ipm.getUserId());
            Student student = studentMapper.selectStudentById(user);
            result.add(mipm);
            try {
                mipm.put("name", student.getName());
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return JSONObject.fromObject(new ResponseMessage(0, "", result)).toString();
    }

    public Object acceptImportPartyMember(String userId) {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        sysUser.setUserPermission(7);
        sysUser.setPartyMemberDate(new Timestamp(new java.util.Date().getTime()));
        userMapper.update2PartyMember(sysUser);
        ImportedPartyMember ipm = new ImportedPartyMember();
        ipm.setUserId(userId);
        ipm.setStatus(1);
        importedPartyMemberMapper.updateWithStatus(ipm);
        return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null));
    }

    public Object disAcceptImportPartyMember(String userId) {
        ImportedPartyMember ipm = new ImportedPartyMember();
        ipm.setUserId(userId);
        ipm.setStatus(2);
        importedPartyMemberMapper.updateWithStatus(ipm);
        return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null));
    }

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

    public Object applyForExport(SysUser currentSysUser) {
        currentSysUser.setUserPermission(10);
        userMapper.updatePermissionById(currentSysUser);
        return JSONObject.fromObject(new ResponseMessage(0, "申请成功", null)).toString();
    }

    public Object exportPartyMemberAction(RequestAction ra) {
        SysUser user = new SysUser();
        user.setUserId(ra.getDesId());
        if (ra.getCode().equals("0")) {
            user.setUserPermission(11);
        } else {
            user.setUserPermission(4);
        }
        userMapper.updatePermissionById(user);
        return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null)).toString();
    }
}
