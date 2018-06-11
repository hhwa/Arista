<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID 중복체크</title>
<script language="javascript">
<%-- <script type="text/javascript"> --%>
function setid()
 {
	opener.document.userinput.m_id.value="<s:property value='m_id'/>";
 	self.close();

 } 

/* function idCheck() {
	//정규식 a~z, A~Z, 0 ~9만 입력 받고 자릿수는 4~12로 제한한다.
	var regExp1 = /^[a-zA-Z0-9]{4,12}$/;
	var id = document.checkForm.m_id.value;
	//var id = document.getElementsById('checkid').value;
	 if(!regExp1.test(id)){
		alert("아이디는 특수문자/한글/공백은 사용할 수 없습니다.(4자 이상)");
	 	return false;
	 }
} */

</script>
</head>
<body>


<s:if test="idcheckresult == 0">
<table width="400" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td height="39"><s:property value="%{memberResult.m_id}"/>는 이미 사용중인 아이디입니다.</td>
	</tr>	
</table>
<s:form name="checkForm" method="post" action="memberIdCheck" onsubmit="return idCheck();">
<table width="400" border="0" cellspacing="0" cellpadding="5">
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

<table width="400" border="0" cellspacing="0" cellpadding="5">
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
