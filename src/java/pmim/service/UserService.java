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
        //捕获
        try {
            um.insertUser_register(u);
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, "注册失败", null)).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(0, "注册成功", null)).toString();
    }

    public SysUser login(SysUser u, String identifyingCode) {
        SysUser desSysUser;
        try {
            desSysUser = um.selectUser_withNoPwd(u);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        if (desSysUser == null) {
            return null;
        }
        if (u.getUserPwd().equals(Tools.toMD5(desSysUser.getUserPwd() + identifyingCode))) {
            return desSysUser;
        }
        return null;
    }

    public Object initPage(SysUser currentSysUser) {
        Map m = new HashMap();
        Student currentStudent;
        try {
            currentSysUser = um.selectUser_withNoPwd(currentSysUser);
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, "", null)).toString();
        }
        currentSysUser.setUserPwd("已隐藏");
        m.put("user", currentSysUser);
        if (currentSysUser.getUserPermission() >= 5 && currentSysUser.getUserPermission() < 7)
            return JSONObject.fromObject(new ResponseMessage(0, "", m)).toString();
        else {
            try {
                currentStudent = sm.selectStudentById(currentSysUser);
                m.put("student", currentStudent);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return JSONObject.fromObject(new ResponseMessage(0, "", m)).toString();
        }
    }

    public String changePassword(String oldPassword, String newPassword, SysUser sysUser) {
        SysUser user = um.selectUser_withNoPwd(sysUser);
        if (Tools.toMD5(oldPassword).equals(user.getUserPwd())) {
            user.setUserPwd(Tools.toMD5(newPassword));
            um.changePassword(user);
            return "修改成功";
        } else {
            return "旧密码输入错误";
        }
    }

    public Object addAdmin(RequestAction ra) {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(ra.getDesId());
        sysUser.setStatus(Integer.parseInt(ra.getCode()));
        um.addAdmin(sysUser);
        return JSONObject.fromObject(new ResponseMessage(0, "添加成功", null)).toString();
    }

    public Object uploadFile(HttpServletRequest request, String userId, String userPath) {
        File proposerPath = new File(userPath + "importedPartyMember/");
        if (!proposerPath.exists()) {
            proposerPath.mkdir();
        }
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator iter = multiRequest.getFileNames();
            if (!iter.hasNext()) {
                return JSONObject.fromObject(new ResponseMessage(1, "网络错误", null)).toString();
            }
            while (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {

                    String fileRandomName = RandomStringUtils.randomAlphabetic(5) + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date(System.currentTimeMillis())) + file.getOriginalFilename();
                    String path = proposerPath.getPath() + "/" + fileRandomName;
                    try {
                        file.transferTo(new File(path));
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
        importedPartyMember.setUserId(currentSysUser.getUserId());
        List<ImportedPartyMember> importedPartyMembers = ipmm.selectByUserId(importedPartyMember);
        return JSONObject.fromObject(new ResponseMessage(0, null, importedPartyMembers)).toString();
    }

    public Object importNewUsers(HttpServletRequest request, String pathstr) {
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
        SpreadsheetMLPackage importFile = SpreadsheetMLPackage.load(new File(filePath));
        WorkbookPart workbookPart = importFile.getWorkbookPart();
        WorksheetPart sheet = workbookPart.getWorksheet(0);
        DataFormatter formatter = new DataFormatter();

        Worksheet ws = sheet.getContents();
        SheetData data = ws.getSheetData();

        for (int i = 0; i < data.getRow().size(); i++) {
            if (i == 0) {
                continue;
            }
            System.out.println("row " + data.getRow().get(i));
            for (int j = 0; j < data.getRow().get(i).getC().size(); j++) {
                String text = formatter.formatCellValue(data.getRow().get(i).getC().get(j));
                SysUser user = new SysUser();
                user.setUserId(text.replace("\'", ""));
                if (user.getUserId() == "") {
                    continue;
                }
                user.setUserPwd("96e79218965eb72c92a549dd5a330112");
                user.setRegisterDate(new Timestamp(System.currentTimeMillis()));
                user.setUserPermission(0);
                user.setStatus(0);
                um.insertUser_register(user);
                Student student=new Student();
                student.setUserId(user.getUserId());
                sm.insertId(student);
            }
        }
    }

    public Object deleteById(RequestAction ra) {
        SysUser user = new SysUser();
        user.setUserId(ra.getDesId());
        um.deleteUserById(user);
        return JSONObject.fromObject(new ResponseMessage(0, "删除成功", null)).toString();
    }
}
