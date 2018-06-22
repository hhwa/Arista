<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.bottom {
	display:black;
	border: none;
	border-bottom: 2px solid #000000;
	width: 180px;
	border-color: #000000;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr height="100"><td></td></tr></table>
	<center>
		<h1>
			<b>내 정보</b>
		</h1>
		<table><tr height="10"><td></td></tr></table>
		<h5>
			<b><s:property value="#session.session_id"/></b> 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.
		</h5><br>
		
		<table><tr height="50"><td></td></tr></table>
		
		<form action="myInfoView.action" method="post">
		<table width="150" align="center">
			<tr height="21">
				<td class="bottom" id="bu_in"> <b><s:property value="#session.session_id"/></b></td>
			</tr>
			<tr height="15"><td></td></tr>
			<tr>
				<td class="bottom"> <input id="bu_in" type="password" name="m_passwd" size="24" maxlength="12" placeholder="PW"/></td>
			</tr>
			<tr height="20"><td></td></tr>
			<tr height="23">
				<td id="bu_1" align="center"><b><input type="submit" value="확   인"/></b></td>
			</tr>
			<tr height="100"></tr>
		</table>
		</form>
	</center>

</body>
</html>