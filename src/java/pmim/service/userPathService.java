package pmim.service;

import org.apache.commons.math3.random.RandomDataGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.proposerMapper;
import pmim.mapper.studentMapper;
import pmim.mapper.userMapper;
import pmim.model.proposer;
import pmim.model.student;
import pmim.model.user;
import pmim.tools.tools;

import java.io.File;
import java.rmi.server.RMIClassLoaderSpi;
import java.util.Calendar;

@Service
public class userPathService {

    @Autowired
    userMapper um;
    @Autowired
    studentMapper sm;
    @Autowired
    proposerMapper pm;

    public String checkUserPath(String userId) {
        user currentUser = new user(userId);
        currentUser = um.selectUser_withNoPwd(currentUser);
        if (currentUser.getUserPath() == null) {
            student currentStudent = sm.selectStudentById(currentUser);
            String userPath = tools.toMD5(currentStudent.getName()) + currentUser.getUserId() + "_" + Calendar.getInstance().get(Calendar.YEAR) + (new RandomDataGenerator()).nextInt(0, 100);
            currentUser.setUserPath(userPath);
            um.updateUserPath(currentUser);
            File file = new File("D:/idea project/pmims/uploadPath/" + userPath + "/");
            if (!file.exists()) {
                file.mkdir();
            }
            return file.getPath()+"/";
        } else {
            return "D:/idea project/pmims/uploadPath/" + currentUser.getUserPath() + "/";
        }
    }
}
