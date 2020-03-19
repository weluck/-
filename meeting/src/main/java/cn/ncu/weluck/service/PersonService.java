package cn.ncu.weluck.service;

import cn.ncu.weluck.pojo.Person;

import java.util.List;

public interface PersonService {
    //来了一个组织者
    int addHost(Person person);
    //来了一个参加者
    int addAttendent(Person person);
    //来了一个管理员
    int addManager(Person person);
    //走了一个组织者
    int deleteHost(String account);
    //走了一个参与者
    int deleteAttendent(String account);
    //走了一个管理员
    int deleteManager(String account);
    //登录验证密码
    int loginHost(String account, String psw);
    int loginAttendent(String account, String psw);
    int loginManager(String account, String psw);

    List<Person> queryAllHost();
    List<Person> queryAllAttendent();
}
