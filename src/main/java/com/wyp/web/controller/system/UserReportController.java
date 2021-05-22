package com.wyp.web.controller.system;

import java.util.List;

import com.wyp.common.constant.UserConstants;
import com.wyp.common.core.domain.entity.SysUser;
import com.wyp.common.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.wyp.common.annotation.Log;
import com.wyp.common.enums.BusinessType;
import com.wyp.system.domain.UserReport;
import com.wyp.system.service.IUserReportService;
import com.wyp.common.core.controller.BaseController;
import com.wyp.common.core.domain.AjaxResult;
import com.wyp.common.utils.poi.ExcelUtil;
import com.wyp.common.core.page.TableDataInfo;

/**
 * 用户上报Controller
 *
 * @author wyp
 * @date 2021-05-04
 */
@Controller
@RequestMapping("/system/report")
public class UserReportController extends BaseController {
    private String prefix = "system/report";

    @Autowired
    private IUserReportService userReportService;

    @RequiresPermissions("system:report:view")
    @GetMapping()
    public String report() {
        return prefix + "/report";
    }

    @RequiresPermissions("system:report:view")
    @GetMapping("/index")
    public String index() {
        return prefix + "/index";
    }

    /**
     * 查询用户上报列表
     */
    @RequiresPermissions("system:report:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserReport userReport) {
        startPage();
        if (userReport == null)
            userReport = new UserReport();

        SysUser sysUser = ShiroUtils.getSysUser();
        if (sysUser.getUserType().equals(UserConstants.REGISTER_USER_TYPE))
            userReport.setUserId(sysUser.getUserId());

        List<UserReport> list = userReportService.selectUserReportList(userReport);
        return getDataTable(list);
    }

    /**
     * 导出用户上报列表
     */
    @RequiresPermissions("system:report:export")
    @Log(title = "用户上报", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserReport userReport) {
        List<UserReport> list = userReportService.selectUserReportList(userReport);
        ExcelUtil<UserReport> util = new ExcelUtil<UserReport>(UserReport.class);
        return util.exportExcel(list, "用户上报数据");
    }

    /**
     * 新增用户上报
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存用户上报
     */
    @RequiresPermissions("system:report:add")
    @Log(title = "用户上报", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserReport userReport) {
        SysUser sysUser = ShiroUtils.getSysUser();
        if (sysUser.getEmail() == null || sysUser.getEmail().trim().equals("")) {
            return error("请先更新邮箱, 在进行上报(点击用户右上角头像-个人中心里面更新邮箱)");
        }
        userReport.setUserId(sysUser.getUserId());
        userReport.setUserName(sysUser.getUserName());
        userReport.setReportStatus(0L);
        return toAjax(userReportService.insertUserReport(userReport));
    }

    /**
     * 修改用户上报
     */
    @GetMapping("/edit/{reportId}")
    public String edit(@PathVariable("reportId") Long reportId, ModelMap mmap) {
        UserReport userReport = userReportService.selectUserReportById(reportId);
        mmap.put("userReport", userReport);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户上报
     */
    @RequiresPermissions("system:report:edit")
    @Log(title = "用户上报", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserReport userReport) {
        SysUser sysUser = ShiroUtils.getSysUser();
        userReport.setUserId(sysUser.getUserId());
        userReport.setUserName(sysUser.getUserName());
        userReport.setReportStatus(0L);
        return toAjax(userReportService.updateUserReport(userReport));
    }

    @RequiresPermissions("system:report:edit")
    @Log(title = "审批通过", businessType = BusinessType.UPDATE)
    @GetMapping("/adopt/{reportId}")
    @ResponseBody
    public AjaxResult adopt(@PathVariable("reportId") Long reportId) {
        UserReport userReport = new UserReport();
        userReport.setReportId(reportId);
        userReport.setReportStatus(1L);
        return toAjax(userReportService.updateUserReport(userReport));
    }

    @RequiresPermissions("system:report:edit")
    @Log(title = "审批拒绝", businessType = BusinessType.UPDATE)
    @GetMapping("/no/{reportId}")
    @ResponseBody
    public AjaxResult no(@PathVariable("reportId") Long reportId) {
        UserReport userReport = new UserReport();
        userReport.setReportId(reportId);
        userReport.setReportStatus(2L);
        return toAjax(userReportService.updateUserReport(userReport));
    }

    /**
     * 删除用户上报
     */
    @RequiresPermissions("system:report:remove")
    @Log(title = "用户上报", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(userReportService.deleteUserReportByIds(ids));
    }
}
