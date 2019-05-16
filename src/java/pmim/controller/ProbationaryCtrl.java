package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import pmim.model.SysUser;
import pmim.service.ProbationaryService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;
//用户的预备党员相关请求
@RequestMapping(value = "/probationary")
@Controller
public class ProbationaryCtrl {
    @Autowired
    UserPathService ups;
    @Autowired
    ProbationaryService ps;

    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object probationaryUser(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取请求内容
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //判断是否是初始化用户页面
        if ("initProbationaryUserPage".equals(ra.getAction())) {
            return ps.initUserPage((SysUser) request.getSession().getAttribute("currentSysUser"));
            //判读是否是初始化文件列表
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
        //取出上传的是本页的哪一个文件
        String index = request.getParameter("index");
        //获取文件该保存的路径
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        //调用ps.uploadFile将文件存入磁盘
        return ps.uploadFile(request, currentSysUser.getUserId(), userPath, index);
    }

    @RequestMapping(value = "/fileDelete.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileDelete(HttpServletRequest request, @RequestBody String jsonstr) {
        //获取当前登录用户
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        //获取当前请求信息
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        //执行ps.deleteFile方法进行删除
        return ps.deleteFile(ra.getDesId(), currentSysUser);
    }
}
