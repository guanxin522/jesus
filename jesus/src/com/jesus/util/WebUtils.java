package com.jesus.util;
/**
 * 把一些公共方法放在这里
 */

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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
	 * @author 陈观鑫
	 * @param date
	 * @return
	 */
	public static Date transferTime(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Date sdate = null; //初始化 
			sdate = new java.sql.Date(date.getTime()); 
		return sdate;
	}
	
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
		return sb.toString();
	}
	
	public static void main(String[] args) {
		System.out.println(makeId("u"));
	}
	
	private static final int BUFFER_SIZE = 1024 * 1024;
	/**
	 * 
	 * @Title: copy
	 * @author 作者 E-mail: Chen Guanxin 490861319@qq.com 
	 * @Description: TODO 本地文件上传到服务器方法
	 * @param: @param src
	 * @param: @param dst      
	 * @return: void
	 */
	public static void copy(File src, File dst) {
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dst),
					BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
			in.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
