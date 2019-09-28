package beauate;

public class Test {
	public static void main(String[] args) {
		String temp = "D:/project/beauate/eGovFrameDev-3.8.0-64bit/workspace/beauate/src/main/webapp/ucontents/upload/\\201909/filename";
		int cnt = temp.indexOf("\\");
		String result = temp.substring(cnt+1);
		System.out.println(result);
//		String result = temp.substring(temp.length()-);
	}
}
