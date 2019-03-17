package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.UserMapper;
import pmim.model.SysUser;

import java.sql.Date;
import java.util.List;

@Service
public class PartyMemberService {
    @Autowired
    UserMapper userMapper;

    public Object init(SysUser currentSysUser) {
        if (currentSysUser.getUserPermission() == 5 || currentSysUser.getUserPermission() == 6) {
            List<SysUser> users = userMapper.selectUserByPermission(new SysUser("", 4, 0));
            return users;
        } else if (currentSysUser.getUserPermission() == 4) {
            SysUser thisUser = userMapper.selectUser_withNoPwd(currentSysUser);
            return getDatePoor(System.currentTimeMillis(), thisUser.getPartyMemberDate().getTime());
        }
        return null;
    }

    public String getDatePoor(long l1, long l2) {
        Date endDate = new Date(l1);
        Date nowDate = new Date(l2);
        long nd = 1000 * 24 * 60 * 60;
        long diff = endDate.getTime() - nowDate.getTime();
        long day = diff / nd;
        return String.valueOf(day);
    }
}
