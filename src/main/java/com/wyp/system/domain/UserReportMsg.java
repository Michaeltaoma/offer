package com.wyp.system.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wyp.common.annotation.Excel;
import com.wyp.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户上报留言对象 user_report_msg
 *
 * @author wyp
 * @date 2021-05-06
 */
public class UserReportMsg extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 消息ID
     */
    private Long msgId;

    /**
     * 上报ID
     */
    private Long reportId;

    /**
     * 用户ID
     */
    @Excel(name = "用户ID")
    private Long userId;

    /**
     * 用户名称
     */
    @Excel(name = "用户名称")
    private String userName;

    /**
     * 留言状态
     */
    @Excel(name = "留言状态")
    private Long msgStatus;

    /**
     * 留言消息
     */
    @Excel(name = "留言消息")
    private String msgInfo;

    /**
     * 留言时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "留言时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date msgTime;

    public void setMsgId(Long msgId) {
        this.msgId = msgId;
    }

    public Long getMsgId() {
        return msgId;
    }

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

    public void setMsgStatus(Long msgStatus) {
        this.msgStatus = msgStatus;
    }

    public Long getMsgStatus() {
        return msgStatus;
    }

    public void setMsgInfo(String msgInfo) {
        this.msgInfo = msgInfo;
    }

    public String getMsgInfo() {
        return msgInfo;
    }

    public void setMsgTime(Date msgTime) {
        this.msgTime = msgTime;
    }

    public Date getMsgTime() {
        return msgTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("msgId", getMsgId())
                .append("reportId", getReportId())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("msgStatus", getMsgStatus())
                .append("msgInfo", getMsgInfo())
                .append("msgTime", getMsgTime())
                .toString();
    }
}
