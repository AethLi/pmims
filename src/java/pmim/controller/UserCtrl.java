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

//@SessionAttributes用于存其他controller保留在服务端的信息 value变量名，request.getSession().getAttribute(value的变量名)即可取用，types类型
@SessionAttributes(value = "currentSysUser", types = SysUser.class)
//配置自动扫描，将这个类注解为controller，会响应http请求中requestMapping中相对应的内容
@Controller
//@RequestMapping的参数value ：与类上面value进行拼接，响应对应的.do
@RequestMapping(value = "/user")
public class UserCtrl {
    //@Autowired会自动注入一个实体，在此处相当于private UserService us =new UserService();
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
    //web.xml中的配置，会处理无对应文件时，所有.do的请求，会去controller里面找RequestMapping，其他都会丢弃
    //@RequestMapping的参数value ：与类上面value进行拼接，响应对应的.do，produces是限定返回值类型---此处返回一个text/ html格式，字符编码为utf-8的数据包
    //public-方法的公有类型   Object-返回类型 AAccountCtrl(参数)-方法名，
    @RequestMapping(value = "/AAccount.do", produces = "text/html;charset=UTF-8")
    //@ResponseBody这个注解会将返回数据（字符串）写入到返回的数据的response里面，再前端取出数据使用
    public @ResponseBody
    //@RequestBody注解会将请求的Body里面的内容作为一个字符串jsonstr取出使用
    Object AAccountCtrl(HttpServletRequest request, @RequestBody String jsonstr, Model model) {
        //获取此次发送请求的数据
        // JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class)将请求数据转为RequestAction
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //判断此次请求是登录还是注册
        // equals用作判断实体对象是否是同样的值
        if ("register".equals(ra.getAction())) {
            //获取当前创建用户的信息
           /* SysUser u = (SysUser) JSONObject.toBean(JSONObject.fromObject(jsonstr), SysUser.class);
            u.setStatus(0);
            u.setUserPermission(0);
            u.setUserPwd(Tools.toMD5(u.getUserPwd()));
            //获取当前创建用户的学生部分信息
            Student s = (Student) JSONObject.toBean(JSONObject.fromObject(jsonstr), Student.class);
            //直接将UserService.register()的返回值 返回
            return us.register(u, s);*/

            //判断此次请求是否是登录
            //equals用作判断实体对象是否是同样的值
        } else if ("login".equals(ra.getAction())) {
            //获取登录信息（包含用户名，一次性口令，验证码）
            SysUser u = (SysUser) JSONObject.toBean(JSONObject.fromObject(jsonstr), SysUser.class);
            //在session中获取当前验证码并于此次登录请求的数据作比较
            if (!ra.getCode().toLowerCase().equals(request.getSession().getAttribute("identifyingCode"))) {
                //将验证码失效化
                request.getSession().setAttribute("identifyingCode", "oishfioasdhfdsofhiodshfasoifhoadhfasohoidsaf");
                //验证码错误则返回信息
                //JSONObject.fromObject(任意的类的实体对象)会将实体对象，转化为一个json格式的对象（实质是一个map）；
                //new ResponseMessage(status,message,model)定义了一个返回类型的实体对象，再作为formObject的参数；
                //toString（）：Java所有类都有这个方法，在此处是将json格式的对象转换为一个json格式的字符串。
                return JSONObject.fromObject(new ResponseMessage(1, "验证码错误", null)).toString();
            }
            //验证登录信息，U——用户是否在数据库存在
            u = us.login(u, request.getSession().getAttribute("identifyingCode").toString());
            //返回值为空时是无效登录，验证码或密码错误
            if (u == null) {
                request.getSession().setAttribute("identifyingCode", "sdfbhsadfsaiofhsadiohfoiashfoisahdfoiashfosi");
                //JSONObject.fromObject(任意的类的实体对象)会将实体对象，转化为一个json格式的对象（实质是一个map）；
                //new ResponseMessage(status,message,model)定义了一个返回类型的实体对象，再作为formObject的参数；
                //toString（）：Java所有类都有这个方法，在此处是将json格式的对象转换为一个json格式的字符串。
                return JSONObject.fromObject(new ResponseMessage(1, "账号或密码错误", null)).toString();
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
    //@RequestBody 会将request-请求，中的body部分取出并转换为一个json格式字符串
    /**
     * 初始化頁面
     * @param request
     * @param jsonstr
     * @return
     */
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

    /**
     * 登出
     * @param request
     * @return
     */
    @RequestMapping(value = "/logout.do")
    public @ResponseBody
    Object logoutCtrl(HttpServletRequest request) {
        //清空session
        request.getSession().invalidate();
        //返回退出成功
        return JSONObject.fromObject(new ResponseMessage(0, "", null)).toString();
    }

    /**
     * 改密码
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/changePassword.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object changePassword(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取新旧密码的值
        String oldPassword = (String) JSONObject.fromObject(jsonstr).get("oldPassword");
        String newPassword = (String) JSONObject.fromObject(jsonstr).get("newPassword");
        //调用us.changePassword
        return JSONObject.fromObject(new ResponseMessage(0, us.changePassword(oldPassword, newPassword, (SysUser) request.getSession().getAttribute("currentSysUser")), null)).toString();

    }

    /**
     * 添加管理员
     * @param request
     * @param jsonstr
     * @return
     */
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
        //获取当前登录用户，因为之前的登录信息放在SessionAttributes
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        //获取属于用户的存储路径
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        //调用us.uploadFile上传文件
        return us.uploadFile(request, currentSysUser.getUserId(), userPath);
    }

    /**
     * 获取导入状态
     * @param request
     * @param model
     * @return
     */
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

    /**
     * 导入用户
     * @param request
     * @return
     */
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
