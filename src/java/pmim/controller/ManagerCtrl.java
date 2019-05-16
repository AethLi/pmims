package pmim.controller;


import jdk.nashorn.internal.ir.IfNode;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    //初始化管理页面，包含各个页面的上传说明和用户
    @RequestMapping(value = "/init.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object initManagerPages(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //获取上传说明
        if ("uploadInstruction".equals(ra.getAction())) {
            //判断权限是否正确
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
            // 调用initManagerPages获取上传说明
                return JSONObject.fromObject(new ResponseMessage(0, "", ms.initManagerPages(Integer.valueOf(ra.getCode())))).toString();
            }
            //获取该页学生列表
        } else if ("listOfThis".equals(ra.getAction())) {
            //判断权限是否正确
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                //获取按页加载数据，实际未实现
                PageAble pa = (PageAble) JSONObject.toBean(JSONObject.fromObject(jsonstr), PageAble.class);
                //调用initTablePages获取学生列表
                return JSONObject.fromObject(new ResponseMessage(0, "", ms.initTablePages(  pa, request))).toString();
            }
        }
        //返回权限错误信息
        return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
    }

    /**
     * 保存管理员的上传说明
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/saveUploadInstruction.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object saveUploadInstruction(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取此次填写的上传说明信息
        UploadInstruction ui = (UploadInstruction) JSONObject.toBean(JSONObject.fromObject(jsonstr), UploadInstruction.class);
        //判断权限是否正确
        if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
            //调用saveUploadInstruction（）保存上传说明
            return JSONObject.fromObject(new ResponseMessage(0, ms.saveUploadInstruction(ui), null)).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
    }

    @RequestMapping(value = "/proposer.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object proposerModal(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取请求模型
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //判断是否是通过此文件
        if ("accept".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                //调用acceptItem通过文件
                return JSONObject.fromObject(new ResponseMessage(0, ms.acceptItem(ra.getDesId(), 0), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

            //判断是否是不通过此文件
        } else if ("disAccept".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.disAcceptItem(ra.getDesId(), 0), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
            //判断是否是删除此文件，实际未使用
        } else if ("delete".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.deleteItem(ra.getDesId(), 0), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
            //获取此人的student信息和上传了哪些文件
        } else if ("modal".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, null, ms.proposerModal(ra.getDesId()))).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
        }
        //请求内容错误的时候返回此信息
        return JSONObject.fromObject(new ResponseMessage(0, "请求错误", null)).toString();
    }

    @RequestMapping(value = "/activist.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object activistModal(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("accept".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.acceptItem(ra.getDesId(), 1), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("disAccept".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.disAcceptItem(ra.getDesId(), 1), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("delete".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.deleteItem(ra.getDesId(), 1), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("modal".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, null, ms.activistModal(ra.getDesId()))).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
    }

    @RequestMapping(value = "/development.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object developmentModal(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("accept".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.acceptItem(ra.getDesId(), 2), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("disAccept".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.disAcceptItem(ra.getDesId(), 2), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("delete".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.deleteItem(ra.getDesId(), 2), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("modal".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, null, ms.developmentModal(ra.getDesId()))).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
    }

    @RequestMapping(value = "/probationary.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object probationaryModal(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("accept".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.acceptItem(ra.getDesId(), 3), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("disAccept".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.disAcceptItem(ra.getDesId(), 3), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("delete".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, ms.deleteItem(ra.getDesId(), 3), null)).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();

        } else if ("modal".equals(ra.getAction())) {
            if (pcs.permissionCheck(5, request) || pcs.permissionCheck(6, request)) {
                return JSONObject.fromObject(new ResponseMessage(0, null, ms.probationaryModal(ra.getDesId()))).toString();
            }
            return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
    }

    /**
     * 管理员变更
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/admin.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object adminCtrl(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取请求信息
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //判断权限
        if (pcs.permissionCheck(6, request)) {
           //新增管理员
            if ("insert".equals(ra.getAction())) {
                ms.insertAdmin(ra.getDesId());
            //切换管理员的启用状态
            } else if ("update".equals(ra.getAction())) {
                ms.updateAdmin(ra.getDesId(), ra.getCode());
            //删除管理员
            } else if ("delete".equals(ra.getAction())) {
                ms.deleteAdmin(ra.getDesId());
            }
            return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null)).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
    }

    /**
     * 通过申请
     * @param request
     * @param jsonstr
     * @return
     */
    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object userCtrl(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if (pcs.permissionCheck(6, request)) {
            //判断是否是通过某人的申请
            if ("accept".equals(ra.getAction())) {
                ms.levelUpUser(ra.getDesId(), ra.getCode());
                //判断是否是驳回的请求，未实现
            } else if ("disAccept".equals(ra.getAction())) {
                //判断是否是删除某人的，实际在userCtrl中实现并使用了
            } else if ("delete".equals(ra.getAction())) {

            }
            return JSONObject.fromObject(new ResponseMessage(0, "操作成功", null)).toString();
        }
        return JSONObject.fromObject(new ResponseMessage(1, "权限存在问题", null)).toString();
    }
}
