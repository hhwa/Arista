<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style>
table, td {
border 1px solid black;
border-spacing 20px 20px;
}
</style>
</head>
<body>
<table align="center">
<tr>
<td align="center"><font size="6">ID ã�� ���</font></td>
</tr>
<s:if test="memberResult != null">
<tr>
<td align="center"><br>����� ���̵�� <s:property value="%{memberResult.m_id}"/>�Դϴ�.</td>
</tr>
<tr>
<td><br><br><br><input type="button" value="�α���" id="bu_1" onclick="javascript:window.location='loginForm.action'"></td>
<td><br><br><br><input type="button" value="��й�ȣ ã��" id="bu_1" onclick="javascript:window.location='findPWForm.action'"></td>
</tr>
</s:if>
</table>
<s:elseif test="memberResult == null">
<script type="text/javascript">
alert("�Է��� ������ ��ġ�ϴ� ID�� �������� �ʽ��ϴ�.");
history.go(-1);
</script>
</s:elseif>
</body>
</html>