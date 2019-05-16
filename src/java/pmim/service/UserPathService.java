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
        //获取当前用户的user信息存在sysuser
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
            //对用户的userID进行md5加密
            String userPath = Tools.toMD5(currentSysUser.getUserId()) + currentSysUser.getUserId() + "_" + Calendar.getInstance().get(Calendar.YEAR) + (new RandomDataGenerator()).nextInt(0, 100);
           //为当前系统用户设置文件存储路径
            currentSysUser.setUserPath(userPath);
            //更新用户在数据库的存储路径
            um.updateUserPath(currentSysUser);
            //在本地创建目录
            File file = new File("D:/idea project/pmims/uploadPath/" + userPath + "/");
            //判断路径不存在
            if (!file.exists()) {
                //创建文件夹
                file.mkdir();
            }
            //返回路径
            return file.getPath() + "/";
        } else {
            //返回路径
            File file=new File("D:/idea project/pmims/uploadPath/"+currentSysUser.getUserPath()+"/");
            if(!file.exists()){
                file.mkdir();
            }
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
