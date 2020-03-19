package cn.ncu.weluck.controller;

import cn.ncu.weluck.pojo.Information;
import cn.ncu.weluck.pojo.Meeting;
import cn.ncu.weluck.pojo.Person;
import cn.ncu.weluck.service.InformationService;
import cn.ncu.weluck.service.MeetingService;
import cn.ncu.weluck.service.PersonService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/meeting")
public class MeetController {
    @Autowired
    @Qualifier("informationServiceImpl")
    private InformationService informationService;

    @Autowired
    @Qualifier("meetingServiceImpl")
    private MeetingService meetingService;

    @Autowired
    @Qualifier("personServiceImpl")
    private PersonService personService;

    @RequestMapping("/logInAttend")
    public String registerAttend() {
        return "logInAttend";
    }

    @RequestMapping("/logInHost")
    public String registerManager() {
        return "logInHost";
    }

    @RequestMapping("/askMeet")
    public String askMeet() {
        return "askMeet";
    }

    @RequestMapping(value = "/queryMeet",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String queryMeet() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        List<Meeting> list = meetingService.queryAllMeet();
        return mapper.writeValueAsString(list);
    }

    @RequestMapping(value = "/queryMeetByUser",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String queryMeetByUser1(String userAccount) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        List<Meeting> list = meetingService.queryMeetByUser(userAccount);
        return mapper.writeValueAsString(list);
    }

    @RequestMapping("/createMeet")
    public String createMeet() {
        return  "createMeet";
    }

    @RequestMapping("/deleteMeet")
    @ResponseBody
    public String deleteMeet1(String meetId){
        meetingService.deleteMeeting(meetId);
        return "删除成功";
    }

    @RequestMapping("/host")
    public String toHost(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        System.out.println(session.getAttribute("userId"));
        model.addAttribute("userId", session.getAttribute("userId"));
        return "host";
    }

    @RequestMapping("/attend")
    public String toAttend(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        model.addAttribute("userId", session.getAttribute("userId"));
        return "attend";
    }

    @RequestMapping("/addHost")
    public String addHost1(Person person) {
        System.out.println(person);
        personService.addHost(person);
        return "logInHost";
    }

    @RequestMapping("/addAttend")
    public String addAttend(Person person) {
        System.out.println("attend"+ person.getAccount() + person.getPsw());
        personService.addAttendent(person);
        return "logInAttend";
    }

    @RequestMapping("/addMeet")
    public String addMeet(Meeting meeting, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        StringBuilder str = new StringBuilder();
        for (int i = 0; i < 10; ++i){
            str.append((int) (Math.random() * 10));
        }
        String userId = session.getAttribute("userId").toString();
        meeting.setUserAccount(userId);
        meeting.setMeetId(str.toString());
        meetingService.addMeeting(meeting);
        return "host";
    }

    @RequestMapping("/addInfor")
    public String addInformation(Information information) {
        informationService.addInfor(information);
        return "attend";
    }

    @RequestMapping("/checkAttend")
    public String checkAttend(Person person, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        int res = personService.loginAttendent(person.getAccount(), person.getPsw());
        model.addAttribute("flag", res);
        System.out.println(person.getAccount()+"check");
        session.setAttribute("userId", person.getAccount());
        return "logInAttend";
    }

    @RequestMapping("/checkHost")
    public String checkHost(Person person, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        int res = personService.loginHost(person.getAccount(), person.getPsw());
        model.addAttribute("flag", res);
        System.out.println(person.getAccount()+"check");
        session.setAttribute("userId", person.getAccount());
        return "logInHost";
    }

    @RequestMapping("/exportExcel")
    @ResponseBody
    public void exportExcel(String meetId, HttpServletResponse response) throws IOException {
            List<Information> userList = informationService.queryByMeet(meetId);

            //导出excel
            response.setHeader("Content-Disposition","attachment;filename="+new String("用户信息.xls".getBytes(),"ISO-8859-1"));
            response.setContentType("application/x-excel;charset=UTF-8");
            OutputStream outputStream = response.getOutputStream();
            //导出
            informationService.exportExcel(userList,outputStream);
            outputStream.close();
    }
}
