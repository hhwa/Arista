<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function open_win_noresizable (url, name) {
	var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=400, height=200");
}
</script>
</head>
<body>
<s:if test="#session.m_id == null">
<script>
alert("일치하는 정보가 없습니다.");
window.location.href="loginForm.action";
</script>
</s:if>
<s:elseif test="#session.m_id != null">
<h2><s:property value="m_id"/></h2>님 환영합니다.${session.admin_yn}
<a href="logout.action">로그아웃</a>
<a href='modiftymemberForm.action?m_id=<s:property value="m_id"/>'>회원정보수정</a>
<a href='javascript:void(0);' onclick="javascript:open_win_noresizable('deletememberPW.action?m_id=<s:property value="m_id"/>')">회원탈퇴</a>
<%-- <a href='deletemember.action?m_id=<s:property value="m_id"/>'>회원탈퇴</a> --%>
</s:elseif>
<s:if test="#session.admin_yn ==1">
test:당신은 관리자 입니다.

</s:if>
<s:elseif test="#session.admin_yn ==0">
test:당신은 일반유저 입니다.
</s:elseif>
</body>
</html>