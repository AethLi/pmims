package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.SysUser;
import pmim.model.RequestAction;
import pmim.service.ActivistService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/activist")
public class ActivistCtrl {

    @Autowired
    private ActivistService as;
    @Autowired
    private UserPathService ups;


    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object activistUser(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("init".equals(ra.getAction())) {
            return as.initUserPage((SysUser) request.getSession().getAttribute("currentUser"));
        }
        return null;
    }

    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        String index = (String) request.getParameter("index");
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        return as.uploadFile(request, currentSysUser.getUserId(), userPath, index);
    }

}
