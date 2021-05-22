package com.wyp.system.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wyp.system.domain.UserSchool;

//import javax.jws.soap.SOAPBinding;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class UserSchoolMapperTest {

    @Autowired
    UserSchoolMapper userSchoolMapper;

    @Test
    public void insertUserSchool() {
        UserSchool test = new UserSchool();
        test.setSchoolID((long)12);
        test.setResSchool("Michael");
        test.setSchoolNum((long)12);
        test.setAvgGPA("3.5");
        test.setMinGPA("3.2");
        userSchoolMapper.insertUserSchool(test);
        System.out.println("hello");
    }

    @Test
    public void getRecommend(){
        UserSchool test = new UserSchool();
        test.setSchoolID((long)12);
        test.setResSchool("Michael");
        test.setSchoolNum((long)12);
        test.setAvgGPA("3.5");
        test.setMinGPA("3.2");

        List<UserSchool> testList = userSchoolMapper.selectRecommendateSchool(test);

        for (UserSchool school: testList){
            System.out.println(school.getResSchool());
        }
    }
}