package pmim.mapper;

import java.util.List;
import java.util.Map;

import pmim.model.PageAble;
import pmim.model.Proposer;
import pmim.model.SysUser;

public interface UserMapper {
    void insertUser_register(SysUser u);

    void deleteUserById(SysUser u);

    List<SysUser> selectUserByPermission(SysUser u);

    SysUser selectUser_withNoPwd(SysUser u);

    void updateUserPath(SysUser u);

    List<Map<String,Object>> selectUsersByPage(PageAble p);

    Proposer selectUsersById(SysUser u);
}
