<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� Ż�� ó�� ���</title>


</head>
<body>
<s:if test="deletemembercheck == 0">
<script>
alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է����ּ���.");
/* document.location.href="javascript:open_win_noresizable('deletememberPW.action?m_id=<s:property value="m_id"/>')"; */
window.close();
</script>
</s:if>
<s:elseif test="deletemembercheck == 1">
<script>
alert("ȸ�� Ż�� ó���� �Ϸ�Ǿ����ϴ�.");
window.opener.location.href="main.action";
window.close();
</script>
</s:elseif>


</body>
</html>