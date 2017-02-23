<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>页面元素查询与更新系统</title>
	</head>
	<body>
	<div align="right">
		<!-- welcome?action=keyin -->
		<strong><font size="5" ><a href="keyin.jsp"> > KeyIn页面</a></font></strong>
	</div> 
	<br>
	<div align="center" valign="center"><h1>
		<center>
		<font face="Tahoma"><strong>页面元素查询</strong></font></h1></div>
		<hr color="#000000" align="center">
		<form action="query.action" method="post">
		<strong><font size="1" color="#c0c0c0">NOTE： Table为空将查询所有的表中的数据，关键词为空将查询所有的数据</font></strong><br><br>
		<div align="center">  
			<strong></strong>关键词(key word):  
			<input type="text" name="keyname" size="40">IN
			 <s:select id="tableid" name="tablename" list="lTableName" label="Table" listKey="TABLE_NAME" listValue="TABLE_NAME"  headerKey="all" headerValue="all tables">						
			</s:select>
			<br> <br>
			<input type="submit" name="query" value="查询"> <input type="reset" name="reset" value="清空"> </div> 
		</form>
		</center>
		<br>
		<hr color="#000000" align="center">

	</body>
</html>