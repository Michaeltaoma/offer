package com.wyp.web.controller.system;

import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import com.wyp.common.core.domain.entity.SysRole;
import com.wyp.system.domain.UserPrivate;
import com.wyp.system.domain.UserReportMsg;
import com.wyp.system.service.IUserPrivateService;
import com.wyp.system.service.IUserReportMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.wyp.common.config.WypConfig;
import com.wyp.common.constant.ShiroConstants;
import com.wyp.common.core.controller.BaseController;
import com.wyp.common.core.domain.AjaxResult;
import com.wyp.common.core.domain.entity.SysMenu;
import com.wyp.common.core.domain.entity.SysUser;
import com.wyp.common.core.text.Convert;
import com.wyp.common.utils.CookieUtils;
import com.wyp.common.utils.DateUtils;
import com.wyp.common.utils.ServletUtils;
import com.wyp.common.utils.ShiroUtils;
import com.wyp.common.utils.StringUtils;
import com.wyp.framework.shiro.service.SysPasswordService;
import com.wyp.system.service.ISysConfigService;
import com.wyp.system.service.ISysMenuService;

/**
 * 首页 业务处理
 *
 * @author wyp
 */
@Controller
public class SysIndexController extends BaseController {
    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private IUserPrivateService userPrivateService;

//    @Autowired
//    private IUserReportMsgService userReportMsgService;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap) {
        // 取身份信息
        SysUser user = ShiroUtils.getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("sideTheme", configService.selectConfigByKey("sys.index.sideTheme"));
        mmap.put("skinName", configService.selectConfigByKey("sys.index.skinName"));
        mmap.put("ignoreFooter", configService.selectConfigByKey("sys.index.ignoreFooter"));
        mmap.put("copyrightYear", WypConfig.getCopyrightYear());
        mmap.put("demoEnabled", WypConfig.isDemoEnabled());
        mmap.put("isDefaultModifyPwd", initPasswordIsModify(user.getPwdUpdateDate()));
        mmap.put("isPasswordExpired", passwordIsExpiration(user.getPwdUpdateDate()));

        UserPrivate userPrivate = new UserPrivate();
        userPrivate.setReplyUserId(user.getUserId());
//        userPrivate.setMsgStatus(0L);
        List<UserPrivate> userPrivates = userPrivateService.selectUserPrivateList(userPrivate);
        mmap.put("msgPrivates", userPrivates != null ? userPrivates.size() : 0);

//        UserReportMsg userReportMsg = new UserReportMsg();
//        userReportMsgService.selectUserReportMsgList(userReportMsg);

        // 菜单导航显示风格
        String menuStyle = configService.selectConfigByKey("sys.index.menuStyle");
        // 移动端，默认使左侧导航菜单，否则取默认配置
        String indexStyle = ServletUtils.checkAgentIsMobile(ServletUtils.getRequest().getHeader("User-Agent")) ? "index" : menuStyle;

        // 优先Cookie配置导航菜单
        Cookie[] cookies = ServletUtils.getRequest().getCookies();
        for (Cookie cookie : cookies) {
            if (StringUtils.isNotEmpty(cookie.getName()) && "nav-style".equalsIgnoreCase(cookie.getName())) {
                indexStyle = cookie.getValue();
                break;
            }
        }
//        String webIndex = "topnav".equalsIgnoreCase(indexStyle) ? "index-topnav" : "index";
//        return webIndex;
        List<SysRole> roles = user.getRoles();
        if (roles != null && roles.size() > 0) {
            for (SysRole role : roles) {
                if (role.getRoleId() == 100L) {
                    return "index-topnav";
                }
            }
        }
        return "index";
    }



    // 系统介绍
    @GetMapping("/system/main")
    public String main(ModelMap mmap) {
        mmap.put("version", WypConfig.getVersion());
        return "main";
    }

    // 检查初始密码是否提醒修改
    public boolean initPasswordIsModify(Date pwdUpdateDate) {
        Integer initPasswordModify = Convert.toInt(configService.selectConfigByKey("sys.account.initPasswordModify"));
        return initPasswordModify != null && initPasswordModify == 1 && pwdUpdateDate == null;
    }

    // 检查密码是否过期
    public boolean passwordIsExpiration(Date pwdUpdateDate) {
        Integer passwordValidateDays = Convert.toInt(configService.selectConfigByKey("sys.account.passwordValidateDays"));
        if (passwordValidateDays != null && passwordValidateDays > 0) {
            if (StringUtils.isNull(pwdUpdateDate)) {
                // 如果从未修改过初始密码，直接提醒过期
                return true;
            }
            Date nowDate = DateUtils.getNowDate();
            return DateUtils.differentDaysByMillisecond(nowDate, pwdUpdateDate) > passwordValidateDays;
        }
        return false;
    }
}
