package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;
import pmim.model.Student;
import pmim.model.SysUser;
import pmim.service.PermissionCheckService;
import pmim.service.UserPathService;
import pmim.service.UserService;
import pmim.tools.Tools;

import javax.servlet.http.HttpServletRequest;

@SessionAttributes(value = "currentSysUser", types = SysUser.class)
@Controller //配置自动扫描，将这个类注解为controller，会响应http请求中requestMapping中相对应的内容
@RequestMapping(value = "/user")
public class UserCtrl {
    //自动注入一个实体
    @Autowired
    private UserService us;
    @Autowired
    private UserPathService ups;
    @Autowired
    PermissionCheckService pcs;

    /**
     * 处理 登录请求
     * @param request 存登录状态，取验证码
     * @param jsonstr
     * @param model
     * @return
     */
    @RequestMapping(value = "/AAccount.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object AAccountCtrl(HttpServletRequest request, @RequestBody String jsonstr, Model model) {
        //获取此次发送请求的数据
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //判断此次请求是登录还是注册
        if ("register".equals(ra.getAction())) {
            //获取当前创建用户的信息
            SysUser u = (SysUser) JSONObject.toBean(JSONObject.fromObject(jsonstr), SysUser.class);
            u.setStatus(0);
            u.setUserPermission(0);
            u.setUserPwd(Tools.toMD5(u.getUserPwd()));
            //获取当前创建用户的学生部分信息
            Student s = (Student) JSONObject.toBean(JSONObject.fromObject(jsonstr), Student.class);
            //直接将UserService.register()的返回值 返回
            return us.register(u, s);
            //判断此次请求是否时登录
        } else if ("login".equals(ra.getAction())) {
            //获取登录信息（包含用户名，一次性口令，验证码）
            SysUser u = (SysUser) JSONObject.toBean(JSONObject.fromObject(jsonstr), SysUser.class);
            //在session中获取当前验证码并于此次登录请求的数据作比较
            if (!ra.getCode().toLowerCase().equals(request.getSession().getAttribute("identifyingCode"))) {
                //将验证码失效化
                request.getSession().setAttribute("identifyingCode", "oishfioasdhfdsofhiodshfasoifhoadhfasohoidsaf");
                //验证码错误则返回信息
                return JSONObject.fromObject(new ResponseMessage(1, "验证码错误", null)).toString();
            }
            //验证验证码是否正确
            u = us.login(u, request.getSession().getAttribute("identifyingCode").toString());
            //验证登录信息
            if (u == null) {
                //返回值为空时是无效登录，验证码或密码错误
                request.getSession().setAttribute("identifyingCode", "sdfbhsadfsaiofhsadiohfoiashfoisahdfoiashfosi");
                //
                return JSONObject.fromObject(new ResponseMessage(1, "账号或用户名错误错误", null)).toString();
            }
            if (u.getStatus() != 0) {
                return JSONObject.fromObject(new ResponseMessage(1, "账户停用", null)).toString();
            }
            if (u.getUserPermission()==11){
                return JSONObject.fromObject(new ResponseMessage(1, "已成功转出，不可登录", null)).toString();
            }
            model.addAttribute("currentSysUser", u);
            //将当前登录态传入session
            if (u.getUserPermission() == 5 || u.getUserPermission() == 6) {
                //区分管理员与其他
                request.getSession().setAttribute("identifyingCode", "sdafsadfdsafsadfdsjfsajflasjflskjfksljflsddd");
                return JSONObject.fromObject(new ResponseMessage(0, "html/managerPage.html", null)).toString();
            } else if (u.getUserPermission() == 0 || u.getUserPermission() == 1 || u.getUserPermission() == 2 || u.getUserPermission() == 3 || u.getUserPermission() == 4 || u.getUserPermission() == 7 || u.getUserPermission() == 8 || u.getUserPermission() == 9 || u.getUserPermission() == 10) {
                request.getSession().setAttribute("identifyingCode", "fhwqiefhwibibcviashdoasfhoasifhosafdaosfasoj");
                return JSONObject.fromObject(new ResponseMessage(0, "html/mainPage.html", null)).toString();
            }
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

    @RequestMapping(value = "/changePassword.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object changePassword(HttpServletRequest request, @RequestBody String jsonstr) {
        String oldPassword = (String) JSONObject.fromObject(jsonstr).get("oldPassword");
        String newPassword = (String) JSONObject.fromObject(jsonstr).get("newPassword");
        return JSONObject.fromObject(new ResponseMessage(0, us.changePassword(oldPassword, newPassword, (SysUser) request.getSession().getAttribute("currentSysUser")), null)).toString();

    }

    @RequestMapping(value = "/addAdmin.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object addAdmin(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        return us.addAdmin(ra);
    }

    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        return us.uploadFile(request, currentSysUser.getUserId(), userPath);
    }

    @RequestMapping(value = "/getImportedStatus.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object getImportedStatus(HttpServletRequest request, Model model) {
        SysUser currentSysUser = (SysUser) model.asMap().get("currentSysUser");
        try {
            return us.getImportedStatus(currentSysUser);
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null)).toString();
        }

    }

    @RequestMapping(value = "/importNewUsers.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object importNewUsers(HttpServletRequest request) {
        String userPath = "D:/idea project/pmims/uploadPath/user/";
        return us.importNewUsers(request, userPath);
    }

    @RequestMapping(value = "deleteById", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object deleteById(@RequestBody String jsonstr, HttpServletRequest request) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
            return us.deleteById(ra);
        } else {
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
        }
    }
}
