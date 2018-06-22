<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="/Arista/css/style.css?ver=1" type="text/css">
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


<!-- ���     Ȩ|�α���|ȸ������  -->
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
         <td align="center" style="padding:0px 5px 0px 5px"><h6><a href="agreementForm.action">Sign up</a></h6></td>
      </s:else>
      <td width="120" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      
   </tr>
</table>
<br>


<!-- �ΰ�_ �˻� -->
<center>
<br>
<table align="center">
   <tr align="center">
      <td align=center><h1><a href="main.action"><b>OFF THE BALL</b></a></h1>
      <!-- <td align="center"><a href="main.action"><img src="/Arista/template/image/logo.jpg" width="300" height="120"/></a></td> -->
   </tr>
</table>
</center>

<!-- �޴�     ����������  ��ġ  ��  �����  ������ -->
	<br>
<%-- <center>

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
</center> --%>
<div class="menubar" style="margin-left:20%; margin-right: 20%;">
   <ul>
      <s:if test="#session.session_adminYN==1">
      <li><h4><a href="adminMemList.action"><b>ADMIN PAGE</b></a></h4>
         <ul>
            <li><a href="adminMemList.action"><b>ȸ������</b></a></li>
            <li><a href="CreateSoloMatchForm.action"><b>���θ�ġ����</b></a></li>
         </ul>
      </li>
    </s:if>
    <s:else>
      <li style="width:100; align-content: center;"><h4><a href="mypage.action"><b>MY PAGE</b></a></h4>
         <ul>
            <li><a href="mypage.action"><b>�� ����</b></a></li>
               <li><a href="MyTeam.action"><b>���� ��</b></a></li>
               <li><a href="teamMatchInfo.action"><b>�� �� ��ġ��</b></a></li>
               <li><a href="myMatchInfo.action"><b>���� ��û�� ��ġ��</b></a></li>
         </ul>
      </li>
   </s:else>
   
   <li style="width:100; align-content: center;"><h4><a href="selectMatch.action"><b>MATCH</b></a></h4>
      <ul>
         <li><a href="SoloMatchList.action"><b>�ַ� ��ġ</b></a></li>
            <li><a href="TeamMatchList.action"><b>�� ��ġ</b></a></li>
      </ul>
   </li>
   <li style="width:100; align-content: center;"><h4><a href="MyTeam.action"><b>TEAM</b></a></h4>
      <ul>
         <li><a href="TeamList.action"><b>�� ���</b></a></li>
      </ul>
   </li>
   
   <li style="width:100; align-content: center;"><h4><a href="StadiumList.action"><b>STADIUM</b></a></h4>
      <ul>
         <li><a href="StadiumList.action"><b>����� ���</b></a></li>
      </ul>
   </li>
   <li style="width:100; align-content: center;"><h4><a href="FAQList.action"><b>ABOUT</b></a></h4>
      <ul>
         <li><a href="noticeList.action"><b>��������</b></a></li>
            <li><a href="QNAList.action"><b>Q&A</b></a></li>
            <li><a href="FAQList.action"><b>FAQ</b></a></li>
      </ul>
   </li>
 
   </ul>
</div>
<br>
 <center>
<div id="header_img" style="overflow:hidden;" align="center"><h1><s:property value="PageName"/></h1></div>
</center>
</body>
</html>