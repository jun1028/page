<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String updatakeyvalue = request.getParameter("updatekeyvalue"); 
	updatakeyvalue = new String(updatakeyvalue.getBytes("iso-8859-1"),"gb2312"); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

</script>
	<head>
		<base href="<%=basePath%>">
		<script language="javascript" type="text/javascript" src="script.js"></script>
		<title>页面元素更新系统</title>
	</head>
	<strong><font size="5" ><a href="welcome">返回主页</a> <a href="keyin.jsp">返回KeyIn页面</a></font></strong>
	<body><div align="center"><h1>
	
	<font face="Tahoma"><strong>页面元素更新系统</strong></font></h1></div>
	<hr color="#000000">
		<form  name="updateform" method="post"><div align="left">   
			<strong>更新页面数据到数据库</strong><br><br>keyvalue:&nbsp;   
			
			<input type="text" name="keyvalue" id="keyvalueid">
			 ID类型：<font size="1" color="#808080">(CSSVALUE,XPATHVALUE,IDVALUE,NAMEVALUE)</font>
			 <input type="text" id="idtypeid" name="idtype" value=<%=request.getParameter("idtype") %>>
			 VALUE：
			 <input type="text" id="idvalueid" name="idvalue" %><br><br>TableName: 
<input type="text" id="tablenameid" name="tablename" value=<%=request.getParameter("tablename") %>>&nbsp; UpdataKeyValue: 
<input type="text" id="UpdataKeyValueid" name="updatakeyvalue" value=<%=updatakeyvalue%>>
		 
		</div>
		<br>
		描述： 
		  <br>
        <textarea rows="6" cols="100%" name="des"></textarea>
        <br> <br>
        <input type="button" name="btninsert" onclick="verifyTable('updateform')" value="更新数据">  
			<input type="reset" name="reset" value="清空数据"> 
			</form>
		<hr color="#000000">
	</body>
</html>