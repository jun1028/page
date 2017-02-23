package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.beans.BaseDbBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Welcome extends ActionSupport {
	
	private String action = "";
	
	@Override
	public String execute() throws Exception {
		BaseDbBean base = new BaseDbBean();
		List tableResult = base.queryAllTable(1);
		ActionContext.getContext().put("lTableName", tableResult);
		if ("".equals(action)) return SUCCESS;
		else {
			return "keyin";
		}
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
}
