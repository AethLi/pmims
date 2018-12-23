package pmim.model;

import java.sql.Timestamp;

public class proposer {
    String proposerId;
    String userId;
    String fileName;
    Timestamp date;
    int status;
    int type;

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

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public proposer() {
    }

    public String getProposerId() {
        return proposerId;
    }

    public void setProposerId(String proposerId) {
        this.proposerId = proposerId;
    }

    public proposer(String proposerId, String userId, String fileName, long date, int status, int type) {
        this.proposerId = proposerId;
        this.userId = userId;
        this.fileName = fileName;
        this.date = new Timestamp(date);
        this.status = status;
        this.type = type;
    }
}
