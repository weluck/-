package cn.ncu.weluck.service;

import cn.ncu.weluck.pojo.Information;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

public interface InformationService {
    //提交一份个人信息
    int addInfor(Information infor);
    //撤销一份信息
    int deleteInfor(String id);
    //输出excel
    List<Information> queryByMeet(String meetId);
    public void exportExcel(List<Information> userList, OutputStream outputStream) throws IOException;
}
