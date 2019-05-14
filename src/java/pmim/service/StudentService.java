package pmim.service;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import pmim.mapper.StudentMapper;
import pmim.model.ResponseMessage;
import pmim.model.Student;
import pmim.model.SysUser;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
public class StudentService {

    @Autowired
    StudentMapper studentMapper;


    /**
     * 获取当前学生信息以初始化userOverview页
     *
     * @param currentSysUser
     * @return
     */
    public Object initPage(Object currentSysUser) {
        //根据Id查询学生信息
        Student student = studentMapper.selectStudentById((SysUser) currentSysUser);
        return student;
    }

    public String saveOrUpdateStudentInfo(Student student) {
        try {
            //判断是否已经填写过，如果未填写过则插入
            if (studentMapper.selectStudentById(new SysUser(student.getUserId())) != null) {
                studentMapper.updateStudentById_forFill(student);
                return "更新个人资料成功";
                //如果已填写过则更新
            } else {
                studentMapper.insertStudentById_forFill(student);
                return "更新个人资料成功";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "更新失败";
        }
    }

    /**
     * 头像上传
     *
     * @param request
     * @param userId   学生Id
     * @param userPath 文件存入磁盘的路径
     * @return
     */
    public Object headImgUpload(HttpServletRequest request, String userId, String userPath) {
        //检查文件路径是否存在
        File filePath = new File(userPath);
        if (!filePath.exists()) {
            filePath.mkdir();
        }
        //获取Multipart解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取multipart文件迭代器
            Iterator iter = multiRequest.getFileNames();
            //遍历multipart文件
            if (!iter.hasNext()) {
                //不存在文件则返回错误
                return JSONObject.fromObject(new ResponseMessage(1, "网络错误", null)).toString();
            }
            //存在文件则写入磁盘
            while (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    String path = filePath.getPath() + "/" + "headImg";
                    //判断头像是否已上传过，如果已上传过则删除
                    if (new File(path).exists()) {
                        new File(path).delete();
                    }
                    try {
                        //写入文件
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

    /**
     * 获取全部学生信息列表
     *
     * @return
     */
    public Object getAllStudentInfo() {
        List<Map<String, Object>> result = null;
        result = studentMapper.selectAllStudent_forAdminPage();
        return result;
    }

    /**
     * 获取全部管理员列表
     *
     * @return
     */
    public Object getAllAdminInfo() {
        List<Map<String, Object>> result = null;
        result = studentMapper.selectAllAdmin_forAdminPage();
        return result;
    }
}
