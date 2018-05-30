<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체매치</title>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr>
		<td align="center"><h2>매치</h2></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>
<s:iterator value="list" status="stat">
	<s:url id="viewURL" action="joinMatch">
		<s:param name="match_no">
			<s:property value="match_no"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>			
		</s:param>
	</s:url>
<div style="margin-left:auto; margin-right:auto;">
	<table align="center">
	<s:if test="match_type eq 'Solo'">
	
		<tr align="center" bgcolor="#F3F3F3">
			<td width="80"><strong>매치번호</strong></td>
			<td width="80"><strong>매치종류</strong></td>
			<td width="80"><strong>경기종류</strong></td>
			<td width="110"><strong>경기일</strong></td>
			<td width="160"><strong>경기장</strong></td>
			<td width="80"><strong>경기지역</strong></td>
			<td width="120"><strong>비용</strong></td>
			<td width="420"><strong>내용</strong></td>
			<td width="90"><strong>신청인원</strong></td>
			<td width="90"><strong>최대인원</strong></td>
			<td width="50">&nbsp;&nbsp;</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="11"></td>
		</tr>
		<tr bgcolor="#FFFFFF" align="center">
			<td align="center"><s:property value="match_no"/></td>
			<td align="center"><s:property value="match_type"/></td>
			<td align="center"><s:property value="game_type"/></td>
			<td align="center"><s:property value="game_day"/></td>
			<td align="center"><s:property value="stadium"/></td>
			<td align="center"><s:property value="game_area"/></td>
			<td align="center"><s:property value="fee"/></td>
			<td align="center"><s:property value="content"/></td>
			<td align="center"><s:property value="people_count"/></td>
			<td align="center"><s:property value="people_max"/></td>
			<td align="center"><s:a href="%{viewURL}">신청</s:a></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="11"></td>
		</tr>
	</s:if>
	<s:if test="match_type eq 'team'">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="70"><strong>매치번호</strong></td>
			<td width="70"><strong>매치종류</strong></td>
			<td width="70"><strong>경기종류</strong></td>
			<td width="100"><strong>HOME팀</strong></td>
			<td width="100"><strong>경기일</strong></td>
			<td width="150"><strong>경기장</strong></td>
			<td width="70"><strong>경기지역</strong></td>
			<td width="100"><strong>비용</strong></td>
			<td width="80"><strong>유니폼색상</strong></td>
			<td width="400"><strong>내용</strong></td>
			<td width="100"><strong>AWAY팀</strong></td>
			<td width="50">&nbsp;&nbsp;</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="12"></td>
		</tr>
		<tr bgcolor="#FFFFFF" align="center">
			<td align="center"><s:property value="match_no"/></td>
			<td align="center"><s:property value="match_type"/></td>
			<td align="center"><s:property value="game_type"/></td>
			<td align="center"><s:property value="team_id"/></td>
			<td align="center"><s:property value="game_day"/></td>
			<td align="center"><s:property value="stadium"/></td>
			<td align="center"><s:property value="game_area"/></td>
			<td align="center"><s:property value="fee"/></td>
			<td align="center"><s:property value="uniform_color"/></td>
			<td align="center"><s:property value="content"/></td>
			<td align="center"><s:property value="team2_id"/></td>
			<td align="center"><s:a href="%{viewURL}">신청</s:a></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="12"></td>
		</tr>
	</s:if>
	<s:if test="list.size() <= 0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="12">등록된 게시물이 없습니다.</td>			
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>
	</s:if>	
	</table>
</div>
</s:iterator>
<div style="position:relative; top:10px;">
<table align="center">
	<tr align="center">
		<td colspan="12"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
</table>
</div>
</body>
</html>