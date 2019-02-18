package pmim.model;

public class UploadInstruction {
    String instruction;
    int status;
    int position;
    int index;

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public UploadInstruction(int position) {
        this.position = position;
    }

    public UploadInstruction() {
    }
}
