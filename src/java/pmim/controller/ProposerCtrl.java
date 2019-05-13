package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import pmim.model.SysUser;
import pmim.service.ProposerService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;
//用户申请人相关请求
@RequestMapping(value = "/proposer")
@Controller
public class ProposerCtrl {

    @Autowired
    private ProposerService ps;
    @Autowired
    private UserPathService ups;

    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object proposerUserCtrl(HttpServletRequest request, @RequestBody String jsonstr, Model model) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("initProposerUserPage".equals(ra.getAction())) {
            return ps.initUserPage((SysUser) request.getSession().getAttribute("currentSysUser"));
        } else if ("getFileList".equals(ra.getAction())) {
            return ps.getFileList((SysUser) request.getSession().getAttribute("currentSysUser"));
        }
        return null;
    }

    /**
     * 上传文件的代码实现
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        //获取文件该保存的路径
        String index = request.getParameter("index");
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        //调用ps.uploadFile将文件存入磁盘
        return ps.uploadFile(request, currentSysUser.getUserId(), userPath, index);
    }

    @RequestMapping(value = "/fileDelete.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileDelete(HttpServletRequest request, @RequestBody String jsonstr) {
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        return ps.deleteFile(ra.getDesId(), currentSysUser);
    }
}
