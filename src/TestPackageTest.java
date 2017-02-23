import com.beans.BaseDbBean;


public class TestPackageTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BaseDbBean bd = new BaseDbBean();
		bd.insert("insert into page.totalelement(keyvalue, XPATHVALUE) values(" + "\"µÇÂ¼1°´Å¥dsds\",\"//a[@class=\\\"in_login\\\"]\");");
	}
}
