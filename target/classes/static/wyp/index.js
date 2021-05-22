/**
 * 首页方法封装处理
 */
layer.config({
    extend: 'moon/style.css',
    skin: 'layer-ext-moon'
});

var isMobile = false;
var sidebarHeight = isMobile ? '100%' : '96%';

$(function() {
    // MetsiMenu
    $('#side-menu').metisMenu();

});


function NavToggle() {
    $('.navbar-minimalize').trigger('click');
}

// 设置锚点
function setIframeUrl(href) {
	if($.common.equals("history", mode)) {
	    storage.set('publicPath', href);
	} else {
	    var nowUrl = window.location.href;
	    var newUrl = nowUrl.substring(0, nowUrl.indexOf("#"));
	    window.location.href = newUrl + "#" + href;
	}
}

function SmoothlyMenu() {
    if (isMobile && !$('body').hasClass('canvas-menu')) {
    	$('.navbar-static-side').fadeIn();
    	fixedSidebar();
    } else if (!isMobile &&!$('body').hasClass('mini-navbar')) {
    	fixedSidebar();
    	$("nav .logo").removeClass("hide");
    } else if (isMobile && $('body').hasClass('fixed-sidebar')) {
    	$('.navbar-static-side').fadeOut();
    	fixedSidebar();
    } else if (!isMobile && $('body').hasClass('fixed-sidebar')) {
    	fixedSidebar();
    } else {
        $('#side-menu').removeAttr('style');
    }
}

/**
 * iframe处理
 */
$(function() {
    //计算元素集合的总宽度
    function calSumWidth(elements) {
        var width = 0;
        $(elements).each(function() {
            width += $(this).outerWidth(true);
        });
        return width;
    }


    //通过遍历给菜单项加上data-index属性
    $(".menuItem").each(function(index) {
        if (!$(this).attr('data-index')) {
            $(this).attr('data-index', index);
        }
    });

    function menuItem() {
        // 获取标识数据
        var dataUrl = $(this).attr('href'),
        dataIndex = $(this).data('index'),
        menuName = $.trim($(this).text()),
        isRefresh = $(this).data("refresh"),
        flag = true;

        var $dataObj = $('a[href$="' + decodeURI(dataUrl) + '"]');
        if (!$dataObj.hasClass("noactive")) {
            $('.tab-pane li').removeClass("active");
            $('.nav ul').removeClass("in");
            $dataObj.parents("ul").addClass("in")
            $dataObj.parents("li").addClass("active").siblings().removeClass("active").find('li').removeClass("active");
            $dataObj.parents("ul").css('height', 'auto').height();
            $(".nav ul li, .nav li").removeClass("selected");
            $(this).parent("li").addClass("selected");
        }
        setIframeUrl(dataUrl);
        if (dataUrl == undefined || $.trim(dataUrl).length == 0) return false;

        // 选项卡菜单已存在
        $('.menuTab').each(function() {
            if ($(this).data('id') == dataUrl) {
                if (!$(this).hasClass('active')) {
                    $(this).addClass('active').siblings('.menuTab').removeClass('active');
                    scrollToTab(this);
                    // 显示tab对应的内容区
                    $('.mainContent .ZengFJ_iframe').each(function() {
                        if ($(this).data('id') == dataUrl) {
                            $(this).show().siblings('.ZengFJ_iframe').hide();
                            return false;
                        }
                    });
                }
                if (isRefresh) {
                    refreshTab();
                }
                flag = false;
                return false;
            }
        });
        // 选项卡菜单不存在
        if (flag) {
            var str = '<a href="javascript:;" class="active menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
            $('.menuTab').removeClass('active');

            // 添加选项卡对应的iframe
            var str1 = '<iframe class="ZengFJ_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
            $('.mainContent').find('iframe.ZengFJ_iframe').hide().parents('.mainContent').append(str1);

            $.modal.loading("数据加载中，请稍后...");

            $('.mainContent iframe:visible').load(function () {
            	$.modal.closeLoading();
            });

            // 添加选项卡
            $('.menuTabs .page-tabs-content').append(str);
            scrollToTab($('.menuTab.active'));
        }
        return false;
    }

    function menuBlank() {
    	// 新窗口打开外网以http:
    	var dataUrl = $(this).attr('href');
    	window.open(dataUrl);
    	return false;
    }

    $('.menuItem').on('click', menuItem);

    $('.menuBlank').on('click', menuBlank);



    // 刷新iframe
    function refreshTab() {
    	var currentId = $('.page-tabs-content').find('.active').attr('data-id');
    	var target = $('.ZengFJ_iframe[data-id="' + currentId + '"]');
        var url = target.attr('src');
    	target.attr('src', url).ready();
    }

});
