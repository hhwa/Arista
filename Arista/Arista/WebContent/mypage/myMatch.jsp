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
<br><br>
<center><h1>���� ��û�� ��ġ��</h1></center>
<br><br>
<table>
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
			<td align="center"><s:property value="game_day"/></td>
			<td width=150 align="left" style="padding:0px 0px 0px 10px">
						        ���� : <s:property value="game_type"/><br>
						        ���� : <s:property value="game_area"/><br>
						        ��� : <s:property value="stadium"/><br>
						        ��� : <s:property value="fee"/><br>
						       �ִ� �ο�: <s:property value="people_max"/> </td>
			<td align="center"><s:property value="content"/></td>
			<s:if test="people_count < people_max">
			<td align=center>�����</td>
			</s:if>
			<s:else>
			<td align="center">��ġ ����</td>
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
</body>
</html>