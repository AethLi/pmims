package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import pmim.model.SysUser;
import pmim.service.ProbationaryService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "/probationary")
@Controller
public class ProbationaryCtrl {
    @Autowired
    UserPathService ups;
    @Autowired
    ProbationaryService ps;

    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object activistUser(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("initProbationaryUserPage".equals(ra.getAction())) {
            return ps.initUserPage((SysUser) request.getSession().getAttribute("currentUser"));
        } else if ("getFileList".equals(ra.getAction())) {
            return ps.getFileList((SysUser) request.getSession().getAttribute("currentSysUser"));
        }
        return null;
    }

    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        String index = request.getParameter("index");
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        return ps.uploadFile(request, currentSysUser.getUserId(), userPath, index);
    }
}
