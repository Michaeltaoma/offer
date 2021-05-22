package com.wyp.system.service;

import com.wyp.system.domain.UserSchool;
import org.apache.catalina.User;

import java.util.List;

public interface IUserSchoolService {

    public int insertUserSchool(UserSchool userSchool);

    public List<UserSchool> selectRecommendateSchool(UserSchool userSchool);

}
