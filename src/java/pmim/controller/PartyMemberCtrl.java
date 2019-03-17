package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;
import pmim.model.SysUser;
import pmim.service.PartyMemberService;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "/partyMember")
public class PartyMemberCtrl {
    @Autowired
    PartyMemberService pms;

    @RequestMapping(value = "/user.do")
    public Object partyMemberUserCtrl(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("init".equals(ra.getAction())) {
            return JSONObject.fromObject(new ResponseMessage(0, "", pms.init((SysUser) request.getSession().getAttribute("currentSysUser")))).toString();
        }
        return null;
    }

}
