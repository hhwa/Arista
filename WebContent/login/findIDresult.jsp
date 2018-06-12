<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID 찾기 결과</title>
</head>
<body>
<h2>ID 찾기 결과</h2>
<table>
<s:if test="memberResult != null">
<tr>
<td>당신의 아이디는 <s:property value="%{memberResult.m_id}"/>입니다.</td>
</tr>
<tr>
<td><input type="button" value="로그인" onclick="javascript:window.location='loginForm.action'"></td>
<td><input type="button" value="비밀번호 찾기" onclick="javascript:window.location='findPWForm.action'"></td>


</tr>
</s:if>
</table>

<s:elseif test="memberResult == null">
입력한 정보와 일치하는 ID가 존재하지 않습니다.

	<input type="button" value="메인으로" onclick="javascript:window.location='main.action'">

</s:elseif>
</body>
</html>