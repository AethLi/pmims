package pmim.service;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.studentMapper;
import pmim.mapper.userMapper;
import pmim.model.responseMessage;
import pmim.model.student;
import pmim.model.user;
import pmim.tools.tools;

import java.util.HashMap;
import java.util.Map;

@Service
public class userService {

    @Autowired
    private userMapper um;
    @Autowired
    private studentMapper sm;

    public String register(user u, student s) {
        try {
            um.insertUser_register(u);
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new responseMessage(1, "注册失败", null)).toString();
        }
        return JSONObject.fromObject(new responseMessage(0, "注册成功", null)).toString();
    }

    public user login(user u, String identifyingCode) {
        user desUser;
        try {
            desUser = um.selectUser_withNoPwd(u);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        if (u.getUserPwd().equals(tools.toMD5(desUser.getUserPwd() + identifyingCode))) {
            return desUser;
        }
        return null;
    }

    public Object initPage(user currentUser) {
        Map m = new HashMap();
        student currentStudent;
        try {
            currentUser = um.selectUser_withNoPwd(currentUser);
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new responseMessage(1, "", null)).toString();
        }
        currentUser.setUserPwd("已隐藏");
        m.put("user",currentUser);
        if (currentUser.getUserPermission() >= 5)
            return JSONObject.fromObject(new responseMessage(0, "", m)).toString();
        else {
            try {
                currentStudent=sm.selectStudentById(currentUser);
                m.put("student",currentStudent);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return JSONObject.fromObject(new responseMessage(0,"",m)).toString();
        }
    }
}
