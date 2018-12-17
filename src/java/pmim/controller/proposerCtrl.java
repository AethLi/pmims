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

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

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

    @RequestMapping(value = "fileUpload")
    public @ResponseBody Object fileUpload(HttpServletRequest request) {
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();

            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    String path="D:/idea project/pmims/uploadPath"+file.getOriginalFilename();
                    //上传
                    try {
                        file.transferTo(new File(path));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

            }

        }
        return null;
    }
}
