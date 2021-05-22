package com.wyp.system.domain;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.wyp.common.annotation.Excel;
import com.wyp.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class UserSchool extends BaseEntity{
    private static final long serialVersionUID = 1887260811861104999L;

    private Long schoolID;

    @Excel(name="学校名字")
    private String resSchool;

    @Excel(name="录取人数")
    private Long schoolNum;

    @Excel(name="平均绩点")
    private String avgGPA;

    @Excel(name="最低录取")
    private String minGPA;

    public Long getSchoolID() {
        return schoolID;
    }

    public void setSchoolID(Long schoolID) {
        this.schoolID = schoolID;
    }

    public String getResSchool() {
        return resSchool;
    }

    public void setResSchool(String resSchool) {
        this.resSchool = resSchool;
    }

    public Long getSchoolNum() {
        return schoolNum;
    }

    public void setSchoolNum(Long schoolNum) {
        this.schoolNum = schoolNum;
    }

    public String getAvgGPA() {
        return avgGPA;
    }

    public void setAvgGPA(String avgGPA) {
        this.avgGPA = avgGPA;
    }

    public String getMinGPA() {
        return minGPA;
    }

    public void setMinGPA(String minGPA) {
        this.minGPA = minGPA;
    }
}
