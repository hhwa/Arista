<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ַθ�ġ���</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr>
		<td align="center"><h2>Solo Match</h2></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>
<div style="margin-left:auto; margin-right:auto;">
	<table align="center">

	<tr align="center" bgcolor="#F3F3F3">
			<td width="70"><strong>����ȣ</strong></td>
			<td width="70"><strong>�������</strong></td>
			<td width="100"><strong>HOME��</strong></td>
			<td width="100"><strong>�����</strong></td>
			<td width="150"><strong>�����</strong></td>
			<td width="70"><strong>�������</strong></td>
			<td width="100"><strong>���</strong></td>
			<td width="100"><strong>����������</strong></td>
			<td width="400"><strong>����</strong></td>
			<td width="100"><strong>AWAY��</strong></td>
			<td width="50">&nbsp;&nbsp;</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
	
	<s:iterator value="list" status="stat">
		<s:url id="viewURL" action="matchState">
			<s:param name="game_no">
				<s:property value="game_no"/>
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage"/>			
			</s:param>
		</s:url>
	<tr bgcolor="#FFFFFF" align="center">
		<td align="center"><s:property value="game_no"/></td>
		<td align="center"><s:property value="game_type"/></td>
		<td align="center"><s:property value="team_id"/></td>
		<td align="center"><s:property value="game_day"/></td>
		<td align="center"><s:property value="stadium"/></td>
		<td align="center"><s:property value="game_area"/></td>
		<td align="center"><s:property value="fee"/></td>
		<td align="center"><s:property value="uniform_color"/></td>
		<td align="center"><s:property value="content"/></td>
		<td align="center"><s:property value="team2_id"/></td>
		<td align="center"><s:a href="%{viewURL}">��û</s:a></td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
	</s:iterator>
	
	<s:if test="list.size() <= 0">
	
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="11">��ϵ� �Խù��� �����ϴ�.</td>			
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
	</s:if>
	<tr align="center">
		<td colspan="11"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
	
	<tr align="right">
		<td colspan="11">
			<input type="button" value="�۾���" class="inputb" onclick="javascript:location.href='CreateTeamMatchForm.action?currentPage=<s:property value="currentPage"/>';">
		</td>
	</tr>
</table>
</div>
<br>
<form action="TeamList.action" method="post">
<table align="center">
	<tr>
		<td>
			<select name="topic">
				<option value="0" selected="selected">����</option>
				<option value="1">�ۼ���</option>
				<option value="2">����</option>
			</select>
			<input type="text" name="search"/>
			<input type="submit" value="�˻�" class="inputb">
		</td>
	</tr>
</table>
</form>
</body>
</html>