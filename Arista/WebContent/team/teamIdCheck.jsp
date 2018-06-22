<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TEAMID 중복체크</title>
<script language="javascript">
function setid()
 {
	opener.document.userinput.team_id.value="<s:property value='team_id'/>";
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
		<td align="center"><s:property value="%{resultClass.team_id}"/>는 이미 사용중인 팀 이름 입니다.</td>
	</tr>
	<tr height="10"><td></td></tr>	
</table>
<s:form name="checkForm" method="post" action="teamIdCheck.action">
<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		다른 아이디를 입력하세요.<p>
		<input type="text" name="team_id" class="bottom" size="30" autocomplete="off">
		</td>
	</tr>
	<tr>
		<td align="center" >
			<input type="submit" value="팀 이름 중복확인" id="bu_1">
		</td>
	</tr>	
</table>
</s:form>
</s:if>
<s:elseif test="idcheckresult == 1">

<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>입력하신 [<s:property value="team_id"/>] 는 사용하실 수 있는 팀 이름 입니다 </p>
			<input type="button" value="닫기" onclick="setid()" id="bu_1">
		</td>
	</tr>
</table>
</s:elseif>

</body>
</html>