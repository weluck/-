package cn.ncu.weluck.service;

import cn.ncu.weluck.pojo.Meeting;

import java.util.List;

public interface MeetingService {
    //组织一场会议
    int addMeeting(Meeting meeting);
    //原地解散
    int deleteMeeting(String id);
    //康康当前所有会议
    List<Meeting> queryAllMeet();
    List<Meeting> queryMeetByUser(String userAccount);
    String queryIdByAccount(String userAccount);
}
