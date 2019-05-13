package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import pmim.model.SysUser;
import pmim.service.ActivistService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;

//用户的积极分子相关的请求
@Controller
@RequestMapping(value = "/activist")
public class ActivistCtrl {

    @Autowired
    private ActivistService as;
    @Autowired
    private UserPathService ups;

    /**
     * 初始化页面（获取文件列表，获取上传说明）
     *
     * @param request 请求 用作获取当前登录的用户的基础信息(SysUser) request.getSession().getAttribute("currentSysUser")
     * @param jsonstr json数据字符串 获取此次请求所包含的数据包JSONObject.toBean(JSONObject.fromObject（jsonstr）,object.class)
     * @return
     */
    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object activistUser(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("initActivistUserPage".equals(ra.getAction())) {
            return as.initUserPage((SysUser) request.getSession().getAttribute("currentSysUser"));
        } else if ("getFileList".equals(ra.getAction())) {
            return as.getFileList((SysUser) request.getSession().getAttribute("currentSysUser"));
        }
        return null;
    }

    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        String index = request.getParameter("index");
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        return as.uploadFile(request, currentSysUser.getUserId(), userPath, index);
    }

    @RequestMapping(value = "/fileDelete.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileDelete(HttpServletRequest request, @RequestBody String jsonstr) {
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        return as.deleteFile(ra.getDesId(), currentSysUser);
    }
}
