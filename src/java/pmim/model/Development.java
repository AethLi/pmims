package pmim.model;

import java.sql.Timestamp;

public class Development {
    String DevelopmentId;
    String userId;
    String fileName;
    Timestamp date;
    int status;
    int index;

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

    public Timestamp getDate() {
        return date;
    }

    public void setDate(long date) {
        this.date = new Timestamp(date);
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

    public void setIndex(int type) {
        this.index = type;
    }

    public String getDevelopmentId() {
        return DevelopmentId;
    }

    public void setDevelopmentId(String DevelopmentId) {
        this.DevelopmentId = DevelopmentId;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Development(String DevelopmentId) {
        this.DevelopmentId = DevelopmentId;
    }

    public Development() {
    }

    public Development(String DevelopmentId, String userId, String fileName, long date, int status, int type) {
        this.DevelopmentId = DevelopmentId;
        this.userId = userId;
        this.fileName = fileName;
        this.date = new Timestamp(date);
        this.status = status;
        this.index = type;
    }

    public Development(String userId, int status) {
        this.userId = userId;
        this.status = status;
    }
}
