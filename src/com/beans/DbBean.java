package com.beans;

import java.util.List;
import java.util.Map;

public class DbBean extends BaseDbBean {

	public DbBean(String sqlfName) {
		super(sqlfName);
		// TODO Auto-generated constructor stub
	}

	public DbBean() {
		super();
	}

	public int insertByKey(String tablename, String keyvalue, String type,
			String typevalue) {
		String insetstr="";
		int result = -1;
		if (tablename != null && !"".equals(tablename)) {
			List tables = this.queryAllTable(1);
			String temp = tablename.substring(tablename.indexOf(".") + 1);
			try {
				boolean existed = false;
				for (int i=0; i < tables.size(); i++) {
					String tabletemp = (String) ((Map<String, Object>) tables
							.get(i)).get("TABLE_NAME");
					if (temp.equalsIgnoreCase(tabletemp)) {
						existed = true;
						break;
					}
				}
				if (!existed) {
					createTable(tablename);
				}
			} catch(Exception e) {
				e.printStackTrace();
				
			}
			insetstr = "insert into " + tablename + "(keyvalue, " + type
					+ ") values(\"" + keyvalue + "\",\"" + typevalue + "\");";
//		System.out.println(insetstr);
		result = insert(insetstr);
		}
		return result;
	}

	public int updateByKey(String tablename, String keyvalue, String type,
			String typevalue, String updateKey) {
		// update page.firstpage set keyvalue = 'hello', idvalue = 'ddd' where
		// keyvalue = 'hello';
		String insetstr = "update " + tablename + " set keyvalue='" + keyvalue
				+ "', " + type + "=\"" + typevalue + "\" where keyvalue = '"
				+ updateKey + "';";
		return update(insetstr);
	}

	public int deleteKey(String tablename, String delKey) {
		// delete from page.firstpage where KEYVALUE = 'test';
		String delStr = "delete from " + tablename + " where keyvalue = '"
				+ delKey + "'";
		return delete(delStr);
	}

	public int createTable(String tablename) {
		String sql = "create table "
				+ tablename
				+ "(id int AUTO_INCREMENT primary key not null,des VARCHAR(250) NULL ,idvalue VARCHAR(150) NULL, namevalue VARCHAR(150) , xpathvalue VARCHAR(250) ,cssvalue VARCHAR(250),pagename VARCHAR(45) default \""
				+ tablename
				+ "\", keyvalue VARCHAR(200), UNIQUE INDEX `keyvalue_UNIQUE` (`keyvalue` ASC));";
		return create(sql);
	}
}
