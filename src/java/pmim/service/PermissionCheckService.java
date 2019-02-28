package pmim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pmim.mapper.UserMapper;
import pmim.model.SysUser;

import javax.servlet.http.HttpServletRequest;

@Service
public class PermissionCheckService {
    @Autowired
    UserMapper userMapper;
    public boolean permissionCheck(int desPermission, HttpServletRequest request){
        try {
            SysUser user= userMapper.selectUser_withNoPwd((SysUser) request.getSession().getAttribute("currentSysUser"));
            if (user.getUserPermission()==desPermission) {
                return true;
            }
            return false;
        }catch (Exception e){
            return false;
        }
    }
}
