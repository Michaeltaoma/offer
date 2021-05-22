package com.wyp.system.service;

import java.util.List;

import com.wyp.system.domain.UserPrivate;

/**
 * 用户私聊Service接口
 *
 * @author wyp
 * @date 2021-05-06
 */
public interface IUserPrivateService {
    /**
     * 查询用户私聊
     *
     * @param msgId 用户私聊ID
     * @return 用户私聊
     */
    public UserPrivate selectUserPrivateById(Long msgId);

    /**
     * 查询用户私聊列表
     *
     * @param userPrivate 用户私聊
     * @return 用户私聊集合
     */
    public List<UserPrivate> selectUserPrivateList(UserPrivate userPrivate);

    /**
     * 新增用户私聊
     *
     * @param userPrivate 用户私聊
     * @return 结果
     */
    public int insertUserPrivate(UserPrivate userPrivate);

    /**
     * 修改用户私聊
     *
     * @param userPrivate 用户私聊
     * @return 结果
     */
    public int updateUserPrivate(UserPrivate userPrivate);

    /**
     * 批量删除用户私聊
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserPrivateByIds(String ids);

    /**
     * 删除用户私聊信息
     *
     * @param msgId 用户私聊ID
     * @return 结果
     */
    public int deleteUserPrivateById(Long msgId);

    /**
     * 查找两个人的聊天记录
     *
     * @param userId
     * @param replyUserId
     * @return
     */
    public List<UserPrivate> selectUserPrivateListByUserIds(Long userId, Long replyUserId);

    /**
     * 查找私聊记录
     *
     * @param userId
     * @return
     */
    public List<UserPrivate> selectPrivateByReplyUserId(Long userId);
}
