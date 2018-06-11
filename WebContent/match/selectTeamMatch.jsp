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
		<td height="20"></td>
	</tr>
</table>
<div style="margin-left:auto; margin-right:auto;">
	<table align="center">

	<tr align="center" bgcolor="#F3F3F3">
			<td width="70"><strong>경기번호</strong></td>
			<td width="70"><strong>경기종류</strong></td>
			<td width="100"><strong>HOME팀</strong></td>
			<td width="100"><strong>경기일</strong></td>
			<td width="150"><strong>경기장</strong></td>
			<td width="70"><strong>경기지역</strong></td>
			<td width="100"><strong>비용</strong></td>
			<td width="100"><strong>유니폼색상</strong></td>
			<td width="400"><strong>내용</strong></td>
			<td width="100"><strong>AWAY팀</strong></td>
			<td width="50">&nbsp;&nbsp;</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
	
	<s:iterator value="list" status="stat">
		<s:url id="joinURL" action="joinMatch">
		<s:param name="match_no">
			<s:property value="match_no"/>
		</s:param>
		<s:param name="mem_id">
			<s:property value="#session.session_id"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>			
		</s:param>
	</s:url>
	<s:url id="cancelURL" action="cancelMatch">
		<s:param name="match_no">
			<s:property value="match_no"/>
		</s:param>
		<s:param name="mem_id">
			<s:property value="#session.session_id"/>
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
		<s:if test="#session.session_id != null">
				<td align="center">
					<s:if test="team2_id != null">
						<s:if test="team2_id != memParam.myteam">마감</s:if>
						<s:else><s:a href="%{cancelURL}">취소</s:a></s:else>
					</s:if>
					<s:else>
						<s:if test="team_id == memParam.myteam"></s:if>
						<s:else><s:a href="%{joinURL}">신청</s:a></s:else>
					</s:else>
				</td>
			</s:if>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
	</s:iterator>
	
	<s:if test="list.size() <= 0">
	
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="11">등록된 게시물이 없습니다.</td>			
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
	</s:if>
	<tr align="center">
		<td colspan="11"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
	
	<s:if test="teamInfoParam.team_admin">
	<tr align="right">
		<td colspan="11">
			<input type="button" value="글쓰기" class="inputb" onclick="javascript:location.href='CreateTeamMatchForm.action?currentPage=<s:property value="currentPage"/>';">
		</td>
	</tr>
	</s:if>
</table>
</div>
<br>
<form action="TeamMatchList.action" method="post">
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