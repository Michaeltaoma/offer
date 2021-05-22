package com.wyp.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wyp.system.mapper.UserPrivateMapper;
import com.wyp.system.domain.UserPrivate;
import com.wyp.system.service.IUserPrivateService;
import com.wyp.common.core.text.Convert;

/**
 * 用户私聊Service业务层处理
 *
 * @author wyp
 * @date 2021-05-06
 */
@Service
public class UserPrivateServiceImpl implements IUserPrivateService {
    @Autowired
    private UserPrivateMapper userPrivateMapper;

    /**
     * 查询用户私聊
     *
     * @param msgId 用户私聊ID
     * @return 用户私聊
     */
    @Override
    public UserPrivate selectUserPrivateById(Long msgId) {
        return userPrivateMapper.selectUserPrivateById(msgId);
    }

    /**
     * 查询用户私聊列表
     *
     * @param userPrivate 用户私聊
     * @return 用户私聊
     */
    @Override
    public List<UserPrivate> selectUserPrivateList(UserPrivate userPrivate) {
        return userPrivateMapper.selectUserPrivateList(userPrivate);
    }

    /**
     * 新增用户私聊
     *
     * @param userPrivate 用户私聊
     * @return 结果
     */
    @Override
    public int insertUserPrivate(UserPrivate userPrivate) {
        return userPrivateMapper.insertUserPrivate(userPrivate);
    }

    /**
     * 修改用户私聊
     *
     * @param userPrivate 用户私聊
     * @return 结果
     */
    @Override
    public int updateUserPrivate(UserPrivate userPrivate) {
        return userPrivateMapper.updateUserPrivate(userPrivate);
    }

    /**
     * 删除用户私聊对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUserPrivateByIds(String ids) {
        return userPrivateMapper.deleteUserPrivateByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户私聊信息
     *
     * @param msgId 用户私聊ID
     * @return 结果
     */
    @Override
    public int deleteUserPrivateById(Long msgId) {
        return userPrivateMapper.deleteUserPrivateById(msgId);
    }

    @Override
    public List<UserPrivate> selectUserPrivateListByUserIds(Long userId, Long replyUserId) {
        return userPrivateMapper.selectUserPrivateListByUserIds(userId, replyUserId);
    }

    @Override
    public List<UserPrivate> selectPrivateByReplyUserId(Long userId) {
        return userPrivateMapper.selectPrivateByReplyUserId(userId);
    }
}
