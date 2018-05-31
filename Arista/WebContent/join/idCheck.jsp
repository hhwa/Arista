<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID 중복체크</title>
<script language="javascript">

function setid()
 {
	opener.document.userinput.m_ID.value="<s:property value='m_id'/>";
 	self.close();


 } 


</script>
</head>
<body>


<s:if test="idcheckresult == 0">
<table width="270" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td height="39"><s:property value="%{memberResult.m_id}"/>는 이미 사용중인 아이디입니다.</td>
	</tr>	
</table>
<s:form name="checkForm" method="post" action="memberIdCheck.action">
<table width="200" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		다른 아이디를 입력하세요.<p>
		<input type="text" size="20" name="m_id">
		<input type="submit" value="ID중복확인">
		</td>
	</tr>	
</table>
</s:form>
</s:if>
<s:elseif test="idcheckresult == 1">

<table width="270" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>입력하신 [<s:property value="m_id"/>] 는 사용하실 수 있는 ID입니다 </p>
			<input type="button" value="닫기" onclick="setid()">
		</td>
	</tr>
</table>
</s:elseif>
</body>
</html>
