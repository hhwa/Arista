<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ Ȯ��</title>
<script type="text/javascript">
function locationURL(){
	if(window.name == 'delete'){
	alert('�����Ǿ����ϴ�.');
	window.opener.parent.location.href='deleteMember.action?m_id=<s:property value="m_id" />';
}
window.close();
}
</script>
</head>
<body>

<script>locationURL()</script>

</body>
</html>