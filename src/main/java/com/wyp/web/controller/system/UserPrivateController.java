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
import com.wyp.system.domain.UserPrivate;
import com.wyp.system.service.IUserPrivateService;
import com.wyp.common.core.controller.BaseController;
import com.wyp.common.core.domain.AjaxResult;
import com.wyp.common.utils.poi.ExcelUtil;
import com.wyp.common.core.page.TableDataInfo;

/**
 * 用户私聊Controller
 *
 * @author wyp
 * @date 2021-05-06
 */
@Controller
@RequestMapping("/system/privates")
public class UserPrivateController extends BaseController {
    private String prefix = "system/privates";

    @Autowired
    private IUserPrivateService userPrivateService;

    @RequiresPermissions("system:privates:view")
    @GetMapping()
    public String privates() {
        return prefix + "/privates";
    }

    /**
     * 查询用户私聊列表
     */
    @RequiresPermissions("system:privates:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserPrivate userPrivate) {
        startPage();
        List<UserPrivate> list = userPrivateService.selectUserPrivateList(userPrivate);
        return getDataTable(list);
    }

    /**
     * 导出用户私聊列表
     */
    @RequiresPermissions("system:privates:export")
    @Log(title = "用户私聊", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserPrivate userPrivate) {
        List<UserPrivate> list = userPrivateService.selectUserPrivateList(userPrivate);
        ExcelUtil<UserPrivate> util = new ExcelUtil<UserPrivate>(UserPrivate.class);
        return util.exportExcel(list, "用户私聊数据");
    }

    /**
     * 新增用户私聊
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存用户私聊
     */
    @RequiresPermissions("system:privates:add")
    @Log(title = "用户私聊", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserPrivate userPrivate) {
        return toAjax(userPrivateService.insertUserPrivate(userPrivate));
    }

    /**
     * 修改用户私聊
     */
    @GetMapping("/edit/{msgId}")
    public String edit(@PathVariable("msgId") Long msgId, ModelMap mmap) {
        UserPrivate userPrivate = userPrivateService.selectUserPrivateById(msgId);
        mmap.put("userPrivate", userPrivate);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户私聊
     */
    @RequiresPermissions("system:privates:edit")
    @Log(title = "用户私聊", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserPrivate userPrivate) {
        return toAjax(userPrivateService.updateUserPrivate(userPrivate));
    }

    /**
     * 删除用户私聊
     */
    @RequiresPermissions("system:privates:remove")
    @Log(title = "用户私聊", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(userPrivateService.deleteUserPrivateByIds(ids));
    }
}
