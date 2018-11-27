package pmim.model;

public class user {
	private String id;
	private String password;
	private int permission;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public user(String id) {
		super();
		this.id = id;
	}

	public user() {
		super();
	}

}
