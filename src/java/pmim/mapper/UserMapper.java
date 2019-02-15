package pmim.mapper;

import java.util.List;

import pmim.model.SysUser;

public interface UserMapper {
    void insertUser_register(SysUser u);

    void deleteUserById(SysUser u);

    List<SysUser> selectUserByPermission(SysUser u);

    SysUser selectUser_withNoPwd(SysUser u);

    void updateUserPath(SysUser u);
}
