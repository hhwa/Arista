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


<!-- 상단     홈|로그인|회원가입  -->
<table border=0 height=1 cellspacing="1" cellpadding="1" align="right" >
	<tr>
		<s:if test="#session.session_id != null">
			<td align="center"><h6><s:property value="#session.session_id"/>님 환영합니다! </h6></td>
			<td align="center"><h6>&nbsp;|&nbsp;</h6></td>
			<td width="20" align="center"><h6><a href=main.action>홈</a></h6></td>
			<td align="center"><h6>&nbsp;|&nbsp;</h6></td>
			<td width="60" align="center"><h6><a href="logout.action">로그아웃</a></h6></td>
		</s:if>
		<s:else>
			<td width="20" align="center"><h6><a href=main.action>홈</a></h6></td>
			<td align="center"><h6>&nbsp;|&nbsp;</h6></td>
			<td width="45" align="center"><h6><a href="loginForm.action">로그인</a></h6></td>
			<td align="center"><h6>&nbsp;|&nbsp;</h6></td>
			<td width="55" align="center"><h6><a href="joinForm.action">회원가입</a></h6></td>
		</s:else>
		<td width="120" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>


<!-- 로고_ 검색 -->
<center>
<br>
<table align="center"width=700 cellspacing="1" cellpadding="1">
	<tr>
		<td align="center" width=30%><img src="/Arista/template/image/logo.jpg" width="300" height="120" alt="" /></td>
		<td align="center" width=70% align="left" > <br><br>
		<input type="text" name=search size=40  style="height:35px; width:300px; padding:0px 0px 0px 10px;">  
		<input type="submit" value="검색" size=40 style="height: 35px; width: 50px;">
		</td>
	</tr>
</table>
</center>

<!-- 메뉴     마이페이지  매치  팀  경기장  고객센터 -->
	<br>
<header>
<center>

	 <table border="0" width=1300 cellspacing="1" cellpadding="1">
	 	<tr>
			<td width=100 align="center"></td>
			<td width=100 align="center"><h4><a href="mypage.action"><b>마이페이지</b></a></h4></td>
			<td width=100 align="center"><h4><a href="selectMatch.action"><b> 매치</b></a></h4></td>
			<td width=100 align="center"><h4><a href="TeamList.action"><b>팀</b></a></h4></td>
			<td width=100 align="center"><h4><a href="stadiumList.action"><b>경기장</b></a></h4></td>
			<td width=100 align="center"><h4><a href="FAQList.action"><b>고객센터</b></a></h4></td>
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