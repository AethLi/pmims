package pmim.service;

import org.apache.commons.math3.random.RandomDataGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.studentMapper;
import pmim.mapper.userMapper;
import pmim.model.student;
import pmim.model.user;

import java.rmi.server.RMIClassLoaderSpi;
import java.util.Calendar;

@Service
public class userPathService {

    @Autowired
    userMapper um;
    @Autowired
    studentMapper sm;

    public String checkUserPath(String userId, int type) {
        user currentUser = new user(userId);
        switch (type) {
            case 0:
                um.selectUser_withNoPwd(currentUser);
                if (currentUser.getUserPath() == null) {
                    student currentStudent = sm.selectStudentById(currentUser);
                    String userPath = currentStudent.getName() + currentUser.getUserId() + Calendar.getInstance().get(Calendar.YEAR) + Calendar.getInstance().get(Calendar.MONTH) + (new RandomDataGenerator()).nextInt(0, 100);
                    currentUser.setUserPath(userPath);
                    um.updateUserPath(currentUser);
                    return userPath;
                }else {
                    return currentUser.getUserPath();
                }
        }
        return null;
    }
}
