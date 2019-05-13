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

    public String checkUserPath(String userId) {
        SysUser currentSysUser = new SysUser(userId);
        currentSysUser = um.selectUser_withNoPwd(currentSysUser);
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
            File file = new File("D:/idea project/pmims/uploadPath/" + userPath + "/");
            if (!file.exists()) {
                file.mkdir();
            }
            return file.getPath() + "/";
        } else {
            return "D:/idea project/pmims/uploadPath/" + currentSysUser.getUserPath() + "/";
        }
    }

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
