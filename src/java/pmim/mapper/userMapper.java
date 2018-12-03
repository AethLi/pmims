package pmim.mapper;

import java.util.List;

import pmim.model.user;

public interface userMapper {
    public void insertUser_register(user u);

    public void deleteUserById(user u);

    public List<user> selectUserByPermission(user u);
}
