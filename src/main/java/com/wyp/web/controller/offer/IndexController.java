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
@RequestMapping("/offer")
public class IndexController extends BaseController {

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

    @Autowired
    private iMailService mailService;

    @Autowired
    private ISysUserService sysUserService;

    /**
     * 验证码的标题
     */
    private static final String SUBJECT = "Offer多多";

    @GetMapping("/index")
    public String login(HttpServletRequest request, HttpServletResponse response) {
        return "offer/index";
    }

    @GetMapping("/bag")
    public String report(ModelMap modelMap) {
        SysUser sysUser = ShiroUtils.getSysUser();
        UserBag userBag = new UserBag();
        userBag.setUserId(sysUser.getUserId());
        List<UserBag> userBags = userBagService.selectUserBagList(userBag);
        if (userBags.size() > 1) {
            for (int i = 1; i < userBags.size(); i++) {
                UserBag uBag = userBags.get(i);
                userBagService.deleteUserBagById(uBag.getBagId());
            }
        }

        if (userBags.size() == 1) {
            modelMap.put("userBag", userBags.get(0));
        } else {
            modelMap.put("userBag", new UserBag());
        }
        return "offer/bag/edit";
    }

    /**
     * 背景详情
     */
    @GetMapping("/bag/details/{userId}")
    public String details(ModelMap modelMap, @PathVariable("userId") Long userId) {
        UserBag userBag = new UserBag();
        userBag.setUserId(userId);
        List<UserBag> userBags = userBagService.selectUserBagList(userBag);
        if (userBags.size() > 0) {
            modelMap.put("userBag", userBags.get(0));
            return "offer/bag/details";
        } else {
            // 类似这样的返回的都是一个页面
            return "error/500";
        }
    }

    /**
     * 上报详情
     */
    @GetMapping("/report/details/{reportId}")
    public String offerDetails(ModelMap modelMap, @PathVariable("reportId") Long reportId) {
        if (reportId == null)
            return "error/500";

        UserReport userReport = userReportService.selectUserReportById(reportId);
        if (userReport == null)
            return "error/500";

        UserReportMsg userReportMsg = new UserReportMsg();
        userReportMsg.setReportId(reportId);
        List<UserReportMsg> userReportMsgs = userReportMsgService.selectUserReportMsgList(userReportMsg);

        modelMap.put("report", userReport);
        modelMap.put("msgs", userReportMsgs);
        modelMap.put("userId", ShiroUtils.getSysUser().getUserId());
        return "offer/report/details";
    }

    /**
     * 留言
     */
    @ResponseBody
    @PostMapping("/report/msg")
    public AjaxResult reportMsg(UserReportMsg userReportMsg) {
        SysUser sysUser = ShiroUtils.getSysUser();
        userReportMsg.setUserId(sysUser.getUserId());
        userReportMsg.setUserName(sysUser.getUserName());
        userReportMsg.setMsgStatus(0L);
        userReportMsg.setMsgTime(new Date());

        // 查找帖子
        UserReport userReport = userReportService.selectUserReportById(userReportMsg.getReportId());

        SysUser reportUser = sysUserService.selectUserById(userReport.getUserId());

        mailService.sendMail(reportUser.getEmail(), SUBJECT,
                String.format("你的帖子(%s)被留言了, 留言人: %s, 留言内容: %s", userReport.getTitle(), sysUser.getUserName(), userReportMsg.getMsgInfo()));

        return toAjax(userReportMsgService.insertUserReportMsg(userReportMsg));
    }

    /**
     * 私聊
     */
    @GetMapping("/report/privates/{userId}")
    public String privates(ModelMap modelMap, @PathVariable("userId") Long userId) {
        if (userId == null)
            return "error/500";

        SysUser sysUser = ShiroUtils.getSysUser();
        List<UserPrivate> msgs = userPrivateService.selectUserPrivateListByUserIds(sysUser.getUserId(), userId);
        modelMap.put("userId", userId);
        modelMap.put("msgs", msgs);
        return "offer/report/privates";
    }

    /**
     * 发送私聊
     */
    @ResponseBody // 加这个注解， 表示返回的是 json数据， 不是页面
    @PostMapping("/private/send")
    public AjaxResult privateMsg(UserPrivate userPrivate) {
        SysUser sysUser = ShiroUtils.getSysUser();
        if (userPrivate == null || userPrivate.getReplyUserId() == null || userPrivate.getReplyUserId().equals(sysUser.getUserId())) {
            return AjaxResult.error();
        }
        // 按住 ctrl建 然后进去方法
        SysUser replyUser = userService.selectUserById(userPrivate.getReplyUserId());
        userPrivate.setUserId(sysUser.getUserId());
        userPrivate.setUserName(sysUser.getUserName());
        userPrivate.setReplyUserName(replyUser.getUserName());
        userPrivate.setMsgStatus(0L);
        userPrivate.setMsgTime(new Date());
        int i = userPrivateService.insertUserPrivate(userPrivate);
        if (i != 1) {
            return toAjax(0);
        }
        mailService.sendMail(replyUser.getEmail(), SUBJECT,
                String.format("有人给你私聊, 私聊人: %s, 私聊内容: %s", replyUser.getUserName(), userPrivate.getMsgInfo()));
        return toAjax(1);
    }

    /**
     * 查询参数配置列表
     */
    @ResponseBody
    @PostMapping("/list")
    public TableDataInfo list(UserReport userReport) {
        startPage();
        if (userReport == null) {
            userReport = new UserReport();
        }
        userReport.setReportStatus(1L);
        List<UserReport> list = userReportService.selectUserReportList(userReport);
        return getDataTable(list);
    }

}
