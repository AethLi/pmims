package pmim.service;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.userMapper;
import pmim.model.resposeMessage;
import pmim.model.student;
import pmim.model.user;

@Service
public class userService {

    @Autowired
    private userMapper um;

    public String register(user u, student s) {

        try {
            um.insertUser_register(u);
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new resposeMessage("注册失败",null)).toString();
        }
        return JSONObject.fromObject(new resposeMessage("注册成功",null)).toString();
    }
}
