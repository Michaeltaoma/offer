package com.wyp.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wyp.system.mapper.UserReportMsgMapper;
import com.wyp.system.domain.UserReportMsg;
import com.wyp.system.service.IUserReportMsgService;
import com.wyp.common.core.text.Convert;

/**
 * 用户上报留言Service业务层处理
 *
 * @author wyp
 * @date 2021-05-06
 */
@Service
public class UserReportMsgServiceImpl implements IUserReportMsgService {
    @Autowired
    private UserReportMsgMapper userReportMsgMapper;

    /**
     * 查询用户上报留言
     *
     * @param msgId 用户上报留言ID
     * @return 用户上报留言
     */
    @Override
    public UserReportMsg selectUserReportMsgById(Long msgId) {
        return userReportMsgMapper.selectUserReportMsgById(msgId);
    }

    /**
     * 查询用户上报留言列表
     *
     * @param userReportMsg 用户上报留言
     * @return 用户上报留言
     */
    @Override
    public List<UserReportMsg> selectUserReportMsgList(UserReportMsg userReportMsg) {
        return userReportMsgMapper.selectUserReportMsgList(userReportMsg);
    }

    /**
     * 新增用户上报留言
     *
     * @param userReportMsg 用户上报留言
     * @return 结果
     */
    @Override
    public int insertUserReportMsg(UserReportMsg userReportMsg) {
        return userReportMsgMapper.insertUserReportMsg(userReportMsg);
    }

    /**
     * 修改用户上报留言
     *
     * @param userReportMsg 用户上报留言
     * @return 结果
     */
    @Override
    public int updateUserReportMsg(UserReportMsg userReportMsg) {
        return userReportMsgMapper.updateUserReportMsg(userReportMsg);
    }

    /**
     * 删除用户上报留言对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUserReportMsgByIds(String ids) {
        return userReportMsgMapper.deleteUserReportMsgByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户上报留言信息
     *
     * @param msgId 用户上报留言ID
     * @return 结果
     */
    @Override
    public int deleteUserReportMsgById(Long msgId) {
        return userReportMsgMapper.deleteUserReportMsgById(msgId);
    }
}
