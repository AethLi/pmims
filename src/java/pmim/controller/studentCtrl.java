package pmim.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pmim.model.RequestAction;
import pmim.model.ResponseMessage;
import pmim.model.Student;
import pmim.model.SysUser;
import pmim.service.StudentService;
import pmim.service.UserPathService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@RequestMapping(value = "/student")
@Controller
public class studentCtrl {
    @Autowired
    StudentService ss;
    @Autowired
    UserPathService ups;

    @RequestMapping(value = "/studentInfo.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object studentInfo(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("initPage".equals(ra.getAction())) {
            return JSONObject.fromObject(new ResponseMessage(0, "", ss.initPage(request.getSession().getAttribute("currentSysUser")))).toString();
        }
        return null;
    }

    @RequestMapping(value = "/saveOrUpdateStudentInfo.do", produces = "text/html;charset=UTF-8")
    public @ResponseBody
    Object saveOrUpdateStudentInfo(HttpServletRequest request, @RequestBody String jsonstr) {
        RequestAction ra = (RequestAction) JSONObject.toBean(JSONObject.fromObject(jsonstr), RequestAction.class);
        if ("sou".equals(ra.getAction())) {
            Student student = (Student) JSONObject.toBean(JSONObject.fromObject(jsonstr), Student.class);
            student.setUserId(((SysUser) request.getSession().getAttribute("currentSysUser")).getUserId());
            return JSONObject.fromObject(new ResponseMessage(0, ss.saveOrUpdateStudentInfo(student), null)).toString();
        }
        return null;
    }

    @RequestMapping(value = "/headImgUpload.do", produces = "text/html;charset=UTF-8")
    public Object headImgUpload(HttpServletRequest request){
        SysUser currentSysUser = (SysUser) request.getSession().getAttribute("currentSysUser");
        String userPath = ups.checkUserPath(currentSysUser.getUserId());
        return ss.headImgUpload(request, currentSysUser.getUserId(), userPath);
    }

    @RequestMapping(value = "/imageShow.do", method = RequestMethod.GET)
    @ResponseBody
    public String imageShow(HttpServletRequest request, HttpServletResponse response) {
        String path = ups.checkUserPath((String) request.getSession().getAttribute("currentSysUser"))+"headImg";
        FileInputStream fis = null;
        OutputStream os = null;
        try {
            fis = new FileInputStream(path);
            os = response.getOutputStream();
            int count = 0;
            byte[] buffer = new byte[1024 * 8];
            while ((count = fis.read(buffer)) != -1) {
                os.write(buffer, 0, count);
                os.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            fis.close();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ok";
    }
}