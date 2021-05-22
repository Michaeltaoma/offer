package com.wyp.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wyp.system.mapper.UserBagMapper;
import com.wyp.system.domain.UserBag;
import com.wyp.system.service.IUserBagService;
import com.wyp.common.core.text.Convert;

/**
 * 用户背景Service业务层处理
 *
 * @author wyp
 * @date 2021-05-04
 */
@Service
public class UserBagServiceImpl implements IUserBagService {
    @Autowired
    private UserBagMapper userBagMapper;

    /**
     * 查询用户背景
     *
     * @param bagId 用户背景ID
     * @return 用户背景
     */
    @Override
    public UserBag selectUserBagById(Long bagId) {
        return userBagMapper.selectUserBagById(bagId);
    }

    /**
     * 查询用户背景列表
     *
     * @param userBag 用户背景
     * @return 用户背景
     */
    @Override
    public List<UserBag> selectUserBagList(UserBag userBag) {
        return userBagMapper.selectUserBagList(userBag);
    }

    /**
     * 新增用户背景
     *
     * @param userBag 用户背景
     * @return 结果
     */
    @Override
    public int insertUserBag(UserBag userBag) {
        return userBagMapper.insertUserBag(userBag);
    }

    /**
     * 修改用户背景
     *
     * @param userBag 用户背景
     * @return 结果
     */
    @Override
    public int updateUserBag(UserBag userBag) {
        return userBagMapper.updateUserBag(userBag);
    }

    /**
     * 删除用户背景对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUserBagByIds(String ids) {
        return userBagMapper.deleteUserBagByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户背景信息
     *
     * @param bagId 用户背景ID
     * @return 结果
     */
    @Override
    public int deleteUserBagById(Long bagId) {
        return userBagMapper.deleteUserBagById(bagId);
    }
}
