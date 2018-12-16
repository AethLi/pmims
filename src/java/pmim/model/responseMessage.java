package pmim.model;

public class responseMessage {
    int status;
    String message;
    Object model;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getModel() {
        return model;
    }

    public void setModel(Object model) {
        this.model = model;
    }

    public responseMessage(int status, String message, Object model) {
        this.status = status;
        this.message = message;
        this.model = model;
    }

    public responseMessage() {
    }
}
