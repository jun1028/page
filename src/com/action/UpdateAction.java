package com.action;

import java.util.List;

import com.beans.ElementData;
import com.beans.DbBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateAction extends ActionSupport {

	private static final long serialVersionUID = 4789873032057503041L;
	private static final String dbName = "page";
	private String updatakeyvalue;
	private String keyvalue;
	private String idtype;
	private String idvalue;
	private String tablename;
	private String des;
	private DbBean updateBean = new DbBean();
	public String actionStr = "update";
	public String errMessage = "";

	@Override
	public String execute() throws Exception {
		// keyvalue = new String(keyvalue.getBytes("ISO-8859-1"), "GBK");
		// idvalue = new String(idvalue.getBytes("ISO-8859-1"), "GBK");
		// des = new String(des.getBytes("ISO-8859-1"), "GBK");
		int result = 0;
		try {
			result = updateBean.updateByKey(tablename, keyvalue, idtype,
					idvalue, updatakeyvalue);
		} catch (Exception e) {
			errMessage = "DB ERROR! " + e.getMessage();
		}
		if (result == -1) {
			if("".equals(errMessage)) {
				errMessage = errMessage + ", can't update the key!";
			} else{
				errMessage = "can't update the key!";
			}
			ActionContext.getContext().put("errMessage", errMessage);
			return "error";
		} else
			return "success";

	}

	public String getKeyvalue() {
		return keyvalue;
	}

	public void setKeyvalue(String keyvalue) {
		this.keyvalue = keyvalue;
	}

	public String getIdtype() {
		return idtype;
	}

	public void setIdtype(String idtype) {
		this.idtype = idtype;
	}

	public String getIdvalue() {
		return idvalue;
	}

	public void setIdvalue(String idvalue) {
		this.idvalue = idvalue;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		if (tablename != null && !"".equals(tablename)) {
			if (!tablename.contains(".")) {
				tablename= dbName + "." + tablename;
			}
		}
		this.tablename = tablename;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getErrMessage() {
		return errMessage;
	}

	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}

	public String getUpdatakeyvalue() {
		return updatakeyvalue;
	}

	public void setUpdatakeyvalue(String updatakeyvalue) {
		this.updatakeyvalue = updatakeyvalue;
	}

}
