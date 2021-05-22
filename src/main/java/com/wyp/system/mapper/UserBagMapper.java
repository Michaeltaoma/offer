package com.wyp.system.mapper;

import java.util.List;

import com.wyp.system.domain.UserBag;

/**
 * 用户背景Mapper接口
 *
 * @author wyp
 * @date 2021-05-04
 */
public interface UserBagMapper {
    /**
     * 查询用户背景
     *
     * @param bagId 用户背景ID
     * @return 用户背景
     */
    public UserBag selectUserBagById(Long bagId);

    /**
     * 查询用户背景列表
     *
     * @param userBag 用户背景
     * @return 用户背景集合
     */
    public List<UserBag> selectUserBagList(UserBag userBag);

    /**
     * 新增用户背景
     *
     * @param userBag 用户背景
     * @return 结果
     */
    public int insertUserBag(UserBag userBag);

    /**
     * 修改用户背景
     *
     * @param userBag 用户背景
     * @return 结果
     */
    public int updateUserBag(UserBag userBag);

    /**
     * 删除用户背景
     *
     * @param bagId 用户背景ID
     * @return 结果
     */
    public int deleteUserBagById(Long bagId);

    /**
     * 批量删除用户背景
     *
     * @param bagIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserBagByIds(String[] bagIds);
}
