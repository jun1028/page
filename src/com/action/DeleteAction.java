package com.action;

import java.util.List;

import com.beans.ElementData;
import com.beans.DbBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3280206750597592525L;
	private String keyvalue;
	private String tablename;
	
	public String actionStr = "delete";
	public String errMessage = "";

	private DbBean updateBean = new DbBean();

	@Override
	public String execute() throws Exception {
		keyvalue = new String(keyvalue.getBytes("ISO-8859-1"), "GBK");
		int result = updateBean.deleteKey(tablename, keyvalue);
		if (result > 0) {
			return "success";
		}
		else { 
			errMessage = "can't delete the key!";
			ActionContext.getContext().put("errMessage", errMessage);
			return "error";
		}
	}


	public String getKeyvalue() {
		return keyvalue;
	}

	public void setKeyvalue(String keyvalue) {
		this.keyvalue = keyvalue;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {

		this.tablename = tablename;
	}
	public String getErrMessage() {
		return errMessage;
	}


	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}

}
