<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<td width=20 align="center"><a href=main.action><h6>Ȩ</h6></a></td>
<td align="center"><h6>|</h6></td>
<td width=45 align="center"><h6>�α���</h6></td>
<td align="center"><h6>|</h6></td>
<td width=55 align="center"><h6>ȸ������</h6></td>
<td width=120 align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</table>


<!-- �ΰ�_ �˻� -->
<center>
<br>

<table align="center"width=700 cellspacing="1" cellpadding="1">
<td align="center" width=30%><img src="/Arista/template/image/logo.jpg" width="300" height="120" alt="" /></td>
<td align="center" width=70% align="left" > <br><br>
<input type="text" name=search size=40  style="height:35px; width:300px; padding:0px 0px 0px 10px;">  
<input type="submit" value="�˻�" size=40 style="height: 35px; width: 50px;">
</td>
</table>
</center>

<!-- �޴�     ����������  ��ġ  ��  �����  ������ -->
	<br>
	<header>
	<center>

	 <table border="0" width=1300 cellspacing="1" cellpadding="1">
		<td width=100 align="center"></td>
		<td width=100 align="center"><a href=mypage.action><h4><b>����������</b></h4></a></td>
		<td width=100 align="center"><a href=selectMatch.action><h4><b> ��ġ</b></h4></a></td>
		<td width=100 align="center"><h4><b>��</b></h4></td>
		<td width=100 align="center"> <h4><b>�����</b></h4></td>
		<td width=100 align="center"><h4><b>������</b></h4></td>
		<td width=100 align="center"></td>

	</table> 
</header>
</center>
 <center>
<div id="header_img" style="overflow:hidden;" align="center"><h1>����������</h1></div>
</center>
</body>
</html>