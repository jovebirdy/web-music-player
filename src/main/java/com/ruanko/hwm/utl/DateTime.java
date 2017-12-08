package com.ruanko.hwm.utl;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间类
 * @author libaoshen PC
 *
 */
public class DateTime {
	/**
	 * 格式化时间为年月日
	 * @param date
	 * @return
	 */
	public static String format_ymd(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		return sdf.format(date);
	}
	
	/**
	 * 格式化时间为年月日时分秒
	 * @param date
	 * @return
	 */
	public static String format_ymdsfm(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
		return sdf.format(date);
	}
	
	/**
	 * 获取当前时间
	 */
	public static Date getCurrentTime() {
		return new java.sql.Date(new java.util.Date().getTime());
	}
	
	/**
	 * 判断两个日期是不是同一天
	 * @param lastDate
	 * @param now
	 * @return
	 */
	public static boolean judgeSameDay(Date lastDate, Date now) {
		if(lastDate.getYear() == now.getYear() && lastDate.getMonth() == now.getMonth() && lastDate.getDay() == now.getDay()) {
			return true;
		}
		
		return false;
	}
	
}
