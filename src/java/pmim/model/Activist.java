package pmim.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Activist {
    String activistId;
    String userId;
    String fileName;
    Timestamp date;
    int status;
    int index;


    public String getActivistId() {
        return activistId;
    }

    public void setActivistId(String activistId) {
        this.activistId = activistId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setDate(long date) {
        this.date = new Timestamp(date);
    }


    public Timestamp getDate() {
        return date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public Activist() {
    }

    public Activist(String activistId, String userId, String fileName, long date, int status, int index) {
        this.activistId = activistId;
        this.userId = userId;
        this.fileName = fileName;
        this.date = new Timestamp(date);
        this.status = status;
        this.index = index;
    }

    public Activist(String userId, int status) {
        this.userId = userId;
        this.status = status;
    }
}
