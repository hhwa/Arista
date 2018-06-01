<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<s:if test="#session.m_id == null">
<h2>로그인불가, 일치하는 정보가 없습니다.</h2>
</s:if>
<s:elseif test="#session.m_id != null">
<h2><s:property value="m_id"/></h2>님 환영합니다.

<a href="logout.action">로그아웃</a>
<a href='modiftymemberForm.action?m_id=<s:property value="m_id"/>'>회원정보수정</a>
<a href='deletemember.action?m_id=<s:property value="m_id"/>'>회원탈퇴</a>
</s:elseif>

</body>
</html>