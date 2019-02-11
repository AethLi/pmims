package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;
import pmim.model.Student;
import pmim.model.SysUser;
import pmim.service.UserService;
import pmim.tools.Tools;

import javax.servlet.http.HttpServletRequest;

@SessionAttributes(value = "currentSysUser", types = SysUser.class)
@Controller
@RequestMapping(value = "/user")
public class UserCtrl {
    @Autowired
    private UserService us;

    @RequestMapping(value = "/AAccount.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object AAccountCtrl(HttpServletRequest request, @RequestBody String jsonstr, Model model) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("register".equals(ra.getAction())) {
            SysUser u = (SysUser) JSONObject.toBean(JSONObject.fromObject(jsonstr), SysUser.class);
            u.setStatus(0);
            u.setUserPermission(0);
            u.setUserPwd(Tools.toMD5(u.getUserPwd()));
            Student s = (Student) JSONObject.toBean(JSONObject.fromObject(jsonstr), Student.class);
            return us.register(u, s);
        } else if ("login".equals(ra.getAction())) {
            SysUser u = (SysUser) JSONObject.toBean(JSONObject.fromObject(jsonstr), SysUser.class);
            if (!ra.getCode().toLowerCase().equals(request.getSession().getAttribute("identifyingCode"))) {
                return JSONObject.fromObject(new ResponseMessage(1, "验证码错误", null)).toString();
            }
            u = us.login(u, request.getSession().getAttribute("identifyingCode").toString());
            if (u == null) {
                return JSONObject.fromObject(new ResponseMessage(1, "账号或用户名错误错误", null)).toString();
            }
            model.addAttribute("currentSysUser", u);
            if (u.getUserPermission() == 5 || u.getUserPermission() == 6)
                return JSONObject.fromObject(new ResponseMessage(0, "html/managerPage.html", null)).toString();
            else
                return JSONObject.fromObject(new ResponseMessage(0, "html/mainPage.html", null)).toString();
        }
        return null;
    }

    @RequestMapping(value = "/initPage.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object initPageCtrl(HttpServletRequest request, @RequestBody String jsonstr) {
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        if (currentSysUser == null)
            return JSONObject.fromObject(new ResponseMessage(1, "", null)).toString();
        return us.initPage(currentSysUser);
    }

    @RequestMapping(value = "/logout.do")
    public @ResponseBody
    Object logoutCtrl(HttpServletRequest request) {
        request.getSession().invalidate();
        return JSONObject.fromObject(new ResponseMessage(0, "", null)).toString();
    }

}
