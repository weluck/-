package cn.ncu.weluck.dao;

import cn.ncu.weluck.pojo.Meeting;


import java.util.List;

public interface MeetingMapper {
    //组织一场会议
    int addMeeting(Meeting meeting);
    //原地解散
    int deleteMeeting(String meetId);
    //康康当前所有会议
    List<Meeting> queryAllMeet();
    List<Meeting> queryMeetByUser(String userAccount);
    //查找会议号
    String queryIdByAccount(String userAccount);
}
