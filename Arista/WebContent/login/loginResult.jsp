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
<h2>�α��κҰ�, ��ġ�ϴ� ������ �����ϴ�.</h2>
</s:if>
<s:elseif test="#session.m_id != null">
<h2><s:property value="m_id"/></h2>�� ȯ���մϴ�.

<a href="logout.action">�α׾ƿ�</a>
<a href='modiftymemberForm.action?m_id=<s:property value="m_id"/>'>ȸ����������</a>
<a href='deletemember.action?m_id=<s:property value="m_id"/>'>ȸ��Ż��</a>
</s:elseif>

</body>
</html>