<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID ã�� ���</title>
</head>
<body>
<h2>ID ã�� ���</h2>
<table>
<s:if test="memberResult != null">
<tr>
<td>����� ���̵�� <s:property value="%{memberResult.m_id}"/>�Դϴ�.</td>
</tr>
<tr>
<td><input type="button" value="�α���" onclick="javascript:window.location='loginForm.action'"></td>
<td><input type="button" value="��й�ȣ ã��" onclick="javascript:window.location='findPWForm.action'"></td>


</tr>
</s:if>
</table>

<s:elseif test="memberResult == null">
�Է��� ������ ��ġ�ϴ� ID�� �������� �ʽ��ϴ�.

	<input type="button" value="��������" onclick="javascript:window.location='main.action'">

</s:elseif>
</body>
</html>