<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
.font_15 {
   font-size: 15px;
}
</style>
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>

<script type="text/javascript">
	
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
<div style="margin-left:auto; margin-right:auto; margin-top:auto; margin-bottom:auto;">
<br><br><br><br><br><br>
	<s:form name="myform" action="loginPro.action" method="post" onsubmit="return checkIt()">
	
	<table width="200" align="center">

	<tr height="21">
		<td align="center" colspan="0" id="bu"><input id="bu_in" type="text" name="m_id" size="24" maxlength="12" placeholder="ID" autocomplete="off"></td>
	</tr>
	<tr height="15"><td></td></tr>
	<tr height="21">
		<td align="center" colspan="0" id="bu"><input id="bu_in" type="password" name="m_passwd" size="24" maxlength="12" placeholder="PW"></td>
	</tr>
	<tr height="13"><td></td></tr>
	</table>
	<table align="center" id="bu_find">
		<tr>
			<td style="padding:0px 0px 0px 200px; ">
				<input type="button" value="아이디 찾기" onclick="javascript:window.location.href='findIDForm.action'">
			</td>
			<td>|</td>				
			<td>
				<input type="button" value="비밀번호 찾기" onclick="javascript:window.location.href='findPWForm.action'">
			</td>
		</tr>
		<tr height="13"><td></td></tr>
	</table>
	
	<table align="center" width="210">
      <tr height="23">
         <td align="center" id="bu_1"><b><input type="submit" value="LOGIN"></b></td>
      </tr>
      <tr height="2"><td></td></tr>
      <tr>
         <td align="center" class="font_12">Not a member? <b><input class="font_12" type="button" value="Sign up now" onclick="javascript:window.location.href='agreementForm.action'"></b></td>
      </tr>
   </table>
</s:form>
</div>


</body>
</html>