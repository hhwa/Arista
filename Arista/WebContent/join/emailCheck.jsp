<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̸��� �ߺ�üũ</title>
<script language="javascript">

function setemail()
 {
	opener.document.userinput.m_email.value="<s:property value='m_email'/>";
	opener.document.userinput.emailcheckresult.value="<s:property value='emailcheckresult'/>";
 	self.close();
 } 


</script>
</head>
<body>


<s:if test="emailcheckresult == 0">
<table width="500" align="center">
	<tr height="10"><td></td></tr>
	<tr>
		<td align="center"><s:property value="%{memberResult.m_email}"/>�� �̹� ������� �̸����Դϴ�.</td>
	</tr>	
	<tr height="10"><td></td></tr>	
</table>
<s:form name="checkForm" method="post" action="memberEmailCheck">
<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		�ٸ� �̸����� �Է��ϼ���.<p>
		<input type="text" size="30"  name="m_email" class="bottom" autocomplete="off">
		</td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="�̸��� �ߺ�Ȯ��" id="bu_1">
		</td>
	</tr>	
</table>
</s:form>
</s:if>
<s:elseif test="emailcheckresult == 1">

<table width="500" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<p>�Է��Ͻ� [<s:property value="m_email"/>] �� ����Ͻ� �� �ִ� �̸����Դϴ� </p>
			<input type="button" value="�ݱ�" id="bu_1" onclick="setemail()">
		</td>
	</tr>
</table>
</s:elseif>
</body>
</html>
