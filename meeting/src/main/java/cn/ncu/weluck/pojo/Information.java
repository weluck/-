package cn.ncu.weluck.pojo;

public class Information {
    private String name;
    private String workPlace;
    private String id;
    private String phone;
    private String date;
    private String sex;
    private Boolean ifRoom;
    private String meetId;

    public String getMeetId() {
        return meetId;
    }

    public void setMeetId(String meetId) {
        this.meetId = meetId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWorkPlace() {
        return workPlace;
    }

    public void setWorkPlace(String workPlace) {
        this.workPlace = workPlace;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Boolean getIfRoom() {
        return ifRoom;
    }

    public void setIfRoom(Boolean ifRoom) {
        this.ifRoom = ifRoom;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Information{" +
                "name='" + name + '\'' +
                ", workPlace='" + workPlace + '\'' +
                ", id='" + id + '\'' +
                ", phone='" + phone + '\'' +
                ", date='" + date + '\'' +
                ", sex='" + sex + '\'' +
                ", ifRoom=" + ifRoom +
                '}';
    }
}
