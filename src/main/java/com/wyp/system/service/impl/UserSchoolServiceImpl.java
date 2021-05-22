package com.wyp.system.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wyp.system.mapper.UserSchoolMapper;
import com.wyp.system.domain.UserSchool;
import com.wyp.system.service.IUserSchoolService;
import com.wyp.common.core.text.Convert;

@Service
public class UserSchoolServiceImpl implements IUserSchoolService{

    @Autowired
    private UserSchoolMapper userSchoolMapper;

    @Override
    public int insertUserSchool(UserSchool userSchool){
        return userSchoolMapper.insertUserSchool(userSchool);
    }

    @Override
    public List<UserSchool> selectRecommendateSchool(UserSchool userSchool){
        return userSchoolMapper.selectRecommendateSchool(userSchool);
    }

}
