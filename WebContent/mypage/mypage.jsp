<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<center>
		<h1>
			<b>�� ����</b>
		</h1>
		<h5>
			<b><s:property value="#session.session_id"/></b> ���� ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �� �� Ȯ�� �մϴ�.
		</h5><br>
		
		<form action="myInfoView.action" method="post">
		<table>
			<tr>
				<td height="50">���̵�  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:property value="#session.session_id"/></td>
			</tr>
			<tr>
				<td height="50">��й�ȣ &nbsp;&nbsp; <input type="password" name="m_passwd"/></td>
			</tr>
			<tr>
				<td align="center" height=50><input type="submit" value="Ȯ   ��"/>
			</tr>
		</table>
		</form>
	</center>

</body>
</html>