<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br><br><center>
<h1><b>�� ����</b></h1>
<h5><b></b> ���� ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �� �� Ȯ�� �մϴ�.</h5>

	<table border="1" width="1000" cellpadding="0" cellspacing="0" align="center">
		<tr height="30">
			<td width="50">���̵�</td>
			<td><s:property value="memberResult.m_id"/></td>
		</tr>
		<tr>	
			<td width="50">�̸�:&nbsp;<s:property value="memberResult.m_name"/></td>
		</tr>
		<tr>
			<td width="50">�г���:&nbsp;<s:property value="memberResult.m_nickname"/></td>
		</tr>
		<tr>
			<td width="50">������:&nbsp;<s:property value="memberResult.m_position"/></td>
		</tr>
		<tr>	
			<td width="60">�޴��� ��ȣ:&nbsp;<s:property value="memberResult.m_mobilephone"/></td>
		</tr>
		<tr>
			<td width="60">�������:&nbsp;<s:property value="memberResult.m_birthyear"/></td>
		</tr>
		<tr>	
			<td width="60">����:&nbsp;<s:property value="memberResult.m_region"/></td>
		</tr>
		<tr>
			<td width="100">�̸���:&nbsp;<s:property value="memberResult.m_email"/></td>
		</tr>
		<tr>
			<td width="100">���Գ�¥:&nbsp;<s:property value="memberResult.m_joindate"/></td>
		</tr>
	
	<tr>
	<td>�������̹���<s:property value="memberResult.prof_image_org"/>
	<img src="/Arista/profUpload/file_test1.jpg">
	</td>
	</tr>
	
	</table>
</center>
</body>
</html>