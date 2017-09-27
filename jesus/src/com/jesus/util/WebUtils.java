package com.jesus.util;
/**
 * 把一些公共方法放在这里
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 把一些公共方法放在这里
 */
public class WebUtils {
	/**
	 * 
	 * transferTime:JAVA的Date类型日期转换成sql日期
	 * TODO去掉日期的时间，保留年月日
	 * @author Guanxin Chen 
	 * @param date
	 * @return
	 */
	public static Date transferTime(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date sdate = null; //初始化 
			sdate = new java.sql.Date(date.getTime()); 
		return sdate;
	}
	
	/**
	 * 生成id
	 * @param idHead id开头字母
	 * @return
	 */
	public static String makeId(String idHead){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		StringBuffer id = new StringBuffer(idHead);
		id.append("-").append(sdf.format(new Date())).append("-").append(getRandomString(6)); 
		return id.toString().toUpperCase();
	}
	
	/**
	 * 生成任意长度的字符串
	 * 
	 * @param length
	 * @return
	 */
	public static String getRandomString(int length) {
		String base = UUID.randomUUID().toString().replaceAll("-", "");
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		System.out.println(base);
		return sb.toString();
	}
	
	public static void main(String[] args) {
		System.out.println(makeId("u"));
	}
	
}
