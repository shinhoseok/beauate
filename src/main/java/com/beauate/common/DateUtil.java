package com.beauate.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DateUtil {
	
	protected static final Log log = LogFactory.getLog(DateUtil.class);
	
	public DateUtil() {
		
	}
	
	/**
     * 현재 날짜를 Date형으로 반환
     * @return
     */
    public static java.util.Date getCurrentTime(){
      Calendar cal = Calendar.getInstance();
      return cal.getTime();
    }
    
    /** 
     * System의 현재 날짜를 HHmmssS형식으로 반환하는 method 
     **/
    public static String getCurrentTimeString()
    {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "HHmmssS");
    }
    
    /** 
     * System의 현재 날짜를 yyyyMMdd형식으로 반환하는 method 
     **/
    public static String getCurrentDate()
    {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "yyyyMMdd");
    }
    
    /**
     * 현재 날짜의 년도를 반환
     * @return
     */
    public static String getCurrentYear() {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "yyyy");
    }
    
    /**
     * 현재 날짜의 월을 반환
     * @return
     */
    public static String getCurrentMonth() {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "MM");
    }
    
    /**
     * 현재 날짜의 시간을 반환
     * @return
     */
    public static String getCurrentHour() {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "HH");
    }
    
    /**
     * 현재 날짜의 시간의 분을 리턴
     * @return
     */
    public static String getCurrentMinute() {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "mm");
    }
    
    /**
     * 현재 날짜의 월을 반환
     * @return
     */
    public static String getCurrentDay() {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "dd");
    }
    
    /**
     * 현재 날짜의 년,월,일,시간,분,초 반환
     * @return
     */
    public static String getCurrentDateTime()
    {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "yyyy-MM-dd HH:mm:ss");
    }
    
    /**
     * 현재 날짜의 년,월,일 반환
     * @return
     */
    public static String getCurrentYearMonthDay()
    {
        Calendar cal = Calendar.getInstance();
        return getDateFormat(cal.getTime(), "yyyy-MM-dd");
    }
    
    /**
     * 날짜를 원하는 format으로 변환 하여 String으로 반환
     * @param date
     * @param format
     * @return
     */
    public static String getDateFormat(Date date, String format){
      SimpleDateFormat formatter = new SimpleDateFormat (format);     
      return formatter.format(date);
    }     
            
    
    /** 8자리 숫자를 temp 로 구분하여 날짜 형태로 반환 ex) 2001-08-11  */            
    public static String getDateFormat(String str, String temp)
    {
        String result="";
        str = StringUtil.toNNull(str);
        str = StringUtil.toNNull(str.trim());
        if (str.length()!=8)
        {
            return str;
        }
        else
        {
            result = str.substring(0,4) + temp + str.substring(4,6) + temp + str.substring(6,8);
            return result;
        }
    }
    
    
    public static String getDateFormat(String str)
    {
        String result="";
        str = StringUtil.toNNull(str);
        str = StringUtil.toNNull(str.trim());
        if (str.length()!=8)
        {
            return str;
        }
        else
        {
            result = str.substring(0,4) + "." + str.substring(4,6) + "." + str.substring(6,8);
            return result;
        }
    }
    
    /**
     * 8자리 날짜를 년월일 형태로 변환
     * @param str
     * @return
     */
    public static String getDateKorFormat(String str)
    {
        String result="";
        str = StringUtil.toNNull(str);
        str = StringUtil.toNNull(str.trim());
        if (str.length()!=8)
        {
            return str;
        }
        else
        {
            result = str.substring(0,4) + "  년    " + str.substring(4,6) + "  월    " + str.substring(6,8) + "  일";
            return result;
        }
    }
            
    /**
     * 입력받은 String오브젝트를 Date 형으로 만들어 리턴
     * @param d
     * @return
     */
    public static java.util.Date stringToDate(String d )
    {
        String format = "yyyyMMddHHmmssSSS";
        java.util.Date ch = null;
        try
        {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            ch = sdf.parse(d);
        } catch(ParseException e) { 
        	log.debug("ParseException");
        }
        return ch;
    }    
    
    /**
     * 'YYYY-MM-DD' 형태의 String형을 Date형으로 만들어 리턴
     * @param d
     * @return
     */
    public static Date stringToDate2 ( String d ) {

        int year = Integer.parseInt(d.substring(0, 4)); 
        int month = Integer.parseInt(d.substring(5, 7)); 
        int day = Integer.parseInt(d.substring(8,10));

        Calendar cdate = java.util.Calendar.getInstance(); 
        cdate.set(Calendar.YEAR, year); 
        cdate.set(Calendar.MONTH, month-1); // 0 이 1월, 1 은 2월, .... 
        cdate.set(Calendar.DATE, day); 

        Date ddate = cdate.getTime(); // java.sql.Date 가 아님..  
        return ddate;
    }
    
    /**
     * 'YYYY-MM-DD' 형태의 String형을 Date형으로 만들어 리턴
     * @param d
     * @return
     */
    public static Date stringToDate3 ( String d ) {

        int year = Integer.parseInt(d.substring(0, 4)); 
        int month = Integer.parseInt(d.substring(4, 6)); 
        int day = Integer.parseInt(d.substring(6));

        Calendar cdate = java.util.Calendar.getInstance(); 
        cdate.set(Calendar.YEAR, year); 
        cdate.set(Calendar.MONTH, month-1); // 0 이 1월, 1 은 2월, .... 
        cdate.set(Calendar.DATE, day); 

        Date ddate = cdate.getTime(); // java.sql.Date 가 아님..  
        return ddate;
    }
    
    /**
     * 'YYYY-MM-DD HH:MM' 형태의 String형을 Date형으로 만들어 리턴
     * @param d
     * @return
     */
    public static Date stringToDate4 ( String d ) {

    	int year = Integer.parseInt(d.substring(0, 4)); 
        int month = Integer.parseInt(d.substring(5, 7)); 
        int day = Integer.parseInt(d.substring(8,10));
        int hour = Integer.parseInt(d.substring(11,13));
        int min = Integer.parseInt(d.substring(14,16));
        
        Calendar cdate = java.util.Calendar.getInstance(); 
        cdate.set(Calendar.YEAR, year); 
        cdate.set(Calendar.MONTH, month-1); // 0 이 1월, 1 은 2월, .... 
        cdate.set(Calendar.DAY_OF_MONTH, day); 
        cdate.set(Calendar.HOUR_OF_DAY, hour);
        cdate.set(Calendar.MINUTE, min);
        
        Date uDate = cdate.getTime();

        return uDate;
    }
    
    /**
     * 'YYYY-MM-DD HH:MM:SS' 형태의 String형을 Date형으로 만들어 리턴
     * @param d
     * @return
     */
    public static Date stringToDateTime ( String d ) {

        int year = Integer.parseInt(d.substring(0, 4)); 
        int month = Integer.parseInt(d.substring(5, 7)); 
        int day = Integer.parseInt(d.substring(8,10));
        int hour = Integer.parseInt(d.substring(11,13));
        int min = Integer.parseInt(d.substring(14,16));
        int sec = Integer.parseInt(d.substring(17));
        
        Calendar cdate = java.util.Calendar.getInstance(); 
        cdate.set(Calendar.YEAR, year); 
        cdate.set(Calendar.MONTH, month-1); // 0 이 1월, 1 은 2월, .... 
        cdate.set(Calendar.DAY_OF_MONTH, day); 
        cdate.set(Calendar.HOUR_OF_DAY, hour);
        cdate.set(Calendar.MINUTE, min);
        cdate.set(Calendar.SECOND, sec );
        
        Date uDate = cdate.getTime();

        return uDate;
    }
    
    /**
     * 'YYYY-MM-DD' 형태의 String형을 Date형으로 만들어 리턴
     * @param c
     * @return
     */
    public static Date wfStringToDateTime ( String d ) {

        int year = Integer.parseInt(d.substring(0, 4)); 
        int month = Integer.parseInt(d.substring(5, 7)); 
        int day = Integer.parseInt(d.substring(8,10));
        //int hour = Integer.parseInt(d.substring(11,13));
        //int min = Integer.parseInt(d.substring(14,16));
        //int sec = Integer.parseInt(d.substring(17));
        
        Calendar cdate = java.util.Calendar.getInstance(); 
        cdate.set(Calendar.YEAR, year); 
        cdate.set(Calendar.MONTH, month-1); // 0 이 1월, 1 은 2월, .... 
        cdate.set(Calendar.DAY_OF_MONTH, day); 

        Date uDate = cdate.getTime();

        return uDate;
    }
    
    /**
     * 'yyyyMMddHHmmss' 형태의 String형을 Date형으로 만들어 리턴
     * @param d
     * @return
     */
    public static Date stringToDateTime2( String d ) {

        int year = Integer.parseInt(d.substring(0, 4)); 
        int month = Integer.parseInt(d.substring(4, 6)); 
        int day = Integer.parseInt(d.substring(6,8));
        int hour = Integer.parseInt(d.substring(8,10));
        int min = Integer.parseInt(d.substring(10,12));
        int sec = Integer.parseInt(d.substring(12));
        
        Calendar cdate = java.util.Calendar.getInstance(); 
        cdate.set(Calendar.YEAR, year); 
        cdate.set(Calendar.MONTH, month-1); // 0 이 1월, 1 은 2월, .... 
        cdate.set(Calendar.DAY_OF_MONTH, day); 
        cdate.set(Calendar.HOUR_OF_DAY, hour);
        cdate.set(Calendar.MINUTE, min);
        cdate.set(Calendar.SECOND, sec );
        
        Date uDate = cdate.getTime();

        return uDate;
    }    
    
    /**
     * 날짜 사이의 월수 구하기
     * 날짜형 YYYY-MM-DD
     * @param fromDate
     * @param toDate
     * @return
     */
    public static int getMonthDiff(String fromDate, String toDate) { 
            
            if(fromDate.length() < 6) return -1;
            if(toDate.length() < 6) return -1;

            int year1  = Integer.parseInt(fromDate.substring(0,4));
            int month1 = Integer.parseInt(fromDate.substring(5,7)) - 1;
            
            int year2  = Integer.parseInt(toDate.substring(0,4));
            int month2 = Integer.parseInt(toDate.substring(5,7)) - 1;       
            
            Calendar c1 = Calendar.getInstance(); 
            Calendar c2 = Calendar.getInstance(); 

            c1.set(year1, month1, 15); 
            c2.set(year2, month2, 15); 
            
            long d1 = c1.getTime().getTime();
            long d2 = c2.getTime().getTime();
            int months =(int)((d2-d1)/(1000*60*60*24)/30); 
            
            return months; 
      }
    
    
    /**
     * 날짜 사이의 일수 구하기
     * 날짜형 YYYY-MM-DD
     * @param fromDate
     * @param toDate
     * @return
     */
    public static int getDayDiff(String fromDate, String toDate) { 
            
            if(fromDate.length() < 6) return -1;
            if(toDate.length() < 6) return -1;

            int year1  = Integer.parseInt(fromDate.substring(0,4));
            int month1 = Integer.parseInt(fromDate.substring(5,7));
            int day1 = Integer.parseInt( fromDate.substring(8,10) );
            
            int year2  = Integer.parseInt(toDate.substring(0,4));
            int month2 = Integer.parseInt(toDate.substring(5,7));       
            int day2 = Integer.parseInt( toDate.substring(8,10) );
          
            Calendar c1 = Calendar.getInstance(); 
            Calendar c2 = Calendar.getInstance(); 

            c1.set(year1, (month1-1), day1); 
            c2.set(year2, (month2-1), day2); 
            
            long d1 = c1.getTime().getTime();
            long d2 = c2.getTime().getTime();
            int day =(int)((d2-d1)/(1000*60*60*24)); 
            
            return day; 
      }    
    
    /**
    * return add day to date strings
    * @param str
    * @param day
    * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 일수 더하기
    *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
    */
    public static String addDays(String str, int day) {
        return addDays(str, day, "yyyy-MM-dd");
    }

    /**
    * return add day to date strings with user defined format.
    * @param str
    * @param day
    * @param format string representation of the date format. For example, "yyyy-MM-dd".
    * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 일수 더하기
    *           형식이 잘못 되었거나 존재하지 않는 날짜: java.text.ParseException 발생
    */
    public static String addDays(String str, int day, String format) {
        
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(format, java.util.Locale.KOREA);
        java.util.Date date = stringToDate4(str);
        //log.debug("addDays:"+date);
        //log.debug("date.getTime():"+date.getTime());
        date.setTime(date.getTime() + ((long)day * 1000 * 60 * 60 * 24));
        return formatter.format(date);
    }
  
    /**
     * 현재 날짜의 요일을 가져온다.
     * @param d
     * @return
     */
    public static int getCurrentWeek( Date d ) { 
        String strDate = getDateFormat(d, "yyyy-MM-dd");

        int year  = Integer.parseInt(strDate.substring(0,4));
        int month = Integer.parseInt(strDate.substring(5,7));
        int day = Integer.parseInt( strDate.substring(8,10) );
        
        Calendar c = Calendar.getInstance(); 
        c.set(year, (month-1), day);
        
        return c.get( Calendar.DAY_OF_WEEK );
    }
    
    /**
     * 현재 시간에 대한 영문 일, 영문월 숫자일, 몇년2007
     * Monday, March 5, 2007
     */
     public static String getTimeDetail(){
        
		String totalTime = "";
		String currentDay = "";
		String weekName = "";
		String monthName = "";
		String yearName = "";

		Calendar cal = Calendar.getInstance();
		currentDay = getDateFormat(cal.getTime(), "dd");

		int year = cal.get(Calendar.YEAR);
		int week = cal.get(Calendar.DAY_OF_WEEK);
		int month = cal.get(Calendar.MONTH);

		switch (week) {
		case 1:
			weekName = "Sunday";
			break;
		case 2:
			weekName = "Monday";
			break;
		case 3:
			weekName = "Tuesday";
			break;
		case 4:
			weekName = "Wednesday";
			break;
		case 5:
			weekName = "Thursday";
			break;
		case 6:
			weekName = "Friday";
			break;
		case 7:
			weekName = "Saturday";
			break;
		}

		switch (month) {
		case 0:
			monthName = "Junuary ";
			break;
		case 1:
			monthName = "February ";
			break;
		case 2:
			monthName = "March ";
			break;
		case 3:
			monthName = "April ";
			break;
		case 4:
			monthName = "May ";
			break;
		case 5:
			monthName = "June ";
			break;
		case 6:
			monthName = "July ";
			break;
		case 7:
			monthName = "August ";
			break;
		case 8:
			monthName = "September ";
			break;
		case 9:
			monthName = "October ";
			break;
		case 10:
			monthName = "November ";
			break;
		case 11:
			monthName = "December ";
			break;
		}

		yearName = Integer.toString(year);
		// totalTime=weekName+","+monthName+currentDay+", "+yearName;
		totalTime = monthName + currentDay + ", " + yearName;

		return totalTime;
     }
     
    /**
     * 2008.02.22 장현정 추가 - 타임머신을 위한 함수
     * 입력받은 시간에 대한 영문 일, 영문월 숫자일, 몇년2007
     * Monday, March 5, 2007
     */
     public static String getTimeDetailUser(String fdate){
        
		String totalTime = "";
		String currentDay = "";
		String weekName = "";
		String monthName = "";
		String yearName = "";

		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(fdate.substring(0, 4)),
				Integer.parseInt(fdate.substring(4, 6)) - 1,
				Integer.parseInt(fdate.substring(6, 8)));
		currentDay = fdate.substring(6, 8);

		int year = cal.get(Calendar.YEAR);
		int week = cal.get(Calendar.DAY_OF_WEEK);
		int month = cal.get(Calendar.MONTH);

		switch (week) {
		case 1:
			weekName = "Sunday";
			break;
		case 2:
			weekName = "Monday";
			break;
		case 3:
			weekName = "Tuesday";
			break;
		case 4:
			weekName = "Wednesday";
			break;
		case 5:
			weekName = "Thursday";
			break;
		case 6:
			weekName = "Friday";
			break;
		case 7:
			weekName = "Saturday";
			break;
		}

		switch (month) {
		case 0:
			monthName = "Junuary ";
			break;
		case 1:
			monthName = "February ";
			break;
		case 2:
			monthName = "March ";
			break;
		case 3:
			monthName = "April ";
			break;
		case 4:
			monthName = "May ";
			break;
		case 5:
			monthName = "June ";
			break;
		case 6:
			monthName = "July ";
			break;
		case 7:
			monthName = "August ";
			break;
		case 8:
			monthName = "September ";
			break;
		case 9:
			monthName = "October ";
			break;
		case 10:
			monthName = "November ";
			break;
		case 11:
			monthName = "December ";
			break;
		}

		yearName = Integer.toString(year);
		totalTime = monthName + currentDay + ", " + yearName;

		return totalTime;
     }
     
     public static String getLastDate(String year , String month ){
    	 Calendar cal = Calendar.getInstance();
    	 cal.set(Integer.parseInt(year) , Integer.parseInt(month)-1 , 1);
    	 int lastDay = cal.getActualMaximum(Calendar.DATE);
    	 
    	 String lastDays = year + "" + month +"" + (( lastDay < 10 )? "0"+ lastDay : lastDay );
    	 return lastDays;
     }
     
     //일정관리 주간 일정관련
     public static Map getDateWeek(  String year , String month , String day ){
 		String startendWeek = "";
 		String weekDays = "";
 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 		GregorianCalendar cal = new GregorianCalendar ( );
 		cal.set(Integer.parseInt(year) , Integer.parseInt(month)-1 , Integer.parseInt(day));
     	String today = sdf.format((Date)(cal.getTime()));    	
 		//DateFormat format = new SimpleDateFormat("EE");
     	String day_of_week = String.valueOf(cal.get(Calendar.WEEK_OF_YEAR));
         cal.set(Calendar.YEAR, Integer.valueOf(cal.get(Calendar.YEAR)));
         cal.set(Calendar.WEEK_OF_YEAR, Integer.parseInt(day_of_week));
         for(int i = 1; i <= 7; ++i) {
             cal.set(Calendar.DAY_OF_WEEK, i);
             weekDays += ( weekDays =="" )?String.valueOf(cal.get(Calendar.YEAR )) : ","+String.valueOf(cal.get(Calendar.YEAR ));
             weekDays += (cal.get(Calendar.MONTH) +1) <10 ? "0"+(cal.get(Calendar.MONTH) +1) : (cal.get(Calendar.MONTH) +1);
             weekDays += cal.get(Calendar.DATE ) <10 ? "0"+cal.get(Calendar.DATE ) : cal.get(Calendar.DATE ); 
         }
         startendWeek = weekDays.split(",")[0] + "," +weekDays.split(",")[6];
         String dayWeek = "일,월,화,수,목,금,토";
         Map week_month = new HashMap();
         week_month.put("today", today.replace("-", ""));
         week_month.put("month", today.split("-")[0] + "" + today.split("-")[1]);
         week_month.put("week",startendWeek);
         week_month.put("weekDays",weekDays);
         week_month.put("dayWeek",dayWeek);
                 
         
         
 		return week_month;
 	}
     
     //이전 다음 날짜 구하기
     public static Map getDateDays(  String year , String month , String day , String type , int value , String format){
  		SimpleDateFormat sdf = new SimpleDateFormat(format);
  		//GregorianCalendar cal = new GregorianCalendar();
  		Calendar cal = Calendar.getInstance();
  		cal.set(Integer.parseInt(year) , Integer.parseInt(month)-1 , Integer.parseInt(day));
  		
  		String stDays = "";
  		String startendDays = "";
  		String dayTemp = "";
  		String [] week  = {"일","월","화","수","목","금","토"};
  		for(int i=0;i<value;i++){
  			Date tempTime = cal.getTime();  			
  			stDays += (stDays =="")? sdf.format(tempTime): "," + sdf.format(tempTime);
  			dayTemp += ( dayTemp == "") ? week[cal.get(Calendar.DAY_OF_WEEK)-1]: "," + week[cal.get(Calendar.DAY_OF_WEEK)-1];
  			if( i == 0 || i == (value-1) ){
  				startendDays += (startendDays =="")? sdf.format(tempTime): "," + sdf.format(tempTime);
  			}
  			if("next".equals(type) || "".equals(type)){
  	  			cal.add(cal.DATE, 1);
  	  		}else{
  	  			cal.add(cal.DATE, -1);
  	  		}  			
  			  					
  		}
         
          Map nextPreDays = new HashMap();
          nextPreDays.put("stDays",stDays);
          nextPreDays.put("startendDays",startendDays);
          nextPreDays.put("weeks",dayTemp);
          
          
  		return nextPreDays;
  	}
     
     //이전 다음 일정 세팅
     public static Map getDateOfDay(  String year , String month , String day , String tabType , String schedulePmValue , String format , String clicknps , int stepValue){
    	 
  		SimpleDateFormat sdf = new SimpleDateFormat(format);
  		GregorianCalendar cal = new GregorianCalendar ( );
  		cal.set(Integer.parseInt(year) , Integer.parseInt(month)-1 , Integer.parseInt(day));
  		
  		if("month".equals(tabType)){
  			if("p".equals(schedulePmValue))
  				cal.add(cal.MONTH, 1);
  			else
  				cal.add(cal.MONTH, -1);
  		}else if("week".equals(tabType)){
  			if("p".equals(schedulePmValue))
  				cal.add(cal.DATE, 7);
  			else
  				cal.add(cal.DATE, -7);
  		}else if("day".equals(tabType) ){
  			if("p".equals(schedulePmValue))
  				cal.add(cal.DATE, 1);
  			else
  				cal.add(cal.DATE, -1);
  		}else if( "year".equals(tabType) ){
  			if("p".equals(schedulePmValue))
  				cal.add(cal.YEAR, 1);
  			else
  				cal.add(cal.YEAR, -1);
  		}else if("allSchedule".equals(tabType)){
  			if("".equals(clicknps)){
  				if("p".equals(schedulePmValue))
  	  				cal.add(cal.DATE, 1);
  	  			else
  	  				cal.add(cal.DATE, -1);
  			}else{
  				if("p".equals(schedulePmValue))
  	  				cal.add(cal.DATE, stepValue);
  	  			else
  	  				cal.add(cal.DATE, -stepValue);
  			}
  		}
  			
  		
  		Date days = cal.getTime();
  		String daysValue = sdf.format(days);
  		
         
        Map data = new HashMap();
        data.put("daysValue",daysValue);
        
        
          
  		return data;
  	}
     
     
     //시간 구하기
     public static Map getDateTimes(   int value , String ampmVal , String hourVal , String minVal){
   		
   		Calendar now = Calendar.getInstance();
   		TimeZone tz = TimeZone.getTimeZone("GMT+09:00");
   		now.setTimeZone(tz);
		String ampm = (ampmVal != null)? ampmVal : ( ( now.get(Calendar.AM_PM) == 0)? "오전" : "오후" );
		String hour = ( hourVal != null)? hourVal : ( ( now.get(Calendar.HOUR) < 10)? "0"+ String.valueOf(now.get(Calendar.HOUR)) : String.valueOf(now.get(Calendar.HOUR)) );
		String min =  ( minVal != null )? minVal : ( (now.get(Calendar.MINUTE) >= 0 && now.get(Calendar.MINUTE) < 30)?  "00" : "30");		
		String startTimes = ampm +":" + (hour.equals("00")? "12" : hour) + ":" + min;
		String startFullTimes = ampm +" " + (hour.equals("00")? "12" : hour) + "시 " + min + "분";
		
		int ampmInId =  ( "오후".equals(ampm) && Integer.parseInt(hour) == 12)  ? 0 : (( "오전".equals(ampm) && Integer.parseInt(hour) == 12)? 1 : ( "오전".equals(ampm) ? 0 : 1)   );
		now.set(Calendar.AM_PM, ampmInId);
		now.set(Calendar.HOUR, Integer.valueOf(hour));
		now.set(Calendar.MINUTE, Integer.valueOf(min));
		now.add(Calendar.HOUR, value);
		ampm = ( now.get(Calendar.AM_PM) == 0)? "오전" : "오후";
		hour = ( now.get(Calendar.HOUR) < 10 && now.get(Calendar.HOUR) > 0)? "0"+ String.valueOf(now.get(Calendar.HOUR)) :  String.valueOf( ( now.get(Calendar.HOUR) == 0)? 12 : now.get(Calendar.HOUR) );
		min =  (now.get(Calendar.MINUTE) >= 0 && now.get(Calendar.MINUTE) < 30)?  "00" : "30";
		String endTimes = ampm +":" + (hour.equals("00")? "12" : hour) + ":" + min;
		String endFullTimes = ampm +" " + (hour.equals("00")? "12" : hour) + "시 " + min + "분";
   		
    	 Map data = new HashMap();
    	 data.put("startTimes", startTimes);
    	 data.put("endTimes", endTimes);
    	 data.put("startFullTimes", startFullTimes);
    	 data.put("endFullTimes", endFullTimes);
    	 
    	 return data;
     }
     
 	public static Map getDateWeekValue(  String year , String month , String day , int value){
 		String startendWeek = "";
 		String weekDays = "";
 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 		GregorianCalendar cal = new GregorianCalendar ( );
 		cal.set(Integer.parseInt(year) , Integer.parseInt(month)-1 , Integer.parseInt(day));
 		DateFormat format = new SimpleDateFormat("EE");
     	String day_of_week = String.valueOf(cal.get(Calendar.WEEK_OF_YEAR));
     	    	
         cal.set(Calendar.YEAR, Integer.valueOf(cal.get(Calendar.YEAR)));
         cal.set(Calendar.WEEK_OF_YEAR, Integer.parseInt(day_of_week)+value);
         Map week_month = new HashMap();
         String dayNum = String.valueOf(cal.get(Calendar.DAY_OF_WEEK ));
         week_month.put("dayNum",dayNum);
         int num = Integer.parseInt(dayNum);
         
         for(int i = 1; i <= 7; ++i) {
             cal.set(Calendar.DAY_OF_WEEK, i);
             weekDays += ( weekDays =="" )?String.valueOf(cal.get(Calendar.YEAR )) : ","+String.valueOf(cal.get(Calendar.YEAR ));
             weekDays += (cal.get(Calendar.MONTH) +1) <10 ? "0"+(cal.get(Calendar.MONTH) +1) : (cal.get(Calendar.MONTH) +1);
             weekDays += cal.get(Calendar.DATE ) <10 ? "0"+cal.get(Calendar.DATE ) : cal.get(Calendar.DATE );            
         }
         
         startendWeek = weekDays.split(",")[0] + "," +weekDays.split(",")[6];
         String weekNumDay = weekDays.split(",")[num-1];
         week_month.put("weekNumDay",weekNumDay);
         week_month.put("week",startendWeek);
         week_month.put("weekDays",weekDays);
         
         
 		return week_month;
 	}
 
 	
    /**
     * String형을 Date 형으로 만들어 리턴
     * @param dateString
     * @param userLocale
     * @param timeZone
     * @return calDate
     */
 	public static Calendar parseDateString(String dateString, Locale userLocale, TimeZone timeZone) {
		Calendar calDate = null;
		if ( dateString != null && !dateString.equals("")) {
			DateFormat df = getDateFormatInstance(userLocale);
			calDate = getTimeZoneBasedCalendar(df,dateString,userLocale,timeZone);
		}
		return calDate;
	}
 	
 	private static DateFormat getDateFormatInstance(Locale userLocale) {
		String localeLanguage = userLocale.getLanguage();
		if(localeLanguage.equals(""))
			localeLanguage = "DEFAULT";
		
		return new SimpleDateFormat("yyyy-MM-dd HH:mm"); //DateFormat.getDateInstance(DateFormat.MEDIUM, userLocale);
	}
 	
 	private static Calendar getTimeZoneBasedCalendar(DateFormat df, String dateString, Locale userLocale, TimeZone timeZone) {
		// get existing timezone
		TimeZone defaultTimeZone = df.getTimeZone();
		if (timeZone == null)
			timeZone = defaultTimeZone;

		df.setTimeZone(timeZone);

		Calendar calendar = Calendar.getInstance(timeZone,userLocale);
		try {
			calendar.setTime(df.parse(dateString));
		} catch (ParseException e) {
		    log.debug("ParseException");
		}

		// reset to existing timezone
		df.setTimeZone(defaultTimeZone);
		return calendar;
	}    

 	
 	
    public static String getDate(String pattern){
		SimpleDateFormat sf=new SimpleDateFormat(pattern);
		return sf.format(new java.util.Date(System.currentTimeMillis()));
	}
}
