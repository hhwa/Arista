<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>

</head>
<body>

<h2>비밀번호 확인</h2>

<form action="QNACheckAction.action" method="post">
<s:hidden name="qna_no" value="%{qna_no}" />
<s:hidden name="currentPage" value="%{currentPage}" />
<s:hidden name="adminYN" value="%{adminYN}" />
<s:hidden name="qna_id" value="%{qna_id}" />
<s:hidden name="writeCheck" value="1" />
<table width="250" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="1" colspan="2"></td>
  </tr>
  
  <tr>
    <td width="100"> 비밀번호 입력<s:property value="adminYN" /></td>
    <td width="150">
    &nbsp;&nbsp;<s:textfield name="qna_password" theme="simple" cssStyle="width:100px" maxlength="20"/>
    &nbsp;&nbsp;<input name="submit" type="submit" value="확인">
    </td>
  </tr>
  
  <tr>
    <td height="1" colspan="2"></td>
  </tr>
</table>
</form>
</body>
</html>