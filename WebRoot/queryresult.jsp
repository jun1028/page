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
<!-- 
<script language="javascript">
		function delete(keyvalue){
			alert("hello");
			if(confirm("ȷ��ɾ��")){
			 	location.href="delete.action?keyvalue=${elementdata.keyvalue }&tablename=${elementdata.tablename }";
			}else{
			 	alert("ȡ��ɾ����");
			}
		}
		-->
	</script>
	
	<head>
		<base href="<%=basePath%>">
		<title>query result  page</title>
	</head>
	<LINK href="images/CSS.CSS" type=text/css rel=stylesheet/>
	<STYLE type=text/css></STYLE>
	<body>
	<strong><font size="5" ><a href="welcome.action">������ҳ</a></font></strong>
     <hr color="#000000">
		<h1>
		<%
		String keyname =  (String)request.getParameter("keyname");
		//int total =  (int )request.getParameter("total");
		if (keyname == null || "".equals(keyname)) {
			keyname = "�ؼ���Ϊ�գ�����Ϊ����";
		}
		else
			keyname = "�ؼ���:" + keyname;
	
		 %>
			<%=keyname%>�Ĳ�ѯ���, ��${total}����¼��  
		</h1>
		<table borderColor=#ffffff height=1 width="98%" bgColor=#ffffff border="1" bordercolorlight="#006142" bordercolordark="#EFEFEF" cellspacing="0" cellpadding="0" align="left">
			<tr>
				<th align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					keyvalue </font>
				</th>
				<th align="left"  height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					idvalue</font>
				</th>
				<th align="left"   height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					cassvalue</font>
				</th>
				<th align="left"   height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					xpathvalue</font>
				</th>
				<th align="left"   height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
					tablename</font>
				</th>
				<th align="left"   height=1 bgcolor="#EFEFEF" ><font color="#000000"> 
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
						<a href="delete.action?keyvalue=${elementdata.keyvalue }&tablename=${elementdata.tablename }">ɾ��</a></font>
					</td>
				</tr>
			</c:forEach>
		</table>
</html>
