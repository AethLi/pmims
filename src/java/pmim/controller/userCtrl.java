package pmim.controller;

import jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pmim.model.requestAction;
import pmim.model.resposeMessage;
import pmim.model.student;
import pmim.model.user;
import pmim.service.userService;
import pmim.tools.tools;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@SessionAttributes(value = "currentUser", types = user.class)
@Controller
@RequestMapping(value = "/user")
public class userCtrl {
    @Autowired
    private userService us;

    @RequestMapping(value = "/AAccount.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object AAccountCtrl(HttpServletRequest request, @RequestBody String jsonstr, Model model) {
        requestAction ra = (requestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), requestAction.class);
        if ("register".equals(ra.getAction())) {
            user u = (user) JSONObject.toBean(JSONObject.fromObject(jsonstr), user.class);
            u.setStatus(0);
            u.setUserPermission(0);
            u.setUserPwd(tools.toMD5(u.getUserPwd()));
            student s = (student) JSONObject.toBean(JSONObject.fromObject(jsonstr), student.class);
            return us.register(u, s);
        } else if ("login".equals(ra.getAction())) {
            user u = (user) JSONObject.toBean(JSONObject.fromObject(jsonstr), user.class);
            if (!ra.getCode().toLowerCase().equals(request.getSession().getAttribute("identifyingCode"))) {
                return JSONObject.fromObject(new resposeMessage(1, "验证码错误", null)).toString();
            }
            u = us.login(u, request.getSession().getAttribute("identifyingCode").toString());
            if (u == null) {
                return JSONObject.fromObject(new resposeMessage(1, "账号或用户名错误错误", null)).toString();
            }
            model.addAttribute("currentUser",u);
            if (u.getUserPermission() == 5 || u.getUserPermission() == 6)
                return JSONObject.fromObject(new resposeMessage(0, "html/managerPage.html", null)).toString();
            else
                return JSONObject.fromObject(new resposeMessage(0, "html/mainPage.html", null)).toString();
        }
        return null;
    }

    @RequestMapping(value = "/initPage.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object initPageCtrl(HttpServletRequest request, @RequestBody String jsonstr) {
        user currentUser = (user) request.getSession().getAttribute("currentUser");
        if (currentUser==null)
            return JSONObject.fromObject(new resposeMessage(1, "", null)).toString();
        return us.initPage(currentUser);
    }
}
