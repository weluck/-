package cn.ncu.weluck.dao;

import cn.ncu.weluck.pojo.Person;

import java.util.List;

public interface PersonMapper {
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
    Person queryHost(String account);
    Person queryAttendent(String account);
    Person queryManager(String account);

    List<Person> queryAllHost();
    List<Person> queryAllAttendent();
}
