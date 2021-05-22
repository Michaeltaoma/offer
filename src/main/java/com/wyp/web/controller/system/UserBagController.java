package com.wyp.web.controller.system;

import java.util.List;

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
import com.wyp.system.domain.UserBag;
import com.wyp.system.service.IUserBagService;
import com.wyp.common.core.controller.BaseController;
import com.wyp.common.core.domain.AjaxResult;
import com.wyp.common.utils.poi.ExcelUtil;
import com.wyp.common.core.page.TableDataInfo;

/**
 * 用户背景Controller
 *
 * @author wyp
 * @date 2021-05-04
 */
@Controller
@RequestMapping("/system/bag")
public class UserBagController extends BaseController {
    private String prefix = "system/bag";

    @Autowired
    private IUserBagService userBagService;

    @RequiresPermissions("system:bag:view")
    @GetMapping()
    public String bag() {
        return prefix + "/bag";
    }

    /**
     * 查询用户背景列表
     */
    @RequiresPermissions("system:bag:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserBag userBag) {
        startPage();
        List<UserBag> list = userBagService.selectUserBagList(userBag);
        return getDataTable(list);
    }


    /**
     * 新增用户背景
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存用户背景
     */
    @RequiresPermissions("system:bag:add")
    @Log(title = "用户背景", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserBag userBag) {
        return toAjax(userBagService.insertUserBag(userBag));
    }

    /**
     * 修改用户背景
     */
    @GetMapping("/edit/{bagId}")
    public String edit(@PathVariable("bagId") Long bagId, ModelMap mmap) {
        UserBag userBag = userBagService.selectUserBagById(bagId);
        mmap.put("userBag", userBag);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户背景
     */
    @RequiresPermissions("system:bag:edit")
    @Log(title = "用户背景", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserBag userBag) {
        int row;
        SysUser sysUser = ShiroUtils.getSysUser();
        userBag.setUserId(sysUser.getUserId());
        userBag.setUserName(sysUser.getUserName());
        if (userBag.getBagId() == null || userBag.getBagId() == 0)
            row = userBagService.insertUserBag(userBag);
        else {
            row = userBagService.updateUserBag(userBag);
        }
        return toAjax(row);
    }

    /**
     * 删除用户背景
     */
    @RequiresPermissions("system:bag:remove")
    @Log(title = "用户背景", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(userBagService.deleteUserBagByIds(ids));
    }
}
