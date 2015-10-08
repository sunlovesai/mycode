package com.xuess.util;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 日期的帮助类
 * @author xueshusai
 * @date   2015年10月3日
 */
public class DateHelper {

	public static String getCurrentDate(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentDate = new Date(System.currentTimeMillis());
		String str = format.format(currentDate);
		return str;
	}
}
