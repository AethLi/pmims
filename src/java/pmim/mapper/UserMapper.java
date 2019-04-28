package pmim.mapper;

import pmim.model.PageAble;
import pmim.model.SysUser;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    void insertUser_register(SysUser u);

    void deleteUserById(SysUser u);

    List<SysUser> selectUserByPermission(SysUser u);

    SysUser selectUser_withNoPwd(SysUser u);

    void updateUserPath(SysUser u);

    List<Map<String, Object>> selectUsersByPage(PageAble p);

    SysUser selectUsersById(Map m);

    void updateUserById(SysUser u);

    void changePassword(SysUser u);

    void update2Proposer(SysUser u);

    void update2Activist(SysUser u);

    void update2Development(SysUser u);

    void update2Probationary(SysUser u);

    void update2PartyMember(SysUser u);

    void addAdmin(SysUser user);

    SysUser selectByUserId_Name(Map map);

    void updatePermissionById(SysUser user);
}
