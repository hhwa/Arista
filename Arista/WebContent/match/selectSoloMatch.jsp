<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>솔로매치목록</title>
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
		<td height="1" colspan="10"></td>
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
		<td height="1" colspan="10"></td>
	</tr>
	</s:iterator>
	
	<s:if test="list.size() <= 0">
	
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="10">등록된 게시물이 없습니다.</td>			
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="10"></td>
	</tr>
	</s:if>
	<tr align="center">
		<td colspan="10"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
	
	<tr align="right">
		<td colspan="10">
			<input type="button" value="글쓰기" class="inputb" onclick="javascript:location.href='CreateSoloMatchForm.action?currentPage=<s:property value="currentPage"/>';">
		</td>
	</tr>
</table>
</div>
<br>
<form action="SoloList.action" method="post">
<table align="center">
	<tr>
		<td>
			<select name="topic">
				<option value="0" selected="selected">제목</option>
				<option value="1">작성자</option>
				<option value="2">내용</option>
			</select>
			<input type="text" name="search"/>
			<input type="submit" value="검색" class="inputb">
		</td>
	</tr>
</table>
</form>
</body>
</html>