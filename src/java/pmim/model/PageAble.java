package pmim.model;

public class PageAble {
    int desPage;
    int resLimit;
    int desLimit=10;
    int count;
    int ststus;
    int id;
    int userId;
    Object thisPage;
    int userType;

    public int getDesPage() {
        return desPage;
    }

    public void setDesPage(int desPage) {
        this.desPage = desPage;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getStstus() {
        return ststus;
    }

    public void setStstus(int ststus) {
        this.ststus = ststus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Object getThisPage() {
        return thisPage;
    }

    public void setThisPage(Object thisPage) {
        this.thisPage = thisPage;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public PageAble() {
        if (desPage == 0) {
            resLimit=0;
        }else {
            resLimit=(desPage-1)*10-1;
        }
    }
}
