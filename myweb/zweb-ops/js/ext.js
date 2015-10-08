			function DelAllCookie() {
				var strCookie = document.cookie;
				var arrCookie = strCookie.split("; "); // 将多cookie切割为多个名/值对
				for (var i = 0; i < arrCookie.length; i++) { // 遍历cookie数组，处理每个cookie对
					var arr = arrCookie[i].split("=");
					if (arr.length > 0)
						DelCookie(arr[0]);
				}

			}
			
			function GetCooki(offset)
			{
				var endstr = document.cookie.indexOf(";", offset);
				if (endstr == -1)
					endstr = document.cookie.length;
				return decodeURIComponent(document.cookie.substring(offset,
						endstr));
			}
			
			function DelCookie(name) {
				var exp = new Date();
				exp.setTime(exp.getTime() - 1);
				var cval = GetCookie(name);
				document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
			}

			function GetCookie(name) {
				var arg = name + "=";
				var alen = arg.length;
				var clen = document.cookie.length;
				var i = 0;
				while (i < clen) {
					var j = i + alen;
					if (document.cookie.substring(i, j) == arg)
						return GetCooki(j);
					i = document.cookie.indexOf(" ", i) + 1;
					if (i == 0)
						break;
				}
				return null;
			}
			
			
			function GetQueryString(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return unescape(r[2]);
				return null;
			}
			
			function ShowLoading(){
				$.mobile.loadingMessageTextVisible = true;
				$.mobile.loadingMessage="拼命加载中....";
				$.mobile.showPageLoadingMsg();
			}
			
			function ClearLoading(){
				$.mobile.hidePageLoadingMsg();
			}