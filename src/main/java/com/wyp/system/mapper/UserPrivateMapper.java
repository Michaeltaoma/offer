package com.wyp.system.mapper;

import java.util.List;

import com.wyp.system.domain.UserPrivate;
import org.apache.ibatis.annotations.Param;

/**
 * 用户私聊Mapper接口
 *
 * @author wyp
 * @date 2021-05-06
 */
public interface UserPrivateMapper {
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
     * 删除用户私聊
     *
     * @param msgId 用户私聊ID
     * @return 结果
     */
    public int deleteUserPrivateById(Long msgId);

    /**
     * 批量删除用户私聊
     *
     * @param msgIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserPrivateByIds(String[] msgIds);

    /**
     * 查找两个用户的聊天记录
     */
    List<UserPrivate> selectUserPrivateListByUserIds(@Param("userId") Long userId, @Param("replyUserId") Long replyUserId);

    /**
     * 查找聊天记录列表
     */
    List<UserPrivate> selectPrivateByReplyUserId(@Param("userId") Long userId);

}
