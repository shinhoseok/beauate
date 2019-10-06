package beauate;

public class Test {
	public static void main(String[] args) {
		String temp = "/opt/tomcat/webapps/ROOT/ucontents/upload//201910/CLASS_201910060156196800";
		int cnt = temp.indexOf("\\");
		System.out.println("sin>> "+cnt);
		if(cnt == -1) {
			cnt = temp.indexOf("//");
		}
		String result = temp.substring(cnt+1);
		System.out.println(result);
//		String result = temp.substring(temp.length()-);
	}
}
