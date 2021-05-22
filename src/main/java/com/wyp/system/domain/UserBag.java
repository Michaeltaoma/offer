package com.wyp.system.domain;

import com.wyp.common.annotation.Excel;
import com.wyp.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户背景对象 user_bag
 *
 * @author zengfj
 * @date 2021-05-15
 */
public class UserBag extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 背景ID */
    private Long bagId;

    /** 用户ID */
    private Long userId;

    /** 用户名称 */
    @Excel(name = "用户名称")
    private String userName;

    /** 入学学年 */
    @Excel(name = "入学学年")
    private Long reqYear;

    /** 申请学位 */
    @Excel(name = "申请学位")
    private Long reqStudy;

    /** 申请专业 */
    @Excel(name = "申请专业")
    private Long reqMajor;

    /** 申请目标 */
    @Excel(name = "申请目标")
    private Long reqTarget;

    /** 本科学校 */
    @Excel(name = "本科学校")
    private String bkSchoolName;

    /** 本科专业 */
    @Excel(name = "本科专业")
    private String bkMajor;

    /** 本科GPA原始成绩 */
    @Excel(name = "本科GPA原始成绩")
    private String bkResult;

    /** 雅思/托福总分 */
    @Excel(name = "雅思/托福总分")
    private Long yasiFraction;

    /** 阅读 */
    @Excel(name = "阅读")
    private Long readFraction;

    /** 听力 */
    @Excel(name = "听力")
    private Long hearingFraction;

    /** 写作 */
    @Excel(name = "写作")
    private Long writeFraction;

    /** 口语 */
    @Excel(name = "口语")
    private Long mouthFraction;

    /** GRE总分 */
    @Excel(name = "GRE总分")
    private Long greFraction;

    /** 写作 */
    @Excel(name = "写作")
    private Long greWrite;

    /** 语文 */
    @Excel(name = "语文")
    private Long chineseFraction;

    /** 数学 */
    @Excel(name = "数学")
    private Long mathematicsFraction;

    public void setBagId(Long bagId)
    {
        this.bagId = bagId;
    }

    public Long getBagId()
    {
        return bagId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserName()
    {
        return userName;
    }
    public void setReqYear(Long reqYear)
    {
        this.reqYear = reqYear;
    }

    public Long getReqYear()
    {
        return reqYear;
    }
    public void setReqStudy(Long reqStudy)
    {
        this.reqStudy = reqStudy;
    }

    public Long getReqStudy()
    {
        return reqStudy;
    }
    public void setReqMajor(Long reqMajor)
    {
        this.reqMajor = reqMajor;
    }

    public Long getReqMajor()
    {
        return reqMajor;
    }
    public void setReqTarget(Long reqTarget)
    {
        this.reqTarget = reqTarget;
    }

    public Long getReqTarget()
    {
        return reqTarget;
    }
    public void setBkSchoolName(String bkSchoolName)
    {
        this.bkSchoolName = bkSchoolName;
    }

    public String getBkSchoolName()
    {
        return bkSchoolName;
    }
    public void setBkMajor(String bkMajor)
    {
        this.bkMajor = bkMajor;
    }

    public String getBkMajor()
    {
        return bkMajor;
    }
    public void setBkResult(String bkResult)
    {
        this.bkResult = bkResult;
    }

    public String getBkResult()
    {
        return bkResult;
    }
    public void setYasiFraction(Long yasiFraction)
    {
        this.yasiFraction = yasiFraction;
    }

    public Long getYasiFraction()
    {
        return yasiFraction;
    }
    public void setReadFraction(Long readFraction)
    {
        this.readFraction = readFraction;
    }

    public Long getReadFraction()
    {
        return readFraction;
    }
    public void setHearingFraction(Long hearingFraction)
    {
        this.hearingFraction = hearingFraction;
    }

    public Long getHearingFraction()
    {
        return hearingFraction;
    }
    public void setWriteFraction(Long writeFraction)
    {
        this.writeFraction = writeFraction;
    }

    public Long getWriteFraction()
    {
        return writeFraction;
    }
    public void setMouthFraction(Long mouthFraction)
    {
        this.mouthFraction = mouthFraction;
    }

    public Long getMouthFraction()
    {
        return mouthFraction;
    }
    public void setGreFraction(Long greFraction)
    {
        this.greFraction = greFraction;
    }

    public Long getGreFraction()
    {
        return greFraction;
    }
    public void setGreWrite(Long greWrite)
    {
        this.greWrite = greWrite;
    }

    public Long getGreWrite()
    {
        return greWrite;
    }
    public void setChineseFraction(Long chineseFraction)
    {
        this.chineseFraction = chineseFraction;
    }

    public Long getChineseFraction()
    {
        return chineseFraction;
    }
    public void setMathematicsFraction(Long mathematicsFraction)
    {
        this.mathematicsFraction = mathematicsFraction;
    }

    public Long getMathematicsFraction()
    {
        return mathematicsFraction;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("bagId", getBagId())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("reqYear", getReqYear())
                .append("reqStudy", getReqStudy())
                .append("reqMajor", getReqMajor())
                .append("reqTarget", getReqTarget())
                .append("bkSchoolName", getBkSchoolName())
                .append("bkMajor", getBkMajor())
                .append("bkResult", getBkResult())
                .append("yasiFraction", getYasiFraction())
                .append("readFraction", getReadFraction())
                .append("hearingFraction", getHearingFraction())
                .append("writeFraction", getWriteFraction())
                .append("mouthFraction", getMouthFraction())
                .append("greFraction", getGreFraction())
                .append("greWrite", getGreWrite())
                .append("chineseFraction", getChineseFraction())
                .append("mathematicsFraction", getMathematicsFraction())
                .toString();
    }
}