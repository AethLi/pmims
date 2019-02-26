package pmim.model;

import java.sql.Timestamp;

public class Probationary {
    String ProbationaryId;
    String userId;
    String fileName;
    Timestamp date;
    int status;
    int index;

    public String getProbationaryId() {
        return ProbationaryId;
    }

    public void setProbationaryId(String probationaryId) {
        ProbationaryId = probationaryId;
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

    public int getStatus() {
        return status;
    }

    public void setDate(long date) {
        this.date = new Timestamp(date);
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

    public Probationary() {
    }

    public Probationary(String probationaryId, String userId, String fileName, long date, int status, int index) {
        ProbationaryId = probationaryId;
        this.userId = userId;
        this.fileName = fileName;
        this.date = new Timestamp(date);
        this.status = status;
        this.index = index;
    }

    public Probationary(String userId, int status) {
        this.userId = userId;
        this.status = status;
    }

    public Probationary(String probationaryId) {
        ProbationaryId = probationaryId;
    }
}
