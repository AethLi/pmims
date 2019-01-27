package pmim.model;

public class SysUser {
    String userId;
    int userPermission;
    String userPwd;
    int status;
    String userPath;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getUserPermission() {
        return userPermission;
    }

    public void setUserPermission(int userPermission) {
        this.userPermission = userPermission;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getUserPath() {
        return userPath;
    }

    public void setUserPath(String userPath) {
        this.userPath = userPath;
    }

    public SysUser(String userId) {
        this.userId = userId;
    }

    public SysUser() {
    }
}
