package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;
import pmim.service.ManagerService;
import pmim.service.PermissionCheckService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/manager")
public class ManagerCtrl {
    @Autowired
    ManagerService ms;
    @Autowired
    PermissionCheckService pcs;

    @RequestMapping(value = "/init.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody Object initManagerPages(HttpServletRequest request, @RequestBody String jsonstr){
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if (pcs.permissionCheck(5)||pcs.permissionCheck(6)){
            if ("0".equals(ra.getCode())){
                return JSONObject.fromObject(new ResponseMessage(0,"",ms.initProposer())).toString();
            }
        }
        return null;
    }
}
