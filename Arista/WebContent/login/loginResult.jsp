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
alert("��ġ�ϴ� ������ �����ϴ�.");
window.location.href="loginForm.action";
</script>
</s:if>
<s:elseif test="#session.m_id != null">
<h2><s:property value="m_id"/></h2>�� ȯ���մϴ�.${session.admin_yn}
<a href="logout.action">�α׾ƿ�</a>
<a href='modiftymemberForm.action?m_id=<s:property value="m_id"/>'>ȸ����������</a>
<a href='javascript:void(0);' onclick="javascript:open_win_noresizable('deletememberPW.action?m_id=<s:property value="m_id"/>')">ȸ��Ż��</a>
<%-- <a href='deletemember.action?m_id=<s:property value="m_id"/>'>ȸ��Ż��</a> --%>
</s:elseif>
<s:if test="#session.admin_yn ==1">
test:����� ������ �Դϴ�.

</s:if>
<s:elseif test="#session.admin_yn ==0">
test:����� �Ϲ����� �Դϴ�.
</s:elseif>
</body>
</html>