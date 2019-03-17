package pmim.model;

import java.sql.Timestamp;

public class SysUser {
    String userId;
    int userPermission;
    String userPwd;
    int status;
    String userPath;
    Timestamp proposerDate;
    Timestamp activistDate;
    Timestamp developmentDate;
    Timestamp probationaryDate;
    Timestamp partyMemberDate;
    Timestamp registerDate;

    public Timestamp getProposerDate() {
        return proposerDate;
    }

    public void setProposerDate(Timestamp proposerDate) {
        this.proposerDate = proposerDate;
    }

    public Timestamp getActivistDate() {
        return activistDate;
    }

    public void setActivistDate(Timestamp activistDate) {
        this.activistDate = activistDate;
    }

    public Timestamp getDevelopmentDate() {
        return developmentDate;
    }

    public void setDevelopmentDate(Timestamp developmentDate) {
        this.developmentDate = developmentDate;
    }

    public Timestamp getProbationaryDate() {
        return probationaryDate;
    }

    public void setProbationaryDate(Timestamp probationaryDate) {
        this.probationaryDate = probationaryDate;
    }

    public Timestamp getPartyMemberDate() {
        return partyMemberDate;
    }

    public Timestamp getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Timestamp registerDate) {
        this.registerDate = registerDate;
    }

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

    public void setPartyMemberDate(Timestamp partyMemberDate) {
        this.partyMemberDate = partyMemberDate;
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

    public SysUser(String userId, int userPermission, int status) {
        this.userId = userId;
        this.userPermission = userPermission;
        this.status = status;
    }
}
