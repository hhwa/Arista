<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이메일 중복체크</title>
<script language="javascript">

function setemail()
 {
	opener.document.userinput.m_email.value="<s:property value='m_email'/>";
	opener.document.userinput.emailcheckresult.value="<s:property value='emailcheckresult'/>";
 	self.close();
 } 


</script>
</head>
<body>


<s:if test="emailcheckresult == 0">
<table width="500" align="center">
	<tr height="10"><td></td></tr>
	<tr>
		<td align="center"><s:property value="%{memberResult.m_email}"/>는 이미 사용중인 이메일입니다.</td>
	</tr>	
	<tr height="10"><td></td></tr>	
</table>
<s:form name="checkForm" method="post" action="memberEmailCheck">
<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		다른 이메일을 입력하세요.<p>
		<input type="text" size="30"  name="m_email" class="bottom" autocomplete="off">
		</td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="이메일 중복확인" id="bu_1">
		</td>
	</tr>	
</table>
</s:form>
</s:if>
<s:elseif test="emailcheckresult == 1">

<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>입력하신 [<s:property value="m_email"/>] 는 사용하실 수 있는 이메일입니다 </p>
			<input type="button" value="닫기" id="bu_1" onclick="setemail()">
		</td>
	</tr>
</table>
</s:elseif>
</body>
</html>
