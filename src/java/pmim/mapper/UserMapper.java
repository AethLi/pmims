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

    List<Map<String, Object>> selectUsersByPage(PageAble p);

    Proposer selectUsersById(SysUser u);

    void updateUserById(SysUser u);

    void changePassword(SysUser u);

    void update2Proposer(SysUser u);

    void update2Activist(SysUser u);

    void update2Development(SysUser u);

    void update2Probationary(SysUser u);

    void update2PartyMember(SysUser u);
}
