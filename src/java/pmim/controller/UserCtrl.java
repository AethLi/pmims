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
     *
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
            //验证登录信息
            u = us.login(u, request.getSession().getAttribute("identifyingCode").toString());
            //返回值为空时是无效登录，验证码或密码错误
            if (u == null) {
                request.getSession().setAttribute("identifyingCode", "sdfbhsadfsaiofhsadiohfoiashfoisahdfoiashfosi");
                //
                return JSONObject.fromObject(new ResponseMessage(1, "账号或用户名错误错误", null)).toString();
            }
            if (u.getStatus() != 0) {
                return JSONObject.fromObject(new ResponseMessage(1, "账户停用", null)).toString();
            }
            if (u.getUserPermission() == 11) {
                return JSONObject.fromObject(new ResponseMessage(1, "已成功转出，不可登录", null)).toString();
            }
            //将当前登录态传入session
            model.addAttribute("currentSysUser", u);
            //区分管理员与其他
            if (u.getUserPermission() == 5 || u.getUserPermission() == 6) {
                request.getSession().setAttribute("identifyingCode", "sdafsadfdsafsadfdsjfsajflasjflskjfksljflsddd");
                //为管理员返回普通用户首页
                return JSONObject.fromObject(new ResponseMessage(0, "html/managerPage.html", null)).toString();
            } else if (u.getUserPermission() == 0 || u.getUserPermission() == 1 || u.getUserPermission() == 2 || u.getUserPermission() == 3 || u.getUserPermission() == 4 || u.getUserPermission() == 7 || u.getUserPermission() == 8 || u.getUserPermission() == 9 || u.getUserPermission() == 10) {
                request.getSession().setAttribute("identifyingCode", "fhwqiefhwibibcviashdoasfhoasifhosafdaosfasoj");
                //为普通用户返回普通用户首页
                return JSONObject.fromObject(new ResponseMessage(0, "html/mainPage.html", null)).toString();
            }
        }
        return null;
    }

    @RequestMapping(value = "/initPage.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object initPageCtrl(HttpServletRequest request, @RequestBody String jsonstr) {
        //判断当前是否有用户登录
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        if (currentSysUser == null)
            //未登录返回信息
            return JSONObject.fromObject(new ResponseMessage(1, "", null)).toString();
        //登录调用us.initPage返回信息
        return us.initPage(currentSysUser);
    }

    @RequestMapping(value = "/logout.do")
    public @ResponseBody
    Object logoutCtrl(HttpServletRequest request) {
        //清空session
        request.getSession().invalidate();
        //返回退出成功
        return JSONObject.fromObject(new ResponseMessage(0, "", null)).toString();
    }

    @RequestMapping(value = "/changePassword.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object changePassword(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取新旧密码的值
        String oldPassword = (String) JSONObject.fromObject(jsonstr).get("oldPassword");
        String newPassword = (String) JSONObject.fromObject(jsonstr).get("newPassword");
        //调用us.changePassword
        return JSONObject.fromObject(new ResponseMessage(0, us.changePassword(oldPassword, newPassword, (SysUser) request.getSession().getAttribute("currentSysUser")), null)).toString();

    }

    @RequestMapping(value = "/addAdmin.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object addAdmin(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取添加管理员的信息
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //调用us.addAdmin添加管理员
        return us.addAdmin(ra);
    }

    /**
     * 申请转入党员
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        //获取当前登录用户
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        //获取用户路径
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        //调用us.uploadFile上传文件
        return us.uploadFile(request, currentSysUser.getUserId(), userPath);
    }

    @RequestMapping(value = "/getImportedStatus.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object getImportedStatus(HttpServletRequest request, Model model) {
        //获取当前登录状态
        SysUser currentSysUser = (SysUser) model.asMap().get("currentSysUser");
        try {
            //调用us.getImportedStatus获取转入状态
            return us.getImportedStatus(currentSysUser);
        } catch (Exception e) {
            //捕获异常并输出
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null)).toString();
        }

    }

    @RequestMapping(value = "/importNewUsers.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object importNewUsers(HttpServletRequest request) {
        //导入用户的文件存放地址
        String userPath = "D:/idea project/pmims/uploadPath/user/";
        //调用us.importNewUsers导入用户
        return us.importNewUsers(request, userPath);
    }

    /**
     * 通过ID删除用户
     *
     * @param jsonstr
     * @param request
     * @return
     */
    @RequestMapping(value = "deleteById", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object deleteById(@RequestBody String jsonstr, HttpServletRequest request) {
        //获取JSON数据
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //检查当前操作的用户的权限
        if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
            //调用us.deleteById删除用户并返回信息
            return us.deleteById(ra);
        } else {
            //返回错误信息
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
        }
    }
}
