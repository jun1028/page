<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
13
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
		<title>My JSP 'booklist.jsp' starting page</title>
	</head>
	<!-- 
		<script type ="text/javascript" language ="javascript" >
        var req; //定义变量，用来创建xmlhttprequest对象
        function creatReq() // 创建xmlhttprequest,ajax开始
        {
            var url="welcome.action"; //要请求的服务端地址
            if(window.XMLHttpRequest) //非IE浏览器及IE7(7.0及以上版本)，用xmlhttprequest对象创建
            {
                req=new XMLHttpRequest();
            }
            else if(window.ActiveXObject) //IE(6.0及以下版本)浏览器用activexobject对象创建,如果用户浏览器禁用了ActiveX,可能会失败.
            {
                req=new ActiveXObject("Microsoft.XMLHttp");
            }
            
            if(req) //成功创建xmlhttprequest
            {
                req.open("GET",url,true); //与服务端建立连接(请求方式post或get，地址,true表示异步)
                req.onreadystatechange = callback; //指定回调函数
                req.send(null); //发送请求
            }
        }
        
        function callback() //回调函数，对服务端的响应处理，监视response状态
        {
            if(req.readystate==4) //请求状态为4表示成功
            {
                if(req.status==200) //http状态200表示OK
                {
                    Dispaly(); //所有状态成功，执行此函数，显示数据
                }
                else //http返回状态失败
                {
                    alert("服务端返回状态" + req.statusText);
                }
            }
            else //请求状态还没有成功，页面等待
            {
                document .getElementById ("myTime").innerHTML ="数据加载中";
            }
        }
        
        function Dispaly() //接受服务端返回的数据，对其进行显示
        {
            document.getElementById ("myTime").innerHTML =req.responseText;
        }
        
    </script>
	-->
	<body>
		<h1>
			查询结果
		</h1>
		<table border=1>
			<tr>
				<th>
					编号
				</th>
				<th>
					名称
				</th>
				<th>
					类型
				</th>
				<th>
					单价
				</th>
			</tr>
			<c:forEach var="book" items="${booklist}">
				<tr>
					<td>
						${book.titleid }
					</td>
					<td>
						${book.title }
					</td>
					<td>
						${book.type }
					</td>
					<td>
						${book.price }
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>
