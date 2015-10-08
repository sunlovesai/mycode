var WinAlerts = window.alert;
window.alert = function(e) {
	try {
		if (e != null && e.indexOf("www.miniui.com") > -1) {
		} else {
			WinAlerts(e);
		}
	} catch (ex) {
		WinAlerts(e);
	}
};
$(document).ajaxComplete(function(evt, request, settings) {
	var text = request.responseText;
	var st = eval(request.status);
	if (401 == st) {
		top.location = basePath + "/login";
		return;
	}
	if (400 == st || 403 == st) {
		mini.alert(text);
	}
	if (500 == st) {
		mini.alert(text);
	}
});

// mini 扩展，使用ClassName来获取mini组件
var GetMiniByClass = zweb.getMiniCtrlByClass;

$(document).ready(function() {
	$(".logout").click(function(e) {
		//DelAllCookie();
		//top.window.open(_casServerUrl+'/logout?service='+_casLogoutUrl+'/?random='+Math.random() ,"_self");
		//if(1==1)return ;
		
		e.preventDefault();
		$.ajax({
			url : $(".logout").attr("href"),
			type : "post",
			cache : false,
			async : false,
			success : function(text) {
				mini.loading("退出成功", "提醒");
				setTimeout(function() {
					top.window.location.href = basePath+'/?random=' + Math.random();
				}, 500);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.responseText);
			}
		});
	});
});