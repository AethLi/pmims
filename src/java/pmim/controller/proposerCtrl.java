package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.requestAction;
import pmim.model.user;
import pmim.service.proposerService;

import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "/proposer")
@Controller
public class proposerCtrl {

    @Autowired
    private proposerService ps;

    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody Object proposerUserCtrl(HttpServletRequest request, @RequestBody String jsonstr, Model model) {
        requestAction ra = (requestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), requestAction.class);
        if ("initProposerUserPage".equals(ra.getAction())) {
            return ps.initProposerUserPage((user) request.getSession().getAttribute("currentUser"));

        }
        return null;
    }
}
