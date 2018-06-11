<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	
	function begin() {
		document.myform.m_id.focus();
	}
	function checkIt() {
		if(!document.myform.m_id.value){
			alert("아이디를 입력하지 않으셨습니다.");
			document.myform.m_id.focus();
			return false;
		}
		if(!document.myform.m_passwd.value){
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.myform.m_passwd.focus();
			return false;
		}
	}
</script>
</head>
<body onload="begin()">
<%-- <%
	CookieBox cookieBox = new CookieBox(request);
%>
 --%>
<s:form name="myform" action="loginPro" method="post" onsubmit="return checkIt()">
<table cellspacing=1 cellpadding=1 width="400" border=1 align="center">
	<tr height="30">
		<td colspan="2" align="center">
		<strong>회원로그인</strong>
		</td>
	</tr>
	
	<%-- <% if(cookieBox.exists("ID")) %> --%>
	
	<tr height="30">
		<td width="110" align=center>아이디</td>
		<td width="150" align=center>
			<input type="text" name="m_id" size="15" maxlength="12" <%-- value="<%=cookieBox.getValue("ID") %>" --%>></td>
		<td width= "90"  align=center>
			<input type="button" value="아이디 찾기" onclick="javascript:window.location.href='findIDForm.action'"></td>
			
		</tr>
	<tr height="30">
		<td width="110" align="center">비밀번호</td>
		<td width="150" align="center">
			<input type="password" name="m_passwd" size="15" maxlength="12"></td>
		<td width= "90" align=center>
		<input type="button" value="비밀번호 찾기" onclick="javascript:window.location.href='findPWForm.action'"></td>	
	</tr>
	<tr height="30">
		<td colspan="2" align="center" >
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="javascript:window.location.href='joinForm.action'"></td>
	</tr>		
</table>
</s:form>
</body>
</html>