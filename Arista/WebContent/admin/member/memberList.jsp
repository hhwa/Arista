<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�����</title>
</head>
<body>
<center><b>ȸ�����(��ü:)</b></center>
<s:if test="memlist == NULL">
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
	���Ե� ȸ���� �����ϴ�.
	</td>
</tr>	
</table>
</s:if>
<s:elseif test="memlist != NULL" >
<table border="1" width="1000" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td align="center" width="100">ID</td>
		<td align="center" width="100">PASSWD</td>
		<td align="center" width="50">�̸�</td>
		<td align="center" width="200">�г���</td>
		<td align="center" width="60">�޴��� ��ȣ</td>
		<td align="center" width="60">�������</td>
		<td align="center" width="100">����</td>
		<td align="center" width="100">�̸���</td>
		<td align="center" width="100">���Գ�¥</td>
		<td align="center" width="60">������</td>
		<td align="center" width="200">������ ����</td>
	</tr>
<s:iterator value="memlist" status="stat">
<s:url id="viewMember" action="adminMemView">
<s:param name="m_id">
<s:property value="m_id"/>
</s:param>
</s:url> 
	<tr height="30">
		<td align="center"><s:a href="%{viewMember}"><s:property value="m_id"/></s:a></td>
		<td align="center"><s:property value="m_passwd"/></td>
		<td align="center"><s:property value="m_name"/></td>
		<td align="center"><s:property value="m_nickname"/></td>
		<td align="center"><s:property value="m_mobilephone"/></td>
		<td align="center"><s:property value="m_birthyear"/></td>
		<td align="center"><s:property value="m_region"/></td>
		<td align="center"><s:property value="m_email"/></td>
		<td align="center"><s:property value="m_joindate"/></td>
		<td align="center"><s:property value="m_position"/></td>
		<td align="center"><s:if test="admin_yn == 1">O</s:if>
		<s:elseif test="admin_yn == 0">X</s:elseif></td>
	</tr>
</s:iterator>

</table>
</s:elseif>
</body>
</html>