package pmim.model;

import java.sql.Timestamp;

public class Probationary {
    String ProbationaryId;
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

    public String getProbationaryId() {
        return ProbationaryId;
    }

    public void setProbationaryId(String ProbationaryId) {
        this.ProbationaryId = ProbationaryId;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Probationary(String ProbationaryId) {
        this.ProbationaryId = ProbationaryId;
    }

    public Probationary() {
    }

    public Probationary(String ProbationaryId, String userId, String fileName, long date, int status, int type) {
        this.ProbationaryId = ProbationaryId;
        this.userId = userId;
        this.fileName = fileName;
        this.date = new Timestamp(date);
        this.status = status;
        this.index = type;
    }

    public Probationary(String userId, int status) {
        this.userId = userId;
        this.status = status;
    }
}
