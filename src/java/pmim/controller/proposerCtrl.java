package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import pmim.model.requestAction;
import pmim.model.user;
import pmim.service.proposerService;
import pmim.service.userPathService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

@RequestMapping(value = "/proposer")
@Controller
public class proposerCtrl {

    @Autowired
    private proposerService ps;
    @Autowired
    private userPathService ups;

    @RequestMapping(value = "/user.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object proposerUserCtrl(HttpServletRequest request, @RequestBody String jsonstr, Model model) {
        requestAction ra = (requestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), requestAction.class);
        if ("initProposerUserPage".equals(ra.getAction())) {
            return ps.initProposerUserPage((user) request.getSession().getAttribute("currentUser"));
        }
        return null;
    }

    @RequestMapping(value = "/fileUpload.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object fileUpload(HttpServletRequest request) {
        user currentUser = (user) request.getSession().getAttribute("currentUser");
        String userPath = ups.checkUserPath(currentUser.getUserId());
        return ps.uploadFile(request, currentUser.getUserId(), userPath);
    }


//    @RequestMapping(value = "fileUpload")
//    public @ResponseBody
//    Object fileUpload(HttpServletRequest request, @RequestParam("fileInfo") MultipartFile fileInfo) {
//
//        return null;
//    }

}
