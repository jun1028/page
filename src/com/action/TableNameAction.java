package com.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.beans.BaseDbBean;
import com.opensymphony.xwork2.ActionSupport;

public class TableNameAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6997106053590209770L;

	private String keyword = "";
	private String tableName = "";

	@Override
	public String execute() throws Exception {
		BaseDbBean base = new BaseDbBean();
		List tableResult = base.queryAllTable(1);
		StringBuffer sb = new StringBuffer("");
		if (keyword == null) {
			System.out.print("null");
		} else {
			for (int i = 0; i < tableResult.size(); i++) {
				String temp = (String) ((Map<String, Object>) tableResult
						.get(i)).get("TABLE_NAME");
				//System.out.println("keyword: " + keyword);
				if ("".equals(keyword) || temp.contains(keyword)) {
					sb.append(temp + "|");
				}
			}
		}
		HttpServletResponse response;
		response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pargma", "no-cache");
		response.setDateHeader("Expires", 0);
		PrintWriter out = response.getWriter();
		out.write(sb.toString());
		out.close();
		return null;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

}
