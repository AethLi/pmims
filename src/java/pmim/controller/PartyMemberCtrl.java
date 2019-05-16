package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;
import pmim.model.SysUser;
import pmim.service.PartyMemberService;
import pmim.service.PermissionCheckService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "/partyMember")
public class PartyMemberCtrl {
    @Autowired
    PartyMemberService pms;
    @Autowired
    UserPathService ups;
    @Autowired
    PermissionCheckService pcs;

    /**
     * 初始化当前页面
     *
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public Object partyMemberUserCtrl(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取请求内容
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("init".equals(ra.getAction())) {
            return JSONObject.fromObject(new ResponseMessage(0, "", pms.init((SysUser) request.getSession().getAttribute("currentSysUser")))).toString();
        }
        return null;
    }

    /**
     * 获取党费记录
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/getShipDues.do", produces = "text/html;charset=UTF-8")
    public Object getShipDue(HttpServletRequest request) {
        try {
            return pms.getShipDue();
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null));
        }
    }

    /**
     * 导入党费记录，类似于导入用户
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = "D:/idea project/pmims/uploadPath/dues/";
        return pms.uploadFile(request, currentSysUser.getUserId(), userPath);
    }

    /**
     * 未启用
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/getImportPartyMember", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object getImportPartyMember(HttpServletRequest request) {
        try {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return pms.getImportPartyMember();
            } else {
                return JSONObject.fromObject(new ResponseMessage(1, "权限不足", null));
            }
        } catch (Exception e) {
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null));
        }
    }

    /**
     * 同意转入
     *
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/acceptImportPartyMember.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object acceptImportPartyMember(HttpServletRequest request, @RequestBody String jsonstr) {
        try {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
                return pms.acceptImportPartyMember(ra.getDesId());
            } else {
                return JSONObject.fromObject(new ResponseMessage(1, "权限不足", null));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null));
        }
    }

    /**
     * 不同意转入
     *
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/disAcceptImportPartyMember.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object disAcceptImportPartyMember(HttpServletRequest request, @RequestBody String jsonstr) {
        try {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
                return pms.disAcceptImportPartyMember(ra.getDesId());
            } else {
                return JSONObject.fromObject(new ResponseMessage(1, "权限不足", null)).toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null)).toString();
        }
    }

    /**
     * 未启用
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/getMyImport.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object getMyImport(HttpServletRequest request) {
        try {
            return pms.getMyImport(((SysUser) request.getSession().getAttribute("currentSysUser"))).toString();
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null)).toString();
        }
    }

    /**
     * 同意转出，此处调用service层处理逻辑
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/applyForExport.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object applyForExport(HttpServletRequest request) {
        try {
            return pms.applyForExport(((SysUser) request.getSession().getAttribute("currentSysUser"))).toString();
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null)).toString();
        }
    }

    /**
     * 操作是否同意转出
     *
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "exportPartyMemberAction.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object exportPartyMemberAction(HttpServletRequest request, @RequestBody String jsonstr) {
        try {
            RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
            return pms.exportPartyMemberAction(ra);
        } catch (Exception e) {
            e.printStackTrace();
            return JSONObject.fromObject(new ResponseMessage(1, e.getMessage(), null));
        }
    }
}
