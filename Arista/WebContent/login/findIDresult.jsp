<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID ã��</title>
</head>
<body>
<table align="center">
<tr height="50"></tr>
<s:if test="memberResult != null">
<tr height="80">
<td align="center" colspan="2" class="under"><br>����� ���̵�� <s:property value="%{memberResult.m_id}"/>�Դϴ�.</td>
</tr>
<tr height="100">
<td><input type="button" value="�α���" style="width:150px; height:30px;" id="bu_1" onclick="javascript:window.close();"></td>
<td><input type="button" value="��й�ȣ ã��" style="width:150px; height:30px;" id="bu_1" onclick="javascript:window.location='findPWForm.action'"></td>
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