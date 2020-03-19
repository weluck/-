package cn.ncu.weluck.dao;

import cn.ncu.weluck.pojo.Information;

import java.util.List;

public interface InformationMapper {
    //提交一份个人信息
    int addInfor(Information infor);
    //撤销一份信息
    int deleteInfor(String id);
    //查询某会议的人
    List<Information> queryByMeet(String meetId);
}
