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

	<table border=1 >
		<tr>
			<td align="left" style="padding:0px 0px 0px 10px;">���̵�</td>
			<td><s:property value="resultClass.m_ID"/></td>		
		</tr>
		<tr>
			<td align="left">��  ��</td>
			<s:property value="resultClass.m_name"/>
		</tr>
		<tr>
			<td align="left">�г���</td>
			<s:property value="resultClass.m_nickname"/>
		</tr>
		<tr>
			<td>�������</td>
			<td><s:property value="reultClass.m_birthyear"/></td>
		</tr>
		<tr>
		<td> 
		<tr>
			
	</table>
</center>
</body>
</html>