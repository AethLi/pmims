package pmim.model;

//返回模型,用作简单解析请求的内容
public class RequestAction {
    String action;//标识此次请求实际是要做什么
    String resId;//源Id
    String desId;//目标Id
    String code;//目标值

    //Java Bean生成的代码
    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getResId() {
        return resId;
    }

    public void setResId(String resId) {
        this.resId = resId;
    }

    public String getDesId() {
        return desId;
    }

    public void setDesId(String desId) {
        this.desId = desId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
