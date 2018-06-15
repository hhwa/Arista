<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
input.bor {
	display:black;
	border: 1px solid #2d2d30;
	width: 180px;
	height:22px;
	border-color: #2d2d30;
	padding: 1px 0px 0px 0px;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>솔로매치목록</title>
<script type="text/javascript">
function aboutMatch(url,msg){
	if (confirm(msg+" 하시겠습니까?") == true){    //확인
		location.href=url;
	}else{   //취소
	    return;
	}
}
</script>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr>
		<td height="40"></td>
	</tr>
</table>
<div style="margin-left:auto; margin-right:auto;">
	<table align="center">

	<tr align="center" bgcolor="#F3F3F3">
			<td width="80"><strong>경기번호</strong></td>
			<td width="80"><strong>경기종류</strong></td>
			<td width="110"><strong>경기일</strong></td>
			<td width="160"><strong>경기장</strong></td>
			<td width="80"><strong>경기지역</strong></td>
			<td width="120"><strong>비용</strong></td>
			<td width="420"><strong>내용</strong></td>
			<td width="90"><strong>신청인원</strong></td>
			<td width="90"><strong>최대인원</strong></td>
			<td width="200">&nbsp;&nbsp;</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="10"></td>
	</tr>
	
	<s:iterator value="list" status="stat">
		<s:url id="joinURL" action="joinSoloMatch">
		<s:param name="game_no">
			<s:property value="game_no"/>
		</s:param>
		<s:param name="mem_id">
			<s:property value="#session.session_id"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>			
		</s:param>
	</s:url>
	<s:url id="cancelURL" action="cancelSoloMatch">
		<s:param name="game_no">
			<s:property value="game_no"/>
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
		<td align="center"><s:property value="game_day"/></td>
		<td align="center"><s:property value="stadium"/></td>
		<td align="center"><s:property value="game_area"/></td>
		<td align="center"><s:property value="fee"/></td>
		<td align="center"><s:property value="content"/></td>
		<td align="center"><s:property value="people_count"/></td>
		<td align="center"><s:property value="people_max"/></td>
		<s:if test="#session.session_id != null">
			<td align="center">
				<s:if test="#session.session_adminYN == 1">
					<a href="#" onclick="aboutMatch('modifySoloMatchForm.action?game_no=<s:property value="game_no"/>&currentPage=<s:property value="currentPage"/>','이 매치를 수정')">매치수정</a>&nbsp;
					<a href="#" onclick="aboutMatch('deleteSoloMatch.action?game_no=<s:property value="game_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','이 매치를 삭제')">매치 삭제</a>
				</s:if>
				<s:else>
					<s:if test="mem_id != null">
						<s:a href="#" onclick="aboutMatch('%{cancelURL}','취소')">취소</s:a>
					</s:if>
					<s:else>
						<s:if test="people_count == people_max">마감</s:if>
						<s:else><s:a href="#" onclick="aboutMatch('%{joinURL}','신청')">신청</s:a></s:else>
					</s:else>
				</s:else>
				
			</td>
			
		</s:if>
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
	<s:if test="#session.session_adminYN == 1">
	<tr align="right">
		<td colspan="10">
			<input type="button" value="솔로매치 생성" class="inputb" onclick="javascript:location.href='CreateSoloMatchForm.action?currentPage=<s:property value="currentPage"/>';">
		</td>
	</tr>
	</s:if>
</table>
</div>
<br>
<form action="SoloMatchList.action" method="post">
<table align="center">
	<tr>
		<td>
			<select name="topic">
				<option value="0" selected="selected">제목</option>
				<option value="1">작성자</option>
				<option value="2">내용</option>
			</select>
			<input class="bor" type="text" name="search"/>
			<input style="padding: 1px 0px 0px 0px; height:22px;" id="bu_1" type="submit" value="   검색   " class="inputb">
		</td>
	</tr>
</table>
</form>
</body>
</html>