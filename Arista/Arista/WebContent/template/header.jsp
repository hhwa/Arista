<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Header</title>


<style>

	header{
		background-color:#2d2d30;
 		color: #f5f5f5;
 		padding:6px;
 	
	}

	
	#header_img{
	background-image: url('/Arista/template/image/hoho.jpg');
	background-size:100%;
	padding:28px;
	}
</style>


</head>

<body>


<!-- ���     Ȩ|�α���|ȸ������  -->
<table border=0 height=1 cellspacing="1" cellpadding="1" align="right" >
	<tr>
		<s:if test="#session.session_id != null">
			<td align="center"><h6><s:property value="#session.session_id"/>�� ȯ���մϴ�! </h6></td>
			<td align="center"><h6>&nbsp;|&nbsp;</h6></td>
			<td width="20" align="center"><h6><a href=main.action>Ȩ</a></h6></td>
			<td align="center"><h6>&nbsp;|&nbsp;</h6></td>
			<td width="60" align="center"><h6><a href="logout.action">�α׾ƿ�</a></h6></td>
		</s:if>
		<s:else>
			<td width="20" align="center"><h6><a href=main.action>Ȩ</a></h6></td>
			<td align="center"><h6>&nbsp;|&nbsp;</h6></td>
			<td width="45" align="center"><h6><a href="loginForm.action">�α���</a></h6></td>
			<td align="center"><h6>&nbsp;|&nbsp;</h6></td>
			<td width="55" align="center"><h6><a href="joinForm.action">ȸ������</a></h6></td>
		</s:else>
		<td width="120" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>


<!-- �ΰ�_ �˻� -->
<center>
<br>
<table align="center"width=700 cellspacing="1" cellpadding="1">
	<tr>
		<td align="center" width=30%><img src="/Arista/template/image/logo.jpg" width="300" height="120" alt="" /></td>
		<td align="center" width=70% align="left" > <br><br>
		<input type="text" name=search size=40  style="height:35px; width:300px; padding:0px 0px 0px 10px;">  
		<input type="submit" value="�˻�" size=40 style="height: 35px; width: 50px;">
		</td>
	</tr>
</table>
</center>

<!-- �޴�     ����������  ��ġ  ��  �����  ������ -->
	<br>
<header>
<center>

	 <table border="0" width=1300 cellspacing="1" cellpadding="1">
	 	<tr>
			<td width=100 align="center"></td>
			<td width=100 align="center"><h4><a href="mypage.action"><b>����������</b></a></h4></td>
			<td width=100 align="center"><h4><a href="selectMatch.action"><b> ��ġ</b></a></h4></td>
			<td width=100 align="center"><h4><a href="TeamList.action"><b>��</b></a></h4></td>
			<td width=100 align="center"><h4><a href="stadiumList.action"><b>�����</b></a></h4></td>
			<td width=100 align="center"><h4><a href="FAQList.action"><b>������</b></a></h4></td>
			<td width=100 align="center"></td>
		</tr>
	</table> 
</header>
</center>
 <center>
<div id="header_img" style="overflow:hidden;" align="center"><h1><s:property value="PageName"/></h1></div>
</center>
</body>
</html>