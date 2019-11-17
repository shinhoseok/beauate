package beauate;

public class Test {
	public static void main(String[] args) {
//		String temp = "FILE_000000000000170,FILE_000000000000170";
		String temp = "FILE_000000000000170";
		if(temp.indexOf(",") > -1) {
			String res = temp.substring(0, temp.indexOf(","));
			System.out.println(res);
		}
		System.out.println(temp);
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
