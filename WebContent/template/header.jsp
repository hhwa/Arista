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
#header_img{
   background-image: url('/Arista/template/image/header_img.jpg');
   background-size:100%;
   padding:50px;
}
</style>
</head>

<body>


<!-- 상단     홈|로그인|회원가입  -->
<table border=0 height=1 cellspacing="1" cellpadding="1" align="right" >
   <tr>
      <s:if test="#session.session_id != null">
         <td align="center" style="padding:0px 5px 0px 0px"><h6>Welcome  <b><s:property value="#session.session_id"/></b></h6></td>
         <td align="center"><h6>&nbsp;|&nbsp;</h6></td>
         <td align="center" style="padding:0px 5px 0px 5px"><h6><a href="main.action">Home</a></h6></td>
         <td align="center"><h6>&nbsp;|&nbsp;</h6></td>
         <td align="center" style="padding:0px 5px 0px 5px"><h6><a href="logout.action">Logout</a></h6></td>
      </s:if>
      <s:else>
         <td align="center" style="padding:0px 5px 0px 0px"><h6><a href="main.action">Home</a></h6></td>
         <td align="center"><h6>&nbsp;|&nbsp;</h6></td>
         <td align="center" style="padding:0px 5px 0px 5px"><h6><a href="loginForm.action">Login</a></h6></td>
         <td align="center"><h6>&nbsp;|&nbsp;</h6></td>
         <td align="center" style="padding:0px 5px 0px 5px"><h6><a href="joinForm.action">Sign up</a></h6></td>
      </s:else>
      <td width="120" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      
   </tr>
</table>
<br>


<!-- 로고_ 검색 -->
<center>
<br>
<table align="center">
   <tr align="center">
      <td align=center><a href="main.action"><h1><b>OFF THE BALL</b></h1></a>
      <!-- <td align="center"><a href="main.action"><img src="/Arista/template/image/logo.jpg" width="300" height="120"/></a></td> -->
   </tr>
</table>
</center>

<!-- 메뉴     마이페이지  매치  팀  경기장  고객센터 -->
	<br>
<center>

	 <table border="0" width="1000" cellspacing="1" cellpadding="1">
	 	<tr>
			<td width=100 align="center"></td>
			<s:if test="#session.session_adminYN==1">
				<td width=100 align="center"><h4><a href="adminMemList.action"><b>ADMIN PAGE</b></a></h4></td>
			</s:if>
			<s:else>
				<td width=100 align="center"><h4><a href="mypage.action"><b>MY PAGE</b></a></h4></td>
			</s:else>
			<td width=100 align="center"><h4><a href="selectMatch.action"><b>MATCH</b></a></h4></td>
			<td width=100 align="center"><h4><a href="MyTeam.action"><b>TEAM</b></a></h4></td>
			<td width=100 align="center"><h4><a href="StadiumList.action"><b>STADIUM</b></a></h4></td>
			<td width=100 align="center"><h4><a href="FAQList.action"><b>ABOUT</b></a></h4></td>
			<td width=100 align="center"></td>
		</tr>
	</table> 
</center>
<br>
 <center>
<div id="header_img" style="overflow:hidden;" align="center"><h1><s:property value="PageName"/></h1></div>
</center>
</body>
</html>