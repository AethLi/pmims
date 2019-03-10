package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "/partyMember")
public class partyMember {
    @RequestMapping(value = "/user.do")
    public Object partyMemberUserCtrl(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("init".equals(ra.getAction())){
//            return JSONObject.fromObject(new ResponseMessage(0,))
        }
        return null;
    }

}
