package com.acoreful.notebook.commons.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author WallenHeng
 *
 */
public final class DateHelper {
	
	private static Map<String, DateFormat> dfMap;
	public final static String DF_DATE="yyyy-MM-dd";
	public final static String DF_TIME="HH:mm:ss";
	public final static String DF_DATE_TIME="yyyy-MM-dd HH:mm:ss";
	static {
		dfMap=new HashMap<>();
		dfMap.put(DF_DATE, new SimpleDateFormat(DF_DATE));
		dfMap.put(DF_TIME, new SimpleDateFormat(DF_TIME));
		dfMap.put(DF_DATE_TIME, new SimpleDateFormat(DF_DATE_TIME));
	}
	/**
	 * @return
	 */
	public static Date getNow(){
		return Calendar.getInstance().getTime();
	}
	/**
	 * @param dtPattern
	 * @return
	 */
	public static DateFormat getDateFormat(String dtPattern){
		DateFormat df=dfMap.get(dtPattern);
		if(df==null){
			df=new SimpleDateFormat(dtPattern);
		}
		return df;
	}
	/**
	 * @param dateStr
	 * @param dateFormat
	 * @return
	 */
	public static Date str2Date(String dateStr,String dateFormat){
		DateFormat df=getDateFormat(dateFormat);
		try {
			return df.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * @param date
	 * @param dateFormat
	 * @return
	 */
	public static String date2Str(Date date,String dateFormat){
		DateFormat df=dfMap.get(dateFormat);
		return df.format(date);
	}
}
