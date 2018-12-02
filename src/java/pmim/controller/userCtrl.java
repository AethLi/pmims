package pmim.controller;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.requestAction;
import pmim.model.student;
import pmim.model.user;
import pmim.service.userService;
import pmim.tools.tools;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class userCtrl {
    @Autowired
    private userService us;

    @RequestMapping(value = "AAccount.do",produces = "text/html;charset=UTF-8")
    public @ResponseBody Object AAccountCtrl(HttpServletRequest request,@RequestBody String jsonstr){
        requestAction ra= (requestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr),requestAction.class);
        if ("register".equals(ra.getAction())){
            user u=(user)JSONObject.toBean(JSONObject.fromObject(jsonstr),user.class);
            u.setStatus(0);
            u.setUserPermission(0);
            u.setUserPwd(tools.toMD5(u.getUserPwd()));
            student s=(student)JSONObject.toBean(JSONObject.fromObject(jsonstr),student.class);
            return us.register(u,s);
        }else if ("login".equals(ra.getAction())){
            return null;
        }
        return null;
    }
}
