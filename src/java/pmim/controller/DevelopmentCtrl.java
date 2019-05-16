package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import pmim.model.SysUser;
import pmim.service.DevelopmentService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "/development")
@Controller
public class DevelopmentCtrl {
    @Autowired
    UserPathService ups;
    @Autowired
    DevelopmentService ds;

    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object developmentUser(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("initDevelopmentUserPage".equals(ra.getAction())) {
            return ds.initUserPage((SysUser) request.getSession().getAttribute("currentSysUser"));
        } else if ("getFileList".equals(ra.getAction())) {
            return ds.getFileList((SysUser) request.getSession().getAttribute("currentSysUser"));
        }
        return null;
    }

    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        String index = request.getParameter("index");
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        return ds.uploadFile(request, currentSysUser.getUserId(), userPath, index);
    }
    @RequestMapping(value = "/fileDelete.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileDelete(HttpServletRequest request, @RequestBody String jsonstr) {
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        return ds.deleteFile(ra.getDesId(), currentSysUser);
    }
}
