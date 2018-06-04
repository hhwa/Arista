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
<s:property value="#session.session_id"/>님 매치를 선택해주세요
<div style="margin:auto;">
<a href="SoloMatchList.action">Solo Match</a> &nbsp;&nbsp;&nbsp;
<a href="TeamMatchList.action">Team Match</a>
</div>
</body>
</html>