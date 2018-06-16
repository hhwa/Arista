<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>닉네임 중복체크</title>
<script type="text/javascript" charset="EUC-KR">

function setnick()
 {
	opener.document.userinput.m_nickname.value="<s:property value='m_nickname'/>";
	opener.document.userinput.nickchecked.value=1;
 	self.close();
 } 


</script>
</head>
<body>


<s:if test="nickcheckresult == 0">
<table width="270" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td height="39"><s:property value="%{memberResult.m_nickname}"/>는 이미 사용중인 닉네임입니다.</td>
	</tr>	
</table>
<s:form name="checkForm" method="post" action="memberNickCheck.action">
<table width="200" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		다른 닉네임을 입력하세요.<p>
		<input type="text" size="20" name="m_nickname">
		<input type="submit" value="닉네임 중복확인">
		</td>
	</tr>	
</table>
</s:form>
</s:if>
<s:elseif test="nickcheckresult == 1">

<table width="270" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>입력하신 [<s:property value="m_nickname"/>]는 사용하실 수 있는 닉네임입니다 </p>
			<input type="button" value="닫기" onclick="setnick()">
		</td>
	</tr>
</table>
</s:elseif>
</body>
</html>
