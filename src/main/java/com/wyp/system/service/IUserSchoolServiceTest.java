package com.wyp.system.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wyp.system.domain.UserSchool;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class IUserSchoolServiceTest {

    @Autowired
    IUserSchoolService iUserSchoolService;

    @Test
    public void insertUserSchoolService() {
        UserSchool test = new UserSchool();
        test.setSchoolID((long)13);
        test.setResSchool("Michael123");
        test.setSchoolNum((long)12);
        test.setAvgGPA("3.5");
        test.setMinGPA("3.2");
        iUserSchoolService.insertUserSchool(test);
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

        List<UserSchool> testList = iUserSchoolService.selectRecommendateSchool(test);

        for (UserSchool school: testList){
            System.out.println(school.getResSchool());
        }
    }
}