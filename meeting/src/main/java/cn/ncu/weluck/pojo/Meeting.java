package cn.ncu.weluck.pojo;

public class Meeting {
    private String meetDate;
    private String meetAddress;
    private String meetPerson;
    private String meetHotel;
    private String meetId;
    private Boolean ifIfRoom;
    private Boolean ifName;
    private Boolean ifWorkPlace;
    private Boolean ifId;
    private Boolean ifPhone;
    private Boolean ifDate;
    private Boolean ifSex;
    private String userAccount;



    @Override
    public String toString() {
        return "Meeting{" +
                "meetDate='" + meetDate + '\'' +
                ", meetAddress='" + meetAddress + '\'' +
                ", meetPerson='" + meetPerson + '\'' +
                ", meetHotel='" + meetHotel + '\'' +
                ", meetId='" + meetId + '\'' +
                ", ifIfRoom=" + ifIfRoom +
                ", ifName=" + ifName +
                ", ifWorkPlace=" + ifWorkPlace +
                ", ifId=" + ifId +
                ", ifPhone=" + ifPhone +
                ", ifDate=" + ifDate +
                ", ifSex=" + ifSex +
                ", userAccount='" + userAccount + '\'' +
                '}';
    }

    public String getMeetDate() {
        return meetDate;
    }

    public void setMeetDate(String meetDate) {
        this.meetDate = meetDate;
    }

    public String getMeetAddress() {
        return meetAddress;
    }

    public void setMeetAddress(String meetAddress) {
        this.meetAddress = meetAddress;
    }

    public String getMeetPerson() {
        return meetPerson;
    }

    public void setMeetPerson(String meetPerson) {
        this.meetPerson = meetPerson;
    }

    public String getMeetHotel() {
        return meetHotel;
    }

    public void setMeetHotel(String meetHotel) {
        this.meetHotel = meetHotel;
    }

    public String getMeetId() {
        return meetId;
    }

    public void setMeetId(String meetId) {
        this.meetId = meetId;
    }

    public Boolean getIfIfRoom() {
        return ifIfRoom;
    }

    public void setIfIfRoom(Boolean ifIfRoom) {
        this.ifIfRoom = ifIfRoom;
    }

    public Boolean getIfName() {
        return ifName;
    }

    public void setIfName(Boolean ifName) {
        this.ifName = ifName;
    }

    public Boolean getIfWorkPlace() {
        return ifWorkPlace;
    }

    public void setIfWorkPlace(Boolean ifWorkPlace) {
        this.ifWorkPlace = ifWorkPlace;
    }

    public Boolean getIfId() {
        return ifId;
    }

    public void setIfId(Boolean ifId) {
        this.ifId = ifId;
    }

    public Boolean getIfPhone() {
        return ifPhone;
    }

    public void setIfPhone(Boolean ifPhone) {
        this.ifPhone = ifPhone;
    }

    public Boolean getIfDate() {
        return ifDate;
    }

    public void setIfDate(Boolean ifDate) {
        this.ifDate = ifDate;
    }

    public Boolean getIfSex() {
        return ifSex;
    }

    public void setIfSex(Boolean ifSex) {
        this.ifSex = ifSex;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }
}
