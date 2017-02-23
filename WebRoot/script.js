function verifyTable(formname) {
	var tablename = document.getElementById("tablenameid").value;
	var keyvalue = document.getElementById("keyvalueid").value;
	var idvalue = document.getElementById("idvalueid").value;
	if (keyvalue == null || "" == keyvalue) {
		alert("keyvalue 文本框不能为空！");
		document.getElementById("keyvalueid").focus();
	} else if (tablename == null || "" == tablename) {
		alert("tablename 文本框不能为空");
		document.getElementById("tablenameid").focus();
	} else if (idvalue == null || "" == idvalue) {
		alert("idvalue 文本框不能为空");
		document.getElementById("idvalue").focus();
	} else {
		if (formname != null) {
			if (formname == "insertform") {
				document.insertform.action = "insert.action";
				return document.insertform.submit();
			}
			if (formname == "updateform") {
				document.updateform.action = "update.action";
				return document.updateform.submit();
			}
		}
		// return document.updateform.submit() ;
	}
}
// ////////////////////////////////显示隐藏Tip层////////////////////////////////////
function ShowTip() {
	var _key;
	document.onkeyup = function(e) {
		if (e == null)// ///////IE
		{
			_key = event.keyCode;
		} else// FireFox
		{
			_key = e.which;
		}
		e = e || window.event; // 事件
		var target = e.target || e.srcElement; // 获得事件源
		var dragObj = target.getAttribute('id');
		if(dragObj != null && dragObj == ("tablenameid")) {
			if ((_key != 39 && _key != 40 && _key != 37 && _key != 38 && _key != 13 && _key != 17)) {
				document.getElementById("ShowTip").style.display = "";
				document.getElementById("ShowTip").innerHTML = "<img src='images/ajax-loader.gif'>&nbsp;正在获取提示...";
				VCreateAjax("tablename.action", BackArray, "keyword="
						+ escape(document.getElementById("tablenameid").value));
			}
		}	
	}
}

function HideTip() {
	var _key;
	document.onkeyup = function(e) {
		if (e == null)// ///////IE
		{
			_key = event.keyCode;
		} else// FireFox
		{
			_key = e.which;
		}
		if ((_key != 39 && _key != 40 && _key != 37 && _key != 38 && _key != 13 && _key != 17)) {
			document.getElementById("ShowTip").style.display = "none";
		}
	}
}

function HideTTip() {
	document.getElementById("ShowTip").style.display = "none";
}
// ////////////////////////////////显示隐藏Tip层////////////////////////////////////

// ////////////////////////////////Ajax初始化函数
// IE7.0////////////////////////////////////
function VCreateAjax(VUrl, VBack, VVar) {
	http_request_name = false;
	if (window.XMLHttpRequest) { // Mozilla, Safari,...
		http_request_name = new XMLHttpRequest();
	}
	if (window.ActiveXObject) { // IE
		try {
			http_request_name = new ActiveXObject("Msxml3.XMLHTTP");
		} catch (e) {
			try {
				http_request_name = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request_name = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
		if (http_request_name.overrideMimeType) {
			http_request_name.overrideMimeType('text/html');
		}

	}

	if (!http_request_name) {
		document.getElementById("ShowTip").innerHTML = "<img src='images/Icon_warning_01.gif' border='0'>&nbsp;不能创建XMLHTTP对象,请升级您的浏览器或操作系统！";
		// alert('错误 :( 不能创建XMLHTTP对象,请升级您的浏览器或操作系统！');
		return false;
	}
	http_request_name.onreadystatechange = VBack;
	http_request_name.open('POST', VUrl, true); // 这里用GET方法传递参数，不然会出现完成该操作所需的数据还不可使用的页面错误
	http_request_name.setRequestHeader('Content-type',
			'application/x-www-form-urlencoded');
	http_request_name.send(VVar);
}
// ////////////////////////////////Ajax初始化函数
// IE7.0////////////////////////////////////

// ////////////////////////////////回调函数，写得不太好，感觉比较罗嗦////////////////////////////////////
function BackArray() {
	if (http_request_name.readyState == 4) {
		if (http_request_name.status == 200) {
			var VVStr = "";
			VVStr = http_request_name.responseText;
			if (VVStr != "") {
				document.getElementById("ShowTip").innerHTML = "";
				var IdarrA = VVStr.split('|');
				var DIVStr = "";
				var FormatStr = "";
				var sum = IdarrA.length - 1;
				for (P = 0; P < IdarrA.length - 1; P++) {
					FormatStr = IdarrA[P]
							.replace(
									document.getElementById("tablenameid").value,
									"<b><font color='red'>"
											+ document
													.getElementById("tablenameid").value
											+ "</font></b>")
					DIVStr += "<div id='"
							+ P
							+ "' hideFocus style='cursor:pointer;line-height:20px;' onmousemove='FocusOP("
							+ P + "," + sum + ");' onmouseout='UFocusOP(" + P
							+ ");' onclick='ClickInner(\"" + IdarrA[P]
							+ "\");'>" + FormatStr + "</div>";
				}
				document.getElementById("ShowTip").innerHTML = DIVStr;
				FocusOP('0');
				var i = 0;
				maxid = IdarrA.length - 1;
				document.onkeydown = function(e) {
					var _key;
					if (e == null)// ///////IE
					{
						_key = event.keyCode;
					} else// FireFox
					{
						_key = e.which;
					}
					if ((_key == 39 || _key == 40))// ///////////向下
					{
						if (i > maxid - 1) {
							i = 0;
						} else {
							i = i + 1;
						}
						if (i > maxid - 1) {
							UFocusOP(maxid - 1);
							FocusOP('0', maxid);
							i = 0;
						} else {
							UFocusOP(i - 1);
							FocusOP(i, maxid);
						}
					} else if (_key == 37 || _key == 38)// ///////////向上
					{
						if (i < 0) {
							i = 0;
						} else {
							i = i - 1;
						}
						if (i < 0) {
							UFocusOP(i + 1);
							FocusOP(maxid - 1, maxid);
							i = maxid - 1;
						} else {
							UFocusOP(i + 1);
							FocusOP(i, maxid);
						}
					}
					if (_key == 13
							&& document.getElementById("ShowTip").style.display != "none") {
						if (window.XMLHttpRequest) {
							document.getElementById("tablenameid").value = document
									.getElementById(i).textContent;
						} else {
							document.getElementById("tablenameid").value = document
									.getElementById(i).innerText;
						}
						document.getElementById("ShowTip").style.display = "none";
					}
				}
			} else {
				document.getElementById("ShowTip").style.display = "none";
			}
		} else {
			document.getElementById("ShowTip").innerHTML = "<img src='images/Icon_warning_01.gif'>&nbsp;数据返回错误！！";
		}
	}
}
// ////////////////////////////////回调函数，写得不太好，感觉比较罗嗦////////////////////////////////////

// ////////////////////////////////焦点获取和返值////////////////////////////////////
function FocusOP(OPP, VNum) {
	for (M = 0; M < VNum; M++) {
		document.getElementById(M).focus = false;
		document.getElementById(M).style.background = "#FFFFFF";
	}
	document.getElementById(OPP).focus = true;
	document.getElementById(OPP).style.background = "#FFFFCC";
}
function UFocusOP(OPP) {
	document.getElementById(OPP).focus = false;
	document.getElementById(OPP).style.background = "#FFFFFF";
}
function ClickInner(OPP) {
	document.getElementById("tablenameid").value = OPP;
	document.getElementById("ShowTip").style.display = "none";
}
// ////////////////////////////////焦点获取和返值////////////////////////////////////
