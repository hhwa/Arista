<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TEAMID �ߺ�üũ</title>
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
		<td align="center"><s:property value="%{resultClass.team_id}"/>�� �̹� ������� �� �̸� �Դϴ�.</td>
	</tr>
	<tr height="10"><td></td></tr>	
</table>
<s:form name="checkForm" method="post" action="teamIdCheck.action">
<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		�ٸ� ���̵� �Է��ϼ���.<p>
		<input type="text" name="team_id" class="bottom" size="30" autocomplete="off">
		</td>
	</tr>
	<tr>
		<td align="center" >
			<input type="submit" value="�� �̸� �ߺ�Ȯ��" id="bu_1">
		</td>
	</tr>	
</table>
</s:form>
</s:if>
<s:elseif test="idcheckresult == 1">

<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>�Է��Ͻ� [<s:property value="team_id"/>] �� ����Ͻ� �� �ִ� �� �̸� �Դϴ� </p>
			<input type="button" value="�ݱ�" onclick="setid()" id="bu_1">
		</td>
	</tr>
</table>
</s:elseif>

</body>
</html>