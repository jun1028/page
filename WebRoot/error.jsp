<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<title>error page</title> 
	</head>
	<a href="javascript:history.back(-1)">返回上一页</a>
	<body>
		<h1 style="font-weight: normal;"><strong>
		<font size="7" color="#ff0000">error! ${errMessage}</font></strong>
		</h1>
	</body>
</html>