package pmim.model;

import java.sql.Timestamp;

public class ImportedPartyMember {
    String id;
    String userId;
    String fileName;
    Timestamp date;
    Integer status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public ImportedPartyMember() {
    }

    public ImportedPartyMember(String id, String userId, String fileName, Timestamp date, Integer status) {
        this.id = id;
        this.userId = userId;
        this.fileName = fileName;
        this.date = date;
        this.status = status;
    }
}
