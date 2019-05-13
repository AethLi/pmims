package pmim.controller;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;
import pmim.model.Student;
import pmim.model.SysUser;
import pmim.service.PermissionCheckService;
import pmim.service.StudentService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Date;
import java.text.SimpleDateFormat;

@RequestMapping(value = "/student")
@Controller
public class studentCtrl {
    @Autowired
    StudentService ss;
    @Autowired
    UserPathService ups;
    @Autowired
    PermissionCheckService pcs;

    /**
     * 获取用户信息及保存用户信息
     *
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/studentInfo.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object studentInfo(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //判断是否为初始化用户页面
        if ("initPage".equals(ra.getAction())) {
            //返回信息
            return JSONObject.fromObject(new ResponseMessage(0, "", ss.initPage(request.getSession().getAttribute("currentSysUser")))).toString();
            //判断是否时管理员需要初始化页面
        } else if ("getAllStudentInfo".equals(ra.getAction())) {
            //检查权限
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                //这一段出自互联网，具体原理不详
                JsonConfig jsonConfig = new JsonConfig();
                jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor() {
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年mm月dd");

                    @Override
                    public Object processArrayValue(Object o, JsonConfig jsonConfig) {
                        return simpleDateFormat.format(o);
                    }

                    @Override
                    public Object processObjectValue(String s, Object o, JsonConfig jsonConfig) {
                        if (o != null) {
                            return simpleDateFormat.format(o);
                        } else {
                            return null;
                        }
                    }
                });
                //返回信息
                return JSONObject.fromObject(new ResponseMessage(0, "", ss.getAllStudentInfo()), jsonConfig).toString();
            } else {
                return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
            }
            //判断是否时需要所有管理员信息
        } else if ("getAllAdminInfo".equals(ra.getAction())) {
            //权限检查
            if (pcs.permissionCheck(6, request)) {
                //返回所有管理员信息
                return JSONObject.fromObject(new ResponseMessage(0, "", ss.getAllAdminInfo())).toString();
            } else {
                //返回权限不足
                return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
            }
        }
        return null;
    }


    /**
     * 存入或更新用户的学生信息
     *
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/saveOrUpdateStudentInfo.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object saveOrUpdateStudentInfo(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //判断是否是需要存入或更新
        if ("sou".equals(ra.getAction())) {
            //初始化需要存入的信息
            Student student = (Student) JSONObject.toBean(JSONObject.fromObject(jsonstr), Student.class);
            student.setUserId(((SysUser) request.getSession().getAttribute("currentSysUser")).getUserId());
            //执行出入
            return JSONObject.fromObject(new ResponseMessage(0, ss.saveOrUpdateStudentInfo(student), null)).toString();
        }
        return null;
    }

    /**
     * 上传头像
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/headImgUpload.do", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public Object headImgUpload(HttpServletRequest request) {
        //检查登录状态，获取当前用户
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        //检查用户路径，没有则新建，然后返回到userPath以供使用
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        //执行存入
        return ss.headImgUpload(request, currentSysUser.getUserId(), userPath);
    }

    /**
     * 获取当前头像
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/headImg.do")
    @ResponseBody
    public String imageShow(HttpServletRequest request, HttpServletResponse response) {
        //查询当前用户路径
        String path = ups.checkUserPath(((SysUser) request.getSession().getAttribute("currentSysUser")).getUserId()) + "headImg";
        //如果头像已上传则读取
        if (!(new File(path).exists())) {
            try {
                path = java.net.URLDecoder.decode(this.getClass().getClassLoader().getResource("").getPath(), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            //如果未上传则读默认文件akari.png
            path = new File(path).getParentFile().getParentFile().getPath() + "\\img\\akari.png";
        }
        File f = new File(path);
        if (f.exists()) {
            int i = 1;
        }
        FileInputStream fis = null;
        OutputStream os = null;
        try {
            //将文件写入流
            fis = new FileInputStream(path);
            os = response.getOutputStream();
            int count = 0;
            byte[] buffer = new byte[1024 * 8];
            while ((count = fis.read(buffer)) != -1) {
                os.write(buffer, 0, count);
                os.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            fis.close();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //返回数据
        return "ok";
    }
}