package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.userMapper;
import pmim.model.student;
import pmim.model.user;

@Service
public class userService {

    @Autowired
    private userMapper um;

    public String register(user u, student s) {
        um.insertUser_register(u);
        return null;
    }
}
