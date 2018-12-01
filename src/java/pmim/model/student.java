package pmim.model;

import java.sql.Timestamp;

public class student {
    String userId;
    String classinfo;
    int sex;
    Timestamp birthday;
    String homeAddress;
    int status;
    String IDcardNum;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getClassinfo() {
        return classinfo;
    }

    public void setClassinfo(String classinfo) {
        this.classinfo = classinfo;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public Timestamp getBirthday() {
        return birthday;
    }

    public void setBirthday(Timestamp birthday) {
        this.birthday = birthday;
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getIDcardNum() {
        return IDcardNum;
    }

    public void setIDcardNum(String IDcardNum) {
        this.IDcardNum = IDcardNum;
    }
}
