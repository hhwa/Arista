<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script language="javascript">
function begin() {
	document.findid.m_name.focus();
}
function checkIt() {
	if(!document.findid.m_name.value){
		alert("�̸��� �Է����� �����̽��ϴ�.");
		document.findid.m_name.focus();
		return false;
	}
	if(!document.findid.m_email.value){
		alert("�̸����� �Է����� �����̽��ϴ�.");
		document.findid.m_email.focus();
		return false;
	}
}


</script>
<title>ID ã��</title>
</head>
<body onload="begin()">
<s:form name="findid" action="findIDPro" method="post" onsubmit="return checkIt();">
<table width="400" align="center">
	<tr height="50"></tr>
	<tr height="30">
		<td colspan="2" align="center" class="bu_2">
		<strong>���̵� ã��</strong>
		</td>
	</tr>
	<tr height="20"></tr>
	<tr height="30">
		<td width="110" class="under"><b>�̸�</b></td>
		<td width="150" class="under">
			<input type="text" name="m_name" size="15" maxlength="12" ></td>
	</tr>
	<tr height="20"></tr>
	<tr height="30">
		<td width="110" class="under"><b>�̸����ּ�</b></td>
		<td width="150" class="under">
			<input type="text" name="m_email" size="30" maxlength="30"></td>
	</tr>		
	<tr height="20"></tr>
	<tr height="30">
		<td colspan="2" align="center" >
			<input type="submit" id="bu_1" style="width:125px; height:25px;" value="ID ã��">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="bu_1" style="width:125px; height:25px;" value="�� ��" onClick="window.close();">
</td>
</tr>
</table>
</s:form>
</body>
</html>