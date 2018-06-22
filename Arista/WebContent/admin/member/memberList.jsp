<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원목록</title>
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<center><b>회원목록(전체:<s:property value="totalCount"/>)</b></center>
<br>
<s:if test="memlist == NULL">
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
	가입된 회원이 없습니다.
	</td>
</tr>	
</table>
</s:if>
<s:elseif test="memlist != NULL" >
<table align="center">
	<tr height="30">
		<td id="bu_1" align="center" width="100">ID</td>
		<td id="bu_1" align="center" width="100">PASSWD</td>
		<td id="bu_1" align="center" width="50">이름</td>
		<td id="bu_1" align="center" width="200">닉네임</td>
		<td id="bu_1" align="center" width="60">휴대폰 번호</td>
		<td id="bu_1" align="center" width="100">생년월일</td>
		<td id="bu_1" align="center" width="100">지역</td>
		<td id="bu_1" align="center" width="100">이메일</td>
		<td id="bu_1" align="center" width="100">가입날짜</td>
		<td id="bu_1" align="center" width="60">포지션</td>
		<td id="bu_1" align="center" width="80">관리자</td>
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
				<option value="0">아이디</option>
				<option value="1">이름</option>
				<option value="2">이메일</option>
			</select>
			<input type="text" name="search" size="15" class="bottom" id="bu_in">
			<input type="submit" value="검색" class="bu_2"/>
		</td>
		<td width="10"></td>
		<td>
			<input type="button" value="처음 목록으로" class="bu_2" onclick="javascript:location.href='adminMemList.action'"/>
		</td>
	</tr>
	</s:form>
</table>
</div>
</body>
</html>