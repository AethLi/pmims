package pmim.mapper;

import java.util.List;

import pmim.model.user;

public interface userMapper {
	public void insertuser(user u);

	public List<user> selectAlluser();

	public void deleteAlluser();

	public List<user> selectuser(user u);

	public List<user> selectuser_Nopasswd(user u);

	public void delectuser(user u);
}
