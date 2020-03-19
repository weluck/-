package cn.ncu.weluck.controller;

import cn.ncu.weluck.pojo.Person;
import cn.ncu.weluck.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class adminController {
    @Autowired
    @Qualifier("personServiceImpl")
    private PersonService personService;

    @RequestMapping("/index")
    public String index(){
        return "admin";
    }
    @RequestMapping("/manager")
    public String manager(HttpServletRequest request, Model model){
        HttpSession session = request.getSession(true);
        System.out.println(session.getAttribute("userId"));
        model.addAttribute("userId", session.getAttribute("userId"));
        return "manager";
    }

    @RequestMapping("logIn")
    public String logIn(Model model, Person person, HttpServletRequest request){
        HttpSession session = request.getSession(true);
        int res = personService.loginManager(person.getAccount(), person.getPsw());
        model.addAttribute("flag", res);
        System.out.println(person.getAccount()+"check");
        session.setAttribute("userId", person.getAccount());
        return "admin";
}

    @RequestMapping("queryHost")
    @ResponseBody
    public List<Person> queryAllHost1(){
        return personService.queryAllHost();
    }
    @RequestMapping("queryAttendent")
    @ResponseBody
    public List<Person> queryAllManager1(){
        return  personService.queryAllAttendent();
    }
    @RequestMapping("deleteHost")
    @ResponseBody
    public void deleteHost(String account){
        personService.deleteHost(account);
    }
    @RequestMapping("deleteAttendent")
    @ResponseBody
    public void deleteAttendent(String account){
        personService.deleteAttendent(account);
    }

}
