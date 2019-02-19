package pmim.controller;


import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.PageAble;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;
import pmim.model.UploadInstruction;
import pmim.service.ManagerService;
import pmim.service.PermissionCheckService;

import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "/managerCtrl")
@Controller
public class ManagerCtrl {
    @Autowired
    ManagerService ms;
    @Autowired
    PermissionCheckService pcs;

    @RequestMapping(value = "/init.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object initManagerPages(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("uploadInstruction".equals(ra.getAction())) {
            if (pcs.permissionCheck(5) || pcs.permissionCheck(6)) {
                return JSONObject.fromObject(new ResponseMessage(0, "", ms.initManagerPages(Integer.valueOf(ra.getCode())))).toString();
            }
        }else if ("listOfThis".equals(ra.getAction())){
            if (pcs.permissionCheck(5) || pcs.permissionCheck(6)) {
                PageAble pa=(PageAble) JSONObject.toBean(JSONObject.fromObject(jsonstr),PageAble.class);
                return JSONObject.fromObject(new ResponseMessage(0, "", ms.initTablePages(pa))).toString();
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "权限存在问题", null)).toString();
    }

    @RequestMapping(value = "/saveUploadInstruction.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object saveUploadInstruction(HttpServletRequest request, @RequestBody String jsonstr) {
        UploadInstruction ui = (UploadInstruction) JSONObject.toBean(JSONObject.fromObject(jsonstr), UploadInstruction.class);
        if (pcs.permissionCheck(5) || pcs.permissionCheck(6)) {
            return JSONObject.fromObject(new ResponseMessage(0, ms.saveUploadInstruction(ui), null)).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(0, "权限存在问题", null)).toString();
    }
    @RequestMapping(value = "/proposer.do",produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object proposerModal(HttpServletRequest request,@RequestBody String jsonstr){
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if (pcs.permissionCheck(5) || pcs.permissionCheck(6)) {
            return JSONObject.fromObject(new ResponseMessage(0, null, ms.proposerModal(ra.getDesId()))).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(0, "权限存在问题", null)).toString();
    }
}
