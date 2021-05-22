package com.wyp.web.controller.offer;

import com.wyp.common.core.controller.BaseController;
import com.wyp.common.core.domain.AjaxResult;
import com.wyp.common.core.domain.entity.SysUser;
import com.wyp.common.core.page.TableDataInfo;
import com.wyp.common.utils.ShiroUtils;
import com.wyp.system.domain.UserBag;
import com.wyp.system.domain.UserPrivate;
import com.wyp.system.domain.UserReport;
import com.wyp.system.domain.UserReportMsg;
import com.wyp.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/msg")
public class MsgController extends BaseController {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IUserReportService userReportService;

    @Autowired
    private IUserReportMsgService userReportMsgService;

    @Autowired
    private IUserBagService userBagService;

    @Autowired
    private IUserPrivateService userPrivateService;

    /**
     * 私聊列表
     */
    @GetMapping("/list")
    public String privates(ModelMap modelMap) {
        SysUser sysUser = ShiroUtils.getSysUser();
        List<UserPrivate> userPrivates = userPrivateService.selectPrivateByReplyUserId(sysUser.getUserId());
        modelMap.put("msgs", userPrivates);
        return "offer/report/myprivates";
    }

//    /**
//     * 发送私聊
//     */
//    @ResponseBody
//    @PostMapping("/private/send")
//    public AjaxResult privateMsg(UserPrivate userPrivate){
//
//        if (userPrivate == null || userPrivate.getReplyUserId() == null) {
//            return AjaxResult.error();
//        }
//        SysUser sysUser = ShiroUtils.getSysUser();
//        userPrivate.setUserId(sysUser.getUserId());
//        userPrivate.setUserName(sysUser.getUserName());
//        userPrivate.setReplyUserName(userService.selectUserById(userPrivate.getReplyUserId()).getUserName());
//        userPrivate.setMsgStatus(0L);
//        userPrivate.setMsgTime(new Date());
//        return toAjax(userPrivateService.insertUserPrivate(userPrivate));
//    }


}
