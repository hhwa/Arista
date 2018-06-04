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
<s:if test="loginchk ==1">
<h2>로그인불가, 일치하는 정보가 없습니다.</h2>
</s:if>
<s:elseif test="loginchk ==0">
<h2><a href=main.action>asd</a>
</s:elseif>


</body>
</html>