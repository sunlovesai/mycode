var zweb = zweb || {};
zweb.changeUrl = function(url) {
	window.history.pushState(null, null, url);
}
/**
 * 转换成百分号格式
 * 
 * @param num
 *            数值
 * @param decimalPlaces
 *            小数点后面的位数
 */
zweb.toPercent = function(num, decimalPlaces){
	if (typeof num === 'undefined' || num == null) return;
	if (typeof decimalPlaces === 'undefined') 
		return zweb.fmtNum(num, '0.00%');
	if (0 == decimalPlaces)
		return zweb.fmtNum(num, '0%');
	var suffix = new Number('').toFixed(decimalPlaces);
	return zweb.fmtNum(num, suffix+'%');
}

/**
 * 转换成逗号隔开的货币显示格式
 * 
 * @param num
 *            数值
 * @param decimalPlaces
 *            小数点后面的位数
 */
zweb.toCurrency = function(num, decimalPlaces){
	if (typeof num === 'undefined' || num == null) return;
	if (typeof decimalPlaces === 'undefined')
		return zweb.fmtNum(num, '0,0.00');
	if (0 == decimalPlaces)
		return zweb.fmtNum(num, '0,0');
	var suffix = new Number('').toFixed(decimalPlaces);
	return zweb.fmtNum(num, '0,'+suffix);
}

/**
 * 格式化数字
 * 
 * @param num
 *            数值
 * @param fmt
 *            格式： '0,0.00','0.0%'...
 */
zweb.fmtNum = function(num, fmt){
	if (typeof num === 'undefined' || num == null) return;
	if (typeof fmt === 'undefined' || fmt == null) return num;
	return numeral(new String(num*1.0)).format(fmt);
}

zweb.onXHRError = function(jqXHR, textStatus, errorThrown, callback) {
	if (callback) {
		callback(jqXHR, textStatus, errorThrown);
	} else {
		if (400 == jqXHR.status || 403 == jqXHR.status || 500 == jqXHR.status)
			return;
		var text = "操作失败，" + jqXHR.responseText;
		mini.alert(text);
	}
};

zweb.ajax = function(options, before_call, after_call) {
	var self = this;
	before_call && typeof before_call === 'function' && before_call(options);
	var url = options.url;
	if (url && url.indexOf('/') == 0) {
		options.url = url.substring(1, url.length);
	}
	url = basePath + '/' + url;
	var type = options.type ? options.type : 'post';
	$.ajax({
		url : url,
		type : type,
		data : options.data,
		success : function(data) {
			options.success && typeof options.success === 'function'
					&& options.success.call(self, data, options);
			after_call && typeof after_call === 'function'
					&& after_call(options);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			zweb.onXHRError(jqXHR, textStatus, errorThrown, options.error);
		}
	});
};

zweb.onKeyDown = function(keyCode, form, el, callback) {
	el && el.focus();
	$(form).keydown(function(e) {
		if (e.keyCode == keyCode) {
			if (e.srcElement.type == 'textarea')
				return ;
			
			el && el.blur();
			callback && callback(e);
			el && el.focus();
		}
	});
}
zweb.onESC = function(form, el, callback) {
	zweb.onKeyDown(27, form, el, callback);
}

zweb.onEnter = function(form, el, callback) {
	zweb.onKeyDown(13, form, el, callback);
}

// mini 扩展，使用ClassName来获取mini组件
zweb.getMiniCtrlByClass = function(cls, callback) {
	return $.map(mini.components, function(v) {
		var b = $(v.el).is('.' + cls + '');
		if (b)
			callback && callback(v);
		return b ? v : null
	});
}

//除法函数，用来得到精确的除法结果
zweb.div = function(arg1, arg2) {
	if (typeof arg1 === 'undefined' || arg1 == null) arg1 = '';
	if (typeof arg2 === 'undefined' || arg2 == null) arg2 = '';
	
	var t1 = 0, t2 = 0, r1, r2;
	try {
		t1 = arg1.toString().split(".")[1].length
	} catch (e) {
	}
	try {
		t2 = arg2.toString().split(".")[1].length
	} catch (e) {
	}
	with (Math) {
		r1 = Number(arg1.toString().replace(".", ""))
		r2 = Number(arg2.toString().replace(".", ""))
		return (r1 / r2) * pow(10, t2 - t1);
	}
}
zweb.toWan = function(num) {
	if (typeof num === 'undefined' || num == null) return 0;
	return zweb.div(num, 10000);
}

//乘法函数，用来得到精确的乘法结果
zweb.mul = function(arg1, arg2) {
	if (typeof arg1 === 'undefined' || arg1 == null) arg1 = '';
	if (typeof arg2 === 'undefined' || arg2 == null) arg2 = '';
	
	var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
	try {
		m += s1.split(".")[1].length
	} catch (e) {
	}
	try {
		m += s2.split(".")[1].length
	} catch (e) {
	}
	return Number(s1.replace(".", "")) * Number(s2.replace(".", ""))
			/ Math.pow(10, m)
}
zweb.fromWan = function(num){
	if (typeof num === 'undefined' || num == null) return 0;
	return zweb.mul(num, 10000);
}
zweb.fromPercent = function(num){
	if (typeof num === 'undefined' || num == null) return 0;
	return zweb.div(num, 100);
}
//加法函数，用来得到精确的加法结果
zweb.add = function(arg1, arg2) {
	if (typeof arg1 === 'undefined' || arg1 == null) arg1 = '';
	if (typeof arg2 === 'undefined' || arg2 == null) arg2 = '';
	
	var r1, r2, m;
	try {
		r1 = arg1.toString().split(".")[1].length
	} catch (e) {
		r1 = 0
	}
	try {
		r2 = arg2.toString().split(".")[1].length
	} catch (e) {
		r2 = 0
	}
	m = Math.pow(10, Math.max(r1, r2))
	return (arg1 * m + arg2 * m) / m
}
//减法函数，用来得到精确的减法结果
zweb.subtr = function(arg1, arg2) {
	if (typeof arg1 === 'undefined' || arg1 == null) arg1 = '';
	if (typeof arg2 === 'undefined' || arg2 == null) arg2 = '';
	
	var r1, r2, m, n;
	try {
		r1 = arg1.toString().split(".")[1].length
	} catch (e) {
		r1 = 0
	}
	try {
		r2 = arg2.toString().split(".")[1].length
	} catch (e) {
		r2 = 0
	}
	m = Math.pow(10, Math.max(r1, r2));
	// 动态控制精度长度
	n = (r1 >= r2) ? r1 : r2;
	return ((arg1 * m - arg2 * m) / m).toFixed(n);
}
//linux服务器，中文乱码问题
$.ajaxSetup({contentType:"application/x-www-form-urlencoded; charset=utf-8"});