package beauate;

public class Test {
	public static void main(String[] args) {
		String temp = "/opt/tomcat/webapps/ROOT/ucontents/upload//201910/CLASS_201910060156196800";
		String result = getWasfilePath(temp); 
		System.out.println(result);
//		String result = temp.substring(temp.length()-);
	}
	
	//풀경로의 파일명을 와스의 폴더경로로 변경한다.
	public static String getWasfilePath(String filePath) {
		int cnt = filePath.indexOf("\\");
		if(cnt == -1) {
			cnt = filePath.indexOf("//");
		}
		String result = filePath.substring(cnt+1);
		return result;
	}
}
