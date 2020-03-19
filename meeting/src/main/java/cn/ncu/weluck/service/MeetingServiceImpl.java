package cn.ncu.weluck.service;

import cn.ncu.weluck.dao.MeetingMapper;
import cn.ncu.weluck.pojo.Meeting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("meetingServiceImpl")
public class MeetingServiceImpl implements MeetingService {

    private MeetingMapper meetingMapper;

    @Autowired
    public void setMeetingMapper(MeetingMapper meetingMapper) {
        this.meetingMapper = meetingMapper;
    }

    public int addMeeting(Meeting meeting) {
        return meetingMapper.addMeeting(meeting);
    }

    public int deleteMeeting(String id) {
        return meetingMapper.deleteMeeting(id);
    }

    public List<Meeting> queryAllMeet() {
        return meetingMapper.queryAllMeet();
    }

    public List<Meeting> queryMeetByUser(String userAccount) {
        return meetingMapper.queryMeetByUser(userAccount);
    }

    public String queryIdByAccount(String userAccount) {
        return  meetingMapper.queryIdByAccount(userAccount);
    }
}
