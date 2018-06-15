<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style>
table, td {
border 1px solid black;
border-spacing 20px 20px;
}
</style>
</head>
<body>
<table align="center">
<tr>
<td align="center"><font size="6">ID 찾기 결과</font></td>
</tr>
<s:if test="memberResult != null">
<tr>
<td align="center"><br>당신의 아이디는 <s:property value="%{memberResult.m_id}"/>입니다.</td>
</tr>
<tr>
<td><br><br><br><input type="button" value="로그인" id="bu_1" onclick="javascript:window.location='loginForm.action'"></td>
<td><br><br><br><input type="button" value="비밀번호 찾기" id="bu_1" onclick="javascript:window.location='findPWForm.action'"></td>
</tr>
</s:if>
</table>
<s:elseif test="memberResult == null">
<script type="text/javascript">
alert("입력한 정보와 일치하는 ID가 존재하지 않습니다.");
history.go(-1);
</script>
</s:elseif>
</body>
</html>