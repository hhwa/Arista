<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원목록</title>
</head>
<body>
<center><b>회원목록(전체:)</b></center>
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
<table border="1" width="1000" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td align="center" width="100">ID</td>
		<td align="center" width="100">PASSWD</td>
		<td align="center" width="50">이름</td>
		<td align="center" width="200">닉네임</td>
		<td align="center" width="60">휴대폰 번호</td>
		<td align="center" width="60">생년월일</td>
		<td align="center" width="100">지역</td>
		<td align="center" width="100">이메일</td>
		<td align="center" width="100">가입날짜</td>
		<td align="center" width="60">포지션</td>
		<td align="center" width="200">관리자 권한</td>
	</tr>
<s:iterator value="memlist" status="stat">
<s:url id="viewMember" action="adminMemView" method="memberView">
<s:param name="m_id">
<s:property value="m_id"/>
</s:param>
<s:param name="currentPage">
<s:property value="currentPage"/>
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
<table align="center">
<tr align="center">
  <td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
</tr>
<s:form method="post">
<tr align="center">
<td>
<select name="topic">
<option value="0">아이디</option>
<option value="1">이름</option>
<option value="2">이메일</option>
</select>
<input type="text" name="search" size="15">
<s:submit action="adminMemList" method="memberList" value="검색"/>
</td>
<td>&nbsp;&nbsp;&nbsp;
<input type="button" value="처음 목록으로" onclick="javascript:location.href='adminMemList.action'"/>
</td>
</tr>
</s:form>
</table>
</body>
</html>