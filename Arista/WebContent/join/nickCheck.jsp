<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�г��� �ߺ�üũ</title>
<script language="javascript" charset="EUC-KR">

function setnick()
 {
	opener.document.userinput.m_nickname.value="<s:property value='m_nickname'/>";
	opener.document.userinput.nickcheckresult.value="<s:property value='nickcheckresult'/>";
 	self.close();
 } 


</script>
</head>
<body>


<s:if test="nickcheckresult == 0">
<table width="500" align="center">
	<tr height="10"><td></td></tr>
	<tr>
		<td align="center"><s:property value="%{memberResult.m_nickname}"/>�� �̹� ������� �г����Դϴ�.</td>
	</tr>	
	<tr height="10"><td></td></tr>	
</table>
<s:form name="checkForm" method="post" action="memberNickCheck.action">
<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		�ٸ� �г����� �Է��ϼ���.<p>
		<input type="text" size="20" name="m_nickname" class="bottom" autocomplete="off">
		</td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="�г��� �ߺ�Ȯ��" id="bu_1">
		</td>
	</tr>	
</table>
</s:form>
</s:if>
<s:elseif test="nickcheckresult == 1">

<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>�Է��Ͻ� [<s:property value="m_nickname"/>]�� ����Ͻ� �� �ִ� �г����Դϴ� </p>
			<input type="button" value="�ݱ�" onclick="setnick()" id="bu_1">
		</td>
	</tr>
</table>
</s:elseif>
</body>
</html>
