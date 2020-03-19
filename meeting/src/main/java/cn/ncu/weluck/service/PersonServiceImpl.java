package cn.ncu.weluck.service;

import cn.ncu.weluck.dao.PersonMapper;
import cn.ncu.weluck.pojo.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {
    private final PersonMapper personMapper;

    @Autowired
    public PersonServiceImpl(PersonMapper personMapper) {
        this.personMapper = personMapper;
    }


    public int addHost(Person person) {
        return personMapper.addHost(person);
    }

    public int addAttendent(Person person) {
        return personMapper.addAttendent(person);
    }

    public int addManager(Person person) {
        return personMapper.addManager(person);
    }

    public int deleteHost(String account) {
        return personMapper.deleteHost(account);
    }

    public int deleteAttendent(String account) {
        return personMapper.deleteAttendent(account);
    }

    public int deleteManager(String account) {
        return personMapper.deleteManager(account);
    }

    public int loginHost(String account, String psw) {
        Person person = personMapper.queryHost(account);
        if (person != null && psw.equals(person.getPsw())){
            return 1;
        }
        return 2;
    }

    public int loginAttendent(String account, String psw) {
        Person person = personMapper.queryAttendent(account);
        if (person != null && psw.equals(person.getPsw())){
            return 1;
        }
        return 2;
    }

    public int loginManager(String account, String psw) {
        Person person = personMapper.queryManager(account);
        if (person != null && psw.equals(person.getPsw())){
            return 1;
        }
        return 2;
    }

    public List<Person> queryAllHost() {
        return personMapper.queryAllHost();
    }

    public List<Person> queryAllAttendent() {
        return personMapper.queryAllAttendent();
    }


}
