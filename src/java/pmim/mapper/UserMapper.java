package pmim.mapper;

import java.util.List;

import pmim.model.SysUser;

public interface UserMapper {
    public void insertUser_register(SysUser u);

    public void deleteUserById(SysUser u);

    public List<SysUser> selectUserByPermission(SysUser u);

    public SysUser selectUser_withNoPwd(SysUser u);

    public void updateUserPath(SysUser u);
}
