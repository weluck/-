package cn.ncu.weluck.service;

import cn.ncu.weluck.dao.InformationMapper;
import cn.ncu.weluck.pojo.Information;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

public class InformationServiceImpl implements InformationService{
    private InformationMapper informationMapper;

    public void setInformationMapper(InformationMapper informationMapper) {
        this.informationMapper = informationMapper;
    }

    public int addInfor(Information infor) {
        return informationMapper.addInfor(infor);
    }

    public int deleteInfor(String id) {
        return informationMapper.deleteInfor(id);
    }

    public List<Information> queryByMeet(String meetId) {
        return informationMapper.queryByMeet(meetId);
    }
    public void exportExcel(List<Information> userList, OutputStream outputStream) throws IOException {
        HSSFWorkbook hwb = new HSSFWorkbook();
        //1.1创建合并单元格
        //CellRangeAddress cellRangeAddress =new CellRangeAddress(0,0,0,4);
        //2.创建工作表
        HSSFSheet sheet = hwb.createSheet("人员信息表");
        //2.1添加合并单元格
        //sheet.addMergedRegion(cellRangeAddress);
        //3.1创建第一行及单元格
        HSSFRow row1 = sheet.createRow(0);
        HSSFCell cell1 = row1.createCell(0);
        cell1.setCellValue("人员信息");
        //3.2创建第二行及单元格
        HSSFRow row2 = sheet.createRow(1);
        String[] row2Cell = {"姓名","工作地点","身份证号","电话","参会时间", "性别", "是否需要房间"};
        for (int i =0 ; i < row2Cell.length ; i++ ){
            row2.createCell(i).setCellValue(row2Cell[i]);
        }
        //3.3创建第三行及单元格
        if(userList!= null && userList.size()>0){
            for(int j=0 ; j<userList.size() ;j++){
                HSSFRow rowUser = sheet.createRow(j+2);
                rowUser.createCell(0).setCellValue(userList.get(j).getName());
                rowUser.createCell(1).setCellValue(userList.get(j).getWorkPlace());
                rowUser.createCell(2).setCellValue(userList.get(j).getId());
                rowUser.createCell(3).setCellValue(userList.get(j).getPhone());
                rowUser.createCell(4).setCellValue(userList.get(j).getDate());
                rowUser.createCell(5).setCellValue(userList.get(j).getSex());
                rowUser.createCell(6).setCellValue(userList.get(j).getIfRoom());
            }
        }
        //5.输出
        hwb.write(outputStream);
    }
}
