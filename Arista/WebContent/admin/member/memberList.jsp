<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�����</title>
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<center><b>ȸ�����(��ü:<s:property value="totalCount"/>)</b></center>
<br>
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
<table align="center">
	<tr height="30">
		<td id="bu_1" align="center" width="100">ID</td>
		<td id="bu_1" align="center" width="100">PASSWD</td>
		<td id="bu_1" align="center" width="50">�̸�</td>
		<td id="bu_1" align="center" width="200">�г���</td>
		<td id="bu_1" align="center" width="60">�޴��� ��ȣ</td>
		<td id="bu_1" align="center" width="100">�������</td>
		<td id="bu_1" align="center" width="100">����</td>
		<td id="bu_1" align="center" width="100">�̸���</td>
		<td id="bu_1" align="center" width="100">���Գ�¥</td>
		<td id="bu_1" align="center" width="60">������</td>
		<td id="bu_1" align="center" width="80">������</td>
	</tr>
<s:iterator value="memlist" status="stat">

	<tr height="30" onclick="location.href='adminMemView.action?m_id=<s:property value="m_id" />&currentPage=<s:property value="currentPage" />'">
		<td id="under_line" align="center"><s:property value="m_id"/></td>
		<td id="under_line" align="center"><s:property value="m_passwd"/></td>
		<td id="under_line" align="center"><s:property value="m_name"/></td>
		<td id="under_line" align="center"><s:property value="m_nickname"/></td>
		<td id="under_line" align="center"><s:property value="m_mobilephone"/></td>
		<td id="under_line" align="center"><s:property value="m_birthyear"/></td>
		<td id="under_line" align="center"><s:property value="m_region"/></td>
		<td id="under_line" align="center"><s:property value="m_email"/></td>
		<td id="under_line" align="center"><s:property value="m_joindate"/></td>
		<td id="under_line" align="center"><s:property value="m_position"/></td>
		<td id="under_line" align="center"><s:if test="admin_yn == 1">O</s:if>
		<s:elseif test="admin_yn == 0">X</s:elseif></td>
	</tr>
</s:iterator>

</table>
</s:elseif>
<table align="center">
	<tr height="10"><td></td></tr>
	<tr align="center">
  		<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
	</tr>
</table>

<div align="center">
<table align="center" width="90%">
	<s:form action="adminMemList.action" method="post">
	<tr>
		<td colspan="5" align="center">
			<select name="topic" class="bottom" id="bu_in">
				<option value="0">���̵�</option>
				<option value="1">�̸�</option>
				<option value="2">�̸���</option>
			</select>
			<input type="text" name="search" size="15" class="bottom" id="bu_in">
			<input type="submit" value="�˻�" class="bu_2"/>
		</td>
		<td width="10"></td>
		<td>
			<input type="button" value="ó�� �������" class="bu_2" onclick="javascript:location.href='adminMemList.action'"/>
		</td>
	</tr>
	</s:form>
</table>
</div>
</body>
</html>