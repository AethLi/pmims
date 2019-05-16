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
import pmim.mapper.StudentMapper;
import pmim.mapper.UserMapper;
import pmim.model.*;
import pmim.tools.Tools;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class UserService {

    @Autowired
    private UserMapper um;
    @Autowired
    private StudentMapper sm;
    @Autowired
    private ImportedPartyMemberMapper ipmm;

    public String register(SysUser u, Student s) {
        //捕获异常
        try {
            //插入用户信息
            um.insertUser_register(u);
        } catch (Exception e) {
            e.printStackTrace();
            //异常时返回注册失败
            return JSONObject.fromObject(new ResponseMessage(1, "注册失败", null)).toString();
        }
        //无异常则返回成功
        return JSONObject.fromObject(new ResponseMessage(0, "注册成功", null)).toString();
    }

    public SysUser login(SysUser u, String identifyingCode) {
        SysUser desSysUser;
        try {
            //从数据库中查询当前登录账户的Sysuser信息
            desSysUser = um.selectUser_withNoPwd(u);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        if (desSysUser == null) {
            //未查询到时返回空
            return null;
        }
        //判断一次性口令是否正确,把数据库的密码拿出来进行MD5处理后与前端密码是否相等
        if (u.getUserPwd().equals(Tools.toMD5(desSysUser.getUserPwd() + identifyingCode))) {
            return desSysUser;
        }
        return null;
    }

    public Object initPage(SysUser currentSysUser) {
        //new 一个返回值
        Map m = new HashMap();
        Student currentStudent;
        try {
            //查询当前登录用户的user信息
            currentSysUser = um.selectUser_withNoPwd(currentSysUser);
        } catch (Exception e) {
            e.printStackTrace();
            //返回错误
            return JSONObject.fromObject(new ResponseMessage(1, "", null)).toString();
        }
        //去除密码信息
        currentSysUser.setUserPwd("已隐藏");
        //将用户信息存入返回值
        m.put("user", currentSysUser);
        //判断权限是否为管理员
        if (currentSysUser.getUserPermission() >= 5 && currentSysUser.getUserPermission() < 7)
            //直接返回
            return JSONObject.fromObject(new ResponseMessage(0, "", m)).toString();
        else {
            try {
                //查询用户的student信息
                currentStudent = sm.selectStudentById(currentSysUser);
                //将student信息存入返回值
                m.put("student", currentStudent);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //返回
            return JSONObject.fromObject(new ResponseMessage(0, "", m)).toString();
        }
    }


    /**
     * 更改密码
     *
     * @param oldPassword
     * @param newPassword
     * @param sysUser
     * @return
     */
    public String changePassword(String oldPassword, String newPassword, SysUser sysUser) {
        //查询要改密码的用户
        SysUser user = um.selectUser_withNoPwd(sysUser);
        //比较旧密码是否正确
        if (Tools.toMD5(oldPassword).equals(user.getUserPwd())) {
            //存入新密码
            user.setUserPwd(Tools.toMD5(newPassword));
            um.changePassword(user);
            return "修改成功";
        } else {
            return "旧密码输入错误";
        }
    }

    /**
     * 添加管理员
     *
     * @param ra
     * @return
     */
    public Object addAdmin(RequestAction ra) {
        //获取当前添加的管理员的信息
        SysUser sysUser = new SysUser();
        sysUser.setUserId(ra.getDesId());
        sysUser.setStatus(Integer.parseInt(ra.getCode()));
        //写入数据库
        um.addAdmin(sysUser);
        //返回成功
        return JSONObject.fromObject(new ResponseMessage(0, "添加成功", null)).toString();
    }

    /**
     * 转入党员上传信息
     *
     * @param request
     * @param userId
     * @param userPath
     * @return
     */
    public Object uploadFile(HttpServletRequest request, String userId, String userPath) {
        //获取磁盘存入路径
        File proposerPath = new File(userPath + "importedPartyMember/");
        //判断路径是否存在
        if (!proposerPath.exists()) {
            proposerPath.mkdir();
        }
        //文件上传的核心代码是参照网上的，获取multipart解析（165-198）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取multipart中的文件迭代器
            Iterator iter = multiRequest.getFileNames();
            //遍历multipart中的文件
            if (!iter.hasNext()) {
                //无文件，返回错误
                return JSONObject.fromObject(new ResponseMessage(1, "网络错误", null)).toString();
            }
            while (iter.hasNext()) {
                //获取单个文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    //生成随机字符名
                    String fileRandomName = RandomStringUtils.randomAlphabetic(5) + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date(System.currentTimeMillis())) + file.getOriginalFilename();
                    //获取路径
                    String path = proposerPath.getPath() + "/" + fileRandomName;
                    try {
                        //存入文件
                        file.transferTo(new File(path));
                        //将记录写入数据库
                        ipmm.insertImportedPartyMember(new ImportedPartyMember(UUID.randomUUID().toString().replace("-", "0"), userId, fileRandomName, new Timestamp(System.currentTimeMillis()), 0));
                    } catch (IOException e) {
                        e.printStackTrace();
                        return JSONObject.fromObject(new ResponseMessage(1, "上传失败", null)).toString();
                    }
                }
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "上传成功", null)).toString();
    }

    public Object getImportedStatus(SysUser currentSysUser) {
        ImportedPartyMember importedPartyMember = new ImportedPartyMember();
        //设置需要检查的转入党员的id
        importedPartyMember.setUserId(currentSysUser.getUserId());
        //查询需要转入的党员信息
        List<ImportedPartyMember> importedPartyMembers = ipmm.selectByUserId(importedPartyMember);
        //返回
        return JSONObject.fromObject(new ResponseMessage(0, null, importedPartyMembers)).toString();
    }

    public Object importNewUsers(HttpServletRequest request, String pathstr) {
        //获取磁盘存入路径
        File filePath = new File(pathstr);
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    String fileRandomName = RandomStringUtils.randomAlphabetic(5) + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date(System.currentTimeMillis())) + file.getOriginalFilename();
                    String path = filePath.getPath() + "/" + fileRandomName;
                    try {
                        file.transferTo(new File(path));
                        //调用importUser方法导入用户
                        importUser(path);
                    } catch (IOException e) {
                        e.printStackTrace();
                        return JSONObject.fromObject(new ResponseMessage(1, "上传失败", null)).toString();
                    } catch (Xlsx4jException e) {
                        e.printStackTrace();
                    } catch (Docx4JException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "上传成功", null)).toString();
    }

    private void importUser(String filePath) throws Xlsx4jException, Docx4JException {
        //初始化SpreadsheetMLPackage对象，用作读取excel
        SpreadsheetMLPackage importFile = SpreadsheetMLPackage.load(new File(filePath));
        //初始化WorkbookPart对象，用作读取excel的工作空间
        WorkbookPart workbookPart = importFile.getWorkbookPart();
        WorksheetPart sheet = workbookPart.getWorksheet(0);
        //初始化一个格式转换器
        DataFormatter formatter = new DataFormatter();
        //获取特定工作空间
        Worksheet ws = sheet.getContents();
        //获取当前工作空间数据
        SheetData data = ws.getSheetData();

        //根据行遍历
        for (int i = 0; i < data.getRow().size(); i++) {
            if (i == 0) {
                continue;
            }
            //输出行及数据
            System.out.println("row " + data.getRow().get(i));
            //根据列遍历
            for (int j = 0; j < data.getRow().get(i).getC().size(); j++) {
                String text = formatter.formatCellValue(data.getRow().get(i).getC().get(j));
                SysUser user = new SysUser();
                user.setUserId(text.replace("\'", ""));
                if (user.getUserId() == "") {
                    continue;
                }
                //新建用户信息
                user.setUserPwd("96e79218965eb72c92a549dd5a330112");
                user.setRegisterDate(new Timestamp(System.currentTimeMillis()));
                user.setUserPermission(0);
                user.setStatus(0);
                //插入用户信息
                um.insertUser_register(user);
                //新建学生信息
                Student student = new Student();
                student.setUserId(user.getUserId());
                //插入学生信息
                sm.insertId(student);
            }
        }
    }

    public Object deleteById(RequestAction ra) {
        //初始化要删除的user
        SysUser user = new SysUser();
        user.setUserId(ra.getDesId());
        //删除
        um.deleteUserById(user);
        //返回成功
        return JSONObject.fromObject(new ResponseMessage(0, "删除成功", null)).toString();
    }
}
