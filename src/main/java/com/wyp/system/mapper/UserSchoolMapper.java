package com.wyp.system.mapper;


import java.util.List;

import com.wyp.system.domain.UserSchool;


public interface UserSchoolMapper {

    /** 简单的insert
     *
     * @param userSchool
     * @return 结果
     */
    public int insertUserSchool(UserSchool userSchool);

    public List<UserSchool> selectRecommendateSchool(UserSchool userSchool);

}
