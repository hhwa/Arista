<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="1000" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td width="50">���̵�:&nbsp;<s:property value="memberResult.m_id"/></td>
		<td width="50">��й�ȣ:&nbsp;<s:property value="memberResult.m_passwd"/></td>
	</tr>
	<tr>	
		<td width="50">�̸�:&nbsp;<s:property value="memberResult.m_name"/></td>
		<td width="50">�г���:&nbsp;<s:property value="memberResult.m_nickname"/></td>
		<td width="50">������:&nbsp;<s:property value="memberResult.m_position"/></td>
	</tr>
	<tr>	
		<td width="60">�޴��� ��ȣ:&nbsp;<s:property value="memberResult.m_mobilephone"/></td>
		<td width="60">�������:&nbsp;<s:property value="memberResult.m_birthyear"/></td>
	</tr>
	<tr>	
		<td width="60">����:&nbsp;<s:property value="memberResult.m_region"/></td>
		<td width="100">�̸���:&nbsp;<s:property value="memberResult.m_email"/></td>
	</tr>
	<tr>
		<td width="100">���Գ�¥:&nbsp;<s:property value="memberResult.m_joindate"/></td>
		<td width="60">������ ����:&nbsp;<s:property value="memberResult.admin_yn"/>&nbsp;&nbsp;<font color="red" size="2">��0:�Ϲ� / 1:������</font></td>
	</tr>
	<tr>
	<td>�����ʻ��� ������:&nbsp;<s:property value="memberResult.prof_image_org"/></td>
	<td>�����ʻ��� �����:&nbsp;<s:property value="memberResult.prof_image_save"/></td>
	</tr>
	<tr>
	<td>�������̹���
	<img src="/Arista/profUpload/file_test1.jpg">
	</td>
	</tr>
	
</table>			
</body>
</html>