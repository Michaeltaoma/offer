package com.wyp.web.controller.system;

import java.util.List;

import com.wyp.common.constant.UserConstants;
import com.wyp.common.core.domain.entity.SysUser;
import com.wyp.common.utils.ShiroUtils;
import com.wyp.system.domain.UserBag;
import com.wyp.system.domain.UserSchool;
import com.wyp.system.service.IUserSchoolService;
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
import com.wyp.system.service.IUserBagService;
import com.wyp.common.core.controller.BaseController;
import com.wyp.common.core.domain.AjaxResult;
import com.wyp.common.utils.poi.ExcelUtil;
import com.wyp.common.core.page.TableDataInfo;

@Controller
@RequestMapping("/system/school")
public class UserSchoolController extends BaseController{

    private String prefix = "system/recommend";

    @Autowired
    private IUserSchoolService userSchoolService;

    @RequiresPermissions("system:recommend:view")
    @GetMapping()
    public String recommendSchool(){
        return prefix+"/recommend";
    }


    /**
     * 查询用户背景列表
     */
    @RequiresPermissions("system:recommend:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserSchool userSchool) {
        startPage();
        List<UserSchool> list = userSchoolService.selectRecommendateSchool(userSchool);
        return getDataTable(list);
    }


}
