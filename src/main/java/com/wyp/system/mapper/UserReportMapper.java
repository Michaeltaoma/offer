package com.wyp.system.mapper;

import java.util.List;

import com.wyp.system.domain.UserReport;

/**
 * 用户上报Mapper接口
 *
 * @author wyp
 * @date 2021-05-04
 */
public interface UserReportMapper {
    /**
     * 查询用户上报
     *
     * @param reportId 用户上报ID
     * @return 用户上报
     */
    public UserReport selectUserReportById(Long reportId);

    /**
     * 查询用户上报列表
     *
     * @param userReport 用户上报
     * @return 用户上报集合
     */
    public List<UserReport> selectUserReportList(UserReport userReport);

    /**
     * 新增用户上报
     *
     * @param userReport 用户上报
     * @return 结果
     */
    public int insertUserReport(UserReport userReport);

    /**
     * 修改用户上报
     *
     * @param userReport 用户上报
     * @return 结果
     */
    public int updateUserReport(UserReport userReport);

    /**
     * 删除用户上报
     *
     * @param reportId 用户上报ID
     * @return 结果
     */
    public int deleteUserReportById(Long reportId);

    /**
     * 批量删除用户上报
     *
     * @param reportIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserReportByIds(String[] reportIds);
}
