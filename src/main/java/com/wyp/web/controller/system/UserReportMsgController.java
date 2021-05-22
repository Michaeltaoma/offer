package com.wyp.web.controller.system;

import java.util.List;

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
import com.wyp.system.domain.UserReportMsg;
import com.wyp.system.service.IUserReportMsgService;
import com.wyp.common.core.controller.BaseController;
import com.wyp.common.core.domain.AjaxResult;
import com.wyp.common.utils.poi.ExcelUtil;
import com.wyp.common.core.page.TableDataInfo;

/**
 * 用户上报留言Controller
 *
 * @author wyp
 * @date 2021-05-06
 */
@Controller
@RequestMapping("/system/msg")
public class UserReportMsgController extends BaseController {
    private String prefix = "system/msg";

    @Autowired
    private IUserReportMsgService userReportMsgService;

    @RequiresPermissions("system:msg:view")
    @GetMapping()
    public String msg() {
        return prefix + "/msg";
    }

    /**
     * 查询用户上报留言列表
     */
    @RequiresPermissions("system:msg:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserReportMsg userReportMsg) {
        startPage();
        List<UserReportMsg> list = userReportMsgService.selectUserReportMsgList(userReportMsg);
        return getDataTable(list);
    }

    /**
     * 导出用户上报留言列表
     */
    @RequiresPermissions("system:msg:export")
    @Log(title = "用户上报留言", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserReportMsg userReportMsg) {
        List<UserReportMsg> list = userReportMsgService.selectUserReportMsgList(userReportMsg);
        ExcelUtil<UserReportMsg> util = new ExcelUtil<UserReportMsg>(UserReportMsg.class);
        return util.exportExcel(list, "用户上报留言数据");
    }

    /**
     * 新增用户上报留言
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存用户上报留言
     */
    @RequiresPermissions("system:msg:add")
    @Log(title = "用户上报留言", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserReportMsg userReportMsg) {
        return toAjax(userReportMsgService.insertUserReportMsg(userReportMsg));
    }

    /**
     * 修改用户上报留言
     */
    @GetMapping("/edit/{msgId}")
    public String edit(@PathVariable("msgId") Long msgId, ModelMap mmap) {
        UserReportMsg userReportMsg = userReportMsgService.selectUserReportMsgById(msgId);
        mmap.put("userReportMsg", userReportMsg);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户上报留言
     */
    @RequiresPermissions("system:msg:edit")
    @Log(title = "用户上报留言", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserReportMsg userReportMsg) {
        return toAjax(userReportMsgService.updateUserReportMsg(userReportMsg));
    }

    /**
     * 删除用户上报留言
     */
    @RequiresPermissions("system:msg:remove")
    @Log(title = "用户上报留言", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(userReportMsgService.deleteUserReportMsgByIds(ids));
    }
}
