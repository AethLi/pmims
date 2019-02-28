package pmim.service;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import pmim.mapper.StudentMapper;
import pmim.model.Proposer;
import pmim.model.ResponseMessage;
import pmim.model.Student;
import pmim.model.SysUser;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

@Service
public class StudentService {

    @Autowired
    StudentMapper studentMapper;


    public Object initPage(Object currentSysUser) {
        Student student = studentMapper.selectStudentById((SysUser) currentSysUser);
        return student;
    }

    public String saveOrUpdateStudentInfo(Student student) {
        try {
            if (studentMapper.selectStudentById(new SysUser(student.getUserId()))!=null){
                studentMapper.updateStudentById_forFill(student);
                return "更新个人资料成功";
            }else {
                studentMapper.insertStudentById_forFill(student);
                return "更新个人资料成功";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "更新失败";
        }
    }

    public Object headImgUpload(HttpServletRequest request, String userId, String userPath) {
        File filePath = new File(userPath);
        if (!filePath.exists()) {
            filePath.mkdir();
        }
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator iter = multiRequest.getFileNames();
            if (!iter.hasNext()) {
                return JSONObject.fromObject(new ResponseMessage(1, "网络错误", null)).toString();
            }
            while (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    String path = filePath.getPath() + "/" + "headImg";
                    if (new File(path).exists()){
                        new File(path).delete();
                    }
                    try {
                        file.transferTo(new File(path));

                    } catch (IOException e) {
                        e.printStackTrace();
                        return JSONObject.fromObject(new ResponseMessage(1, "上传失败", null)).toString();
                    }
                }
            }
        }
        return JSONObject.fromObject(new ResponseMessage(0, "上传成功", null)).toString();

    }
}
