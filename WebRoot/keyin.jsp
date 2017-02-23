<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<link href="images/link.css" type="text/css" rel=stylesheet
			charset="utf-8" />
		<script language="javascript" type="text/javascript" src="script.js"></script>
		<title>页面元素更新系统</title>
	</head>
	<div align="right">
	<strong><font size="5" ><a href="welcome.action">GoooooooooooooooooooooooooooooooTO 主页</a></font></strong>	
	</div>
	<body>
		<div align="left">
			<h1>
				<font face="Tahoma"><strong>页面元素输入页面</strong> </font>
			</h1>
		</div>
		<!--  <hr width="100%" color="#000000"> <div align="center" vlign="center">-->
		<font size="1" color="#000000"> <font color="#c0c0c0">在自动化测试过程中，将通过KEYVALUE(keyword)查找相应的ID，从而定位页面中元素的位置并进行操作！</font></font>
			<form name="insertform" method="post" >
				<table cellspacing="0" cellpadding="5" align="left" width="100%">
					<!--<s:textfield label="keyvalue" name="keyvalue1" id="keyvalueid1"/> -->
					<tr> <td align="center" colspan="4">
					<hr> </td>
					<tr>
						<td align="left">
							<font face="Tahoma">keyvalue<font size="1" color="#808080">(关键词)</font>:</font>
						</td>
						<td align="left">
							<input type="text" name="keyvalue" id="keyvalueid">
						</td>
						<td align="left">
							value选择框:
						</td>
						<td align="left">
							<select id="" name="idtype" value="">
								<option>
									IDVALUE
								</option>
								<option>
									CSSVALUE
								</option>
								<option>
									XPATHVALUE
								</option>
							</select>
							=
							<input type="text" id="idvalueid" name="idvalue">
							<br>
						</td>
					</tr>
					<tr>
						<td align="left" valign="top">
							TableName
							<font size="1" color="#808080">(表名)</font>:
						</td>
						<td align="left" colspan="2">
							<!-- 
			<s:textfield name="tablenameid" id="tablename"/>
			onblur="javascript:setTimeout('HideTTip()',300);"
			javascript:if(checkSameKeyID.checked != true) alert('将强行插入数据到系统中')
			
		 	-->
							<input type="text" id="tablenameid" name="tablename"
								onblur="javascript:setTimeout('HideTTip()',300);"
								onkeyup="javascript:if(this.value!=''){ShowTip();}else{HideTTip();}"
								size="50" autocomplete="on">
							<div id="ShowTip" style="display: none"></div>
						</td>
						<td> <input type="checkbox" id="checkSameKeyID" name="checkSameKey" value="true" checked="checked" onclick="javascript:if(checkSameKeyID.checked != true) alert('不检查相同KEY，将强行插入数据到系统中,\n友情提醒：the key应是唯一的存在哦！')">是否检查数据库中存在相同的KEY or ID值</td>
					</tr>
					<tr>
						<td align="left" colspan="4">
							描述：
						</td>
					</tr>
					<tr>
						<td align="left" colspan="4">
							<textarea rows="5" cols="100%" name="des"></textarea>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="4">
							
							<input type="button" name="btninsert"
								onclick="verifyTable('insertform');" value="插入数据">
							<input type="reset" name="reset" value="清空数据">
						</td>
					</tr>
					<tr> <td align="center" colspan="4">
					<hr> </td>
					</tr>
				</table>
			
			</form>
	</body>
	
</html>