package com.wyp.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wyp.system.mapper.UserReportMapper;
import com.wyp.system.domain.UserReport;
import com.wyp.system.service.IUserReportService;
import com.wyp.common.core.text.Convert;

/**
 * 用户上报Service业务层处理
 *
 * @author wyp
 * @date 2021-05-04
 */
@Service
public class UserReportServiceImpl implements IUserReportService {
    @Autowired
    private UserReportMapper userReportMapper;

    /**
     * 查询用户上报
     *
     * @param reportId 用户上报ID
     * @return 用户上报
     */
    @Override
    public UserReport selectUserReportById(Long reportId) {
        return userReportMapper.selectUserReportById(reportId);
    }

    /**
     * 查询用户上报列表
     *
     * @param userReport 用户上报
     * @return 用户上报
     */
    @Override
    public List<UserReport> selectUserReportList(UserReport userReport) {
        return userReportMapper.selectUserReportList(userReport);
    }

    /**
     * 新增用户上报
     *
     * @param userReport 用户上报
     * @return 结果
     */
    @Override
    public int insertUserReport(UserReport userReport) {
        return userReportMapper.insertUserReport(userReport);
    }

    /**
     * 修改用户上报
     *
     * @param userReport 用户上报
     * @return 结果
     */
    @Override
    public int updateUserReport(UserReport userReport) {
        return userReportMapper.updateUserReport(userReport);
    }

    /**
     * 删除用户上报对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUserReportByIds(String ids) {
        return userReportMapper.deleteUserReportByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户上报信息
     *
     * @param reportId 用户上报ID
     * @return 结果
     */
    @Override
    public int deleteUserReportById(Long reportId) {
        return userReportMapper.deleteUserReportById(reportId);
    }
}
