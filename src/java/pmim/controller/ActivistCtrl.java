package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.requestAction;
import pmim.model.user;
import pmim.service.ActivistService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/activist")
public class ActivistCtrl {

    @Autowired
    ActivistService as;

    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object activistUser(HttpServletRequest request, @RequestBody String jsonstr) {
        requestAction ra = (requestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), requestAction.class);
        if ("init".equals(ra.getAction())) {
            return as.initUserPage((user) request.getSession().getAttribute("currentUser"));
        }
        return null;
    }
}
