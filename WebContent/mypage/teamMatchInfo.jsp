<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style="margin-left:auto; margin-right:auto;">
		
	<table align="center">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="100"><strong>������</strong></td>
			<td width="100"><strong>�����</strong></td>
			<td width="70"><strong>�������</strong></td>
			<td width="400"><strong>���ϴ� �޼���</strong></td>
			<td width="100"><strong>�����</strong></td>		
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
				<td align="center"><s:property value="team_id"/></td>
				<td align="center"><s:property value="game_day"/></td>
				<td width=150 align="left" style="padding:0px 0px 0px 10px">
						        ���� : <s:property value="game_type"/><br>
						        ���� : <s:property value="game_area"/><br>
						        ��� : <s:property value="stadium"/><br>
						        ��� : <s:property value="fee"/><br>
						        ������ ���� : <s:property value="uniform_color"/></td>
				<td align="center"><s:property value="content"/></td>
			
			<s:if test="team2_id == null">
				<td align=center>�����</td>
			</s:if>
			<s:else>
				<td align="center">123<s:property value="team2_id"/></td>
			</s:else>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="11"></td>
		</tr>
	</s:iterator>
	
	
	<s:if test="list.size() <= 0">
	
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="11">����� ��ġ���� �����ϴ�.</td>			
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
	</s:if>
	<tr align="center">
		<td colspan="11"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
	
</table>

</div>
</body>
</html>