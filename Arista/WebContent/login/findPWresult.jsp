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

<s:if test="memberResult != null">
<h2>메일 전송 완료</h2>
</s:if>
<s:elseif test = "memberResult ==null">
<h2>입력하신 정보의 결과가 존재하지 않습니다.</h2>
</s:elseif>

</body>
</html>