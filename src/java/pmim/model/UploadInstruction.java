package pmim.model;

public class UploadInstruction {
    String instruction;
    String status;
    Integer position;
    Integer index;

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public UploadInstruction(Integer position) {
        this.position = position;
    }

    public UploadInstruction() {
    }
}
