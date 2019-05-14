package pmim.service;

import org.apache.commons.math3.random.RandomDataGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.ProposerMapper;
import pmim.mapper.StudentMapper;
import pmim.mapper.UserMapper;
import pmim.model.Student;
import pmim.model.SysUser;
import pmim.tools.Tools;

import java.io.File;
import java.util.Calendar;

@Service
public class UserPathService {

    @Autowired
    UserMapper um;
    @Autowired
    StudentMapper sm;
    @Autowired
    ProposerMapper pm;

    /**
     * 生成或获取用户上传文件路径
     * @param userId
     * @return
     */
    public String checkUserPath(String userId) {
        //获取当前用户的user信息
        SysUser currentSysUser = new SysUser(userId);
        currentSysUser = um.selectUser_withNoPwd(currentSysUser);
        //无已生成目录时重新生成一个随机目录，写入数据库
        if (currentSysUser.getUserPath() == null) {
//            Student currentStudent = sm.selectStudentById(currentSysUser);
//            if (currentStudent == null) {
//                Student student = new Student();
//                student.setUserId(currentSysUser.getUserId());
//                sm.insertStudent(student);
//            }
            String userPath = Tools.toMD5(currentSysUser.getUserId()) + currentSysUser.getUserId() + "_" + Calendar.getInstance().get(Calendar.YEAR) + (new RandomDataGenerator()).nextInt(0, 100);
            currentSysUser.setUserPath(userPath);
            um.updateUserPath(currentSysUser);
            //创建目录
            File file = new File("D:/idea project/pmims/uploadPath/" + userPath + "/");
            if (!file.exists()) {
                file.mkdir();
            }
            //返回路径
            return file.getPath() + "/";
        } else {
            //返回路径
            return "D:/idea project/pmims/uploadPath/" + currentSysUser.getUserPath() + "/";
        }
    }

    //获取扩展名，未启用该方法
    public String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }
}
