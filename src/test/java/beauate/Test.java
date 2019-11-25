package beauate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.beauate.common.DateUtil;

public class Test {
	public static void main(String[] args) throws ParseException {
//		final String DATE_PATTERN = "yyyy-MM-dd";
		final String DATE_PATTERN = "yyyy-MM-dd";
        String inputStartDate = "2016-02-28";
        String inputEndDate = "2017-03-05";
        SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
        Date startDate = sdf.parse(inputStartDate);
        Date endDate = sdf.parse(inputEndDate);
        ArrayList<Map<String, String>> dates = new ArrayList<>();
        
        Date currentDate = startDate;
        while (currentDate.compareTo(endDate) <= 0) {
        	Map<String, String> rsltMap = new HashMap<String, String>();
        	rsltMap.put("date", sdf.format(currentDate));
            dates.add(rsltMap);
            Calendar c = Calendar.getInstance();
            c.setTime(currentDate);
            c.add(Calendar.DAY_OF_MONTH, 1);
            currentDate = c.getTime();
        }
        for (Map<String, String> date : dates) {
            System.out.println(date.get("date"));
        }
		//오늘
		Date today = new Date();        
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String toDay = date.format(today);

		 

		//하루 전
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE , -1);
		String beforeDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day.getTime());

		 

		//한주 전
		Calendar week = Calendar.getInstance();
		week.add(Calendar.DATE , -7);
		String beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());

		 

		//한달 전
		Calendar mon = Calendar.getInstance();
		mon.add(Calendar.MONTH , -1);
		String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());


		System.out.println("오늘 : "+toDay+"<br>"); 
		System.out.println("하루 전 : "+beforeDate+"<br>");
		System.out.println("한주 전 : "+beforeWeek+"<br>");
		System.out.println("한달 전 : "+beforeMonth+"<br>");
		
	}
	
	//풀경로의 파일명을 와스의 폴더경로로 변경한다.
	public static String getWasfilePath() {
		double e = 2.71828;
		System.out.println(Math.round(e*10)/10.0);
		String temp = "/opt/tomcat/webapps/ROOT/ucontents/upload//201910/CLASS_201910060156196800";
		int cnt = temp.indexOf("\\");
		if(cnt == -1) {
			cnt = temp.indexOf("//");
		}
		String result = temp.substring(cnt+1);
		
		System.out.println(result);
		System.out.println(0*1);
//		String result = temp.substring(temp.length()-);
	
		return result;
	}
}
