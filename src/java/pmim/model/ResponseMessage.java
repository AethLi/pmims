package pmim.model;

public class ResponseMessage {
    int status;//状态：用作标识处理此次请求的结果的状态，0为请求处理成功，1为处理失败
    String message;//信息：用作简述此次请求的结果
    Object model;//数据，用作存储此次 请求的数据

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

    public ResponseMessage(int status, String message, Object model) {
        this.status = status;
        this.message = message;
        this.model = model;
    }

    public ResponseMessage() {
    }
}
