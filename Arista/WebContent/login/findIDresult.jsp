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
<s:if test="memberResult != null">
당신의 아이디는 <s:property value="memberResult.m_id"/>입니다
</s:if>
<s:elseif test="memberResult == null">
입력한 정보와 일치하는 ID가 존재하지 않습니다.
</s:elseif>
</body>
</html>