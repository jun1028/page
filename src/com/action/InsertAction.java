package com.action;

import java.util.List;

import com.beans.ElementData;
import com.beans.DbBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InsertAction extends ActionSupport {
	
	private static final long serialVersionUID = 4789873032057503041L;
	private static final String dbName = "page";
	private ElementData elData = new ElementData();
	private String keyvalue;
	private String idtype;
	private String idvalue;
	private String tablename;
	private String des;
	private DbBean updateBean = new DbBean();
	public String actionStr = "INSERT";
	public String errMessage = "";
	public String checkSameKey = "";

	@Override
	public String execute() throws Exception {
		//		keyvalue = new String(keyvalue.getBytes("ISO-8859-1"), "UTF-8");
		//idvalue = new String(idvalue.getBytes("ISO-8859-1"), "GBK");
		//des = new String(des.getBytes("ISO-8859-1"), "GBK");
		elData.setKeyvalue(keyvalue);
		List keyList = updateBean.queryByKey(keyvalue, idtype, idvalue);
		if ( !"".equals(checkSameKey) && keyList.size() > 0) {
			ActionContext.getContext()
					.put("elementdatalist", keyList);
			return "query";
		}
		else {
			int result = 0;
			try {
				result = updateBean.insertByKey(tablename, keyvalue, idtype, idvalue);
			} catch(Exception e) {
				errMessage = "tablename or idvalue is null" + e.getMessage();
			}
			if (result == -1) {
				if("".equals(errMessage)) {
					errMessage = errMessage + ", can't insert the key!";
				} else{
					errMessage = "can't insert the key!";
				}
				ActionContext.getContext().put("errMessage", errMessage);
				return "error";
			}
			else
				return "success";
		}
		
	}

	public ElementData getElData() {
		return elData;
	}

	public void setElData(ElementData elData) {
		this.elData = elData;
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

	public String isHasSameKeyID() {
		return checkSameKey;
	}

	public void setHasSameKeyID(String checkSameKey) {
		this.checkSameKey = checkSameKey;
	}
	
	public static String getEncoding(String str) {        
	       String encode = "GB2312";        
	      try {        
	          if (str.equals(new String(str.getBytes(encode), encode))) {        
	               String s = encode;        
	              return s;        
	           }        
	       } catch (Exception exception) {        
	       }        
	       encode = "ISO-8859-1";        
	      try {        
	          if (str.equals(new String(str.getBytes(encode), encode))) {        
	               String s1 = encode;        
	              return s1;        
	           }        
	       } catch (Exception exception1) {        
	       }        
	       encode = "UTF-8";        
	      try {        
	          if (str.equals(new String(str.getBytes(encode), encode))) {        
	               String s2 = encode;        
	              return s2;        
	           }        
	       } catch (Exception exception2) {        
	       }        
	       encode = "GBK";        
	      try {        
	          if (str.equals(new String(str.getBytes(encode), encode))) {        
	               String s3 = encode;        
	              return s3;        
	           }        
	       } catch (Exception exception3) {        
	       }        
	      return "";        
	   }    
}
