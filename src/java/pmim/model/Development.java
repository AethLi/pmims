package pmim.model;

import java.sql.Timestamp;

public class Development {
    String developmentId;
    String userId;
    String fileName;
    Timestamp date;
    int status;
    int index;

    public String getDevelopmentId() {
        return developmentId;
    }

    public void setDevelopmentId(String developmentId) {
        this.developmentId = developmentId;
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

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
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

    public void setIndex(int index) {
        this.index = index;
    }

    public Development() {
    }

    public Development(String developmentId, String userId, String fileName, long date, int status, int index) {
        this.developmentId = developmentId;
        this.userId = userId;
        this.fileName = fileName;
        this.date = new Timestamp(date);
        this.status = status;
        this.index = index;
    }

}
