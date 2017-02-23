<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<title>query result  page</title>
	</head>
	<LINK href="images/CSS.CSS" type=text/css rel=stylesheet/>
	<STYLE type=text/css></STYLE>
	<body>
	<div align="right">
		<strong><font size="5" >
		<a href="welcome.action">返回到主页</a>
		<a href="javascript:history.back(-1)">返回上一页</a>
		</font></strong>
	</div>
		<font size="2" color="#800040"><strong>hint: the DB has the same key or id, it should be unique! </strong></font>
	<hr color="#000000">
		<table borderColor=#ffffff height=1 width="98%" bgColor=#ffffff border="1" bordercolorlight="#006142" bordercolordark="#EFEFEF" cellspacing="0" cellpadding="0" align="left">
			<tr>
				<th align="left" width="10%" height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					keyvalue </font>
				</th>
				<th align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					idvalue</font>
				</th>
				<th align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					cassvalue</font>
				</th>
				<th align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					xpathvalue</font>
				</th>
				<th align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					tablename</font>
				</th>
				<th align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					Action</font>
				</th>
			</tr>
			<c:forEach var="elementdata" items="${elementdatalist}">
				<tr>
					<td align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
						${elementdata.keyvalue }</font>
					</td>
					<td align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
						${elementdata.idvalue }</font>
					</td>
					<td align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
						${elementdata.cssvalue }</font>
					</td>
					<td align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
						${elementdata.xpathvalue }</font>
					</td>
					<td align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
						${elementdata.tablename }</font>
					</td>
					<td align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
						<a href="update.jsp?updatekeyvalue=${elementdata.keyvalue }&tablename=${elementdata.tablename }&idtype=${elementdata.idtype }">更新</a></font>
						<a href="delete.action?keyvalue=${elementdata.keyvalue }&tablename=${elementdata.tablename }">删除</a></font> 
						<!-- <a href="delete(${elementdata.keyvalue })">delete</a></font> -->
					</td>
				</tr>
			</c:forEach>
		</table>
		
	</div></body>
	<!--  
	<script language="javascript">
		function delete(keyvalue){
			if(confirm("确认删除？")){
			 	location.href="delete.action?keyvalue=${elementdata.keyvalue }&tablename=${elementdata.tablename }";
			}else{
			 	alert("取消删除！");
			}
		}
	</script>
	-->
</html>
