package pmim.model;

public class resposeMessage {
    String message;
    Object model;

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

    public resposeMessage(String message, Object model) {
        this.message = message;
        this.model = model;
    }

    public resposeMessage() {
    }
}
