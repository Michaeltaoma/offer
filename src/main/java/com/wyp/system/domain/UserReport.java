package com.wyp.system.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wyp.common.annotation.Excel;
import com.wyp.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户上报对象 user_report
 *
 * @author wyp
 * @date 2021-05-04
 */
public class UserReport extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 背景ID
     */
    private Long reportId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户名称
     */
    @Excel(name = "用户名称")
    private String userName;

    /**
     * 上报状态
     */
    @Excel(name = "上报状态")
    private Long reportStatus;

    /**
     * 录取学年
     */
    @Excel(name = "录取学年")
    private Long resYear;

    /**
     * 上报时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上报时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reportTime;

    /**
     * 录取学期
     */
    @Excel(name = "录取学期")
    private Long resTerm;

    /**
     * 录取学校
     */
    @Excel(name = "录取学校")
    private String resSchool;

    /**
     * 录取学位
     */
    @Excel(name = "录取学位")
    private Long resStudy;

    /**
     * 录取专业
     */
    @Excel(name = "录取专业")
    private Long resMajor;

    /**
     * 录取项目
     */
    @Excel(name = "录取项目")
    private String resProject;

    /**
     * 录取结果
     */
    @Excel(name = "录取结果")
    private Long resResult;

    /**
     * 录取通知方式
     */
    @Excel(name = "录取通知方式")
    private Long resNotice;

    /**
     * 录取通知时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "录取通知时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date resNoticeTime;

    /**
     * 网申提交时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "网申提交时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reqTime;

    /**
     * 标题
     */
    @Excel(name = "标题")
    private String title;

    /**
     * 帖子内容
     */
    @Excel(name = "帖子内容")
    private String info;

    public void setReportId(Long reportId) {
        this.reportId = reportId;
    }

    public Long getReportId() {
        return reportId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setReportStatus(Long reportStatus) {
        this.reportStatus = reportStatus;
    }

    public Long getReportStatus() {
        return reportStatus;
    }

    public void setResYear(Long resYear) {
        this.resYear = resYear;
    }

    public Long getResYear() {
        return resYear;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setResTerm(Long resTerm) {
        this.resTerm = resTerm;
    }

    public Long getResTerm() {
        return resTerm;
    }

    public void setResSchool(String resSchool) {
        this.resSchool = resSchool;
    }

    public String getResSchool() {
        return resSchool;
    }

    public void setResStudy(Long resStudy) {
        this.resStudy = resStudy;
    }

    public Long getResStudy() {
        return resStudy;
    }

    public void setResMajor(Long resMajor) {
        this.resMajor = resMajor;
    }

    public Long getResMajor() {
        return resMajor;
    }

    public void setResProject(String resProject) {
        this.resProject = resProject;
    }

    public String getResProject() {
        return resProject;
    }

    public void setResResult(Long resResult) {
        this.resResult = resResult;
    }

    public Long getResResult() {
        return resResult;
    }

    public void setResNotice(Long resNotice) {
        this.resNotice = resNotice;
    }

    public Long getResNotice() {
        return resNotice;
    }

    public void setResNoticeTime(Date resNoticeTime) {
        this.resNoticeTime = resNoticeTime;
    }

    public Date getResNoticeTime() {
        return resNoticeTime;
    }

    public void setReqTime(Date reqTime) {
        this.reqTime = reqTime;
    }

    public Date getReqTime() {
        return reqTime;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("reportId", getReportId())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("reportStatus", getReportStatus())
                .append("resYear", getResYear())
                .append("reportTime", getReportTime())
                .append("resTerm", getResTerm())
                .append("resSchool", getResSchool())
                .append("resStudy", getResStudy())
                .append("resMajor", getResMajor())
                .append("resProject", getResProject())
                .append("resResult", getResResult())
                .append("resNotice", getResNotice())
                .append("resNoticeTime", getResNoticeTime())
                .append("reqTime", getReqTime())
                .append("title", getTitle())
                .append("info", getInfo())
                .toString();
    }
}
