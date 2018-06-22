<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID 중복체크</title>
<script language="javascript">

function setid()
 {
	opener.document.userinput.m_id.value="<s:property value='m_id'/>";
	opener.document.userinput.idcheckresult.value="<s:property value='idcheckresult'/>";
 	self.close();

 } 


</script>
</head>
<body>

<s:if test="idcheckresult == 0">
<table width="500" align="center">
	<tr height="10"><td></td></tr>
	<tr>
		<td align="center"><s:property value="%{memberResult.m_id}"/>는 이미 사용중인 아이디입니다.</td>
	</tr>	
	<tr height="10"><td></td></tr>	
</table>
<s:form name="checkForm" method="post" action="memberIdCheck.action">
<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		다른 아이디를 입력하세요.<p>
		<input type="text" size="20" name="m_id" autocomplete="off" class="bottom">
		</td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="ID중복확인" id="bu_1">
		</td>
	</tr>	
</table>
</s:form>
</s:if>
<s:elseif test="idcheckresult == 1">

<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>입력하신 [<s:property value="m_id"/>] 는 사용하실 수 있는 ID입니다 </p>
			<input type="button" value="닫기" onclick="setid()" id="bu_1">
		</td>
	</tr>
</table>
</s:elseif>
</body>
</html>
