package com.action;

import java.util.List;

import com.beans.BaseDbBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class KeywordQueryAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 139513022468840347L;
	private String errMessage = "";
	private int total;
	private String keyname;
	private String tablename;
	
	private BaseDbBean kQuery = new BaseDbBean();

	@Override
	public String execute() throws Exception {
		if ("all".equalsIgnoreCase(tablename))  tablename = "";
		List result = kQuery.queryByKey(keyname, tablename);
		if (result != null && result.size() > 0) {
			total = result.size();
			ActionContext.getContext().put("total", total);
			ActionContext.getContext().put("elementdatalist", result);
			return "success";
		} else
			return "nodata";

	}

	public String getKeyname() {
		return keyname;
	}

	public void setKeyname(String keyname) {
		this.keyname = keyname;
	}

	public int getToatal() {
		return total;
	}

	public void setToatal(int total) {
		this.total = total;
	}

	public String getErrMessage() {
		return errMessage;
	}

	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}
	
	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}


}
