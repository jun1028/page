import com.beans.BaseDbBean;


public class TestPackageTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BaseDbBean bd = new BaseDbBean();
		bd.insert("insert into page.totalelement(keyvalue, XPATHVALUE) values(" + "\"��¼1��ťdsds\",\"//a[@class=\\\"in_login\\\"]\");");
	}
}
