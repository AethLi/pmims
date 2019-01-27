package pmim.service;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.StudentMapper;
import pmim.mapper.UserMapper;
import pmim.model.Student;
import pmim.model.SysUser;
import pmim.model.ResponseMessage;
import pmim.tools.Tools;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    private UserMapper um;
    @Autowired
    private StudentMapper sm;

    public String register(SysUser u, Student s) {
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
        if (currentSysUser.getUserPermission() >= 5)
            return JSONObject.fromObject(new ResponseMessage(0, "", m)).toString();
        else {
            try {
                currentStudent=sm.selectStudentById(currentSysUser);
                m.put("student",currentStudent);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return JSONObject.fromObject(new ResponseMessage(0,"",m)).toString();
        }
    }
}
