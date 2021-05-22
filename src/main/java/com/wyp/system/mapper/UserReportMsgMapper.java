package com.wyp.system.mapper;

import java.util.List;

import com.wyp.system.domain.UserReportMsg;

/**
 * 用户上报留言Mapper接口
 *
 * @author wyp
 * @date 2021-05-06
 */
public interface UserReportMsgMapper {
    /**
     * 查询用户上报留言
     *
     * @param msgId 用户上报留言ID
     * @return 用户上报留言
     */
    public UserReportMsg selectUserReportMsgById(Long msgId);

    /**
     * 查询用户上报留言列表
     *
     * @param userReportMsg 用户上报留言
     * @return 用户上报留言集合
     */
    public List<UserReportMsg> selectUserReportMsgList(UserReportMsg userReportMsg);

    /**
     * 新增用户上报留言
     *
     * @param userReportMsg 用户上报留言
     * @return 结果
     */
    public int insertUserReportMsg(UserReportMsg userReportMsg);

    /**
     * 修改用户上报留言
     *
     * @param userReportMsg 用户上报留言
     * @return 结果
     */
    public int updateUserReportMsg(UserReportMsg userReportMsg);

    /**
     * 删除用户上报留言
     *
     * @param msgId 用户上报留言ID
     * @return 结果
     */
    public int deleteUserReportMsgById(Long msgId);

    /**
     * 批量删除用户上报留言
     *
     * @param msgIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserReportMsgByIds(String[] msgIds);
}
