<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>
</head>
<body>
<form action="QNACheckAction.action" method="post">
<s:hidden name="qna_no" value="%{qna_no}" />
<s:hidden name="currentPage" value="%{currentPage}" />
<s:hidden name="adminYN" value="%{adminYN}" />
<s:hidden name="qna_id" value="%{qna_id}" />
<s:hidden name="writeCheck" value="1" />
<table width="200" align="center" >
   <tr><td align="center"><h2>비밀번호 확인</h2></td></tr>
   <tr height="21">
   	<td align="center" colspan="0"><input class="bottom" type="password" name="qna_password" size="30" maxlength="20" placeholder="PW"></td>
   </tr>
   <tr height="13"><td></td></tr>
   <tr height="30"><td align="center" id="bu_1"><input id="bu_1" name="submit" type="submit" value="확  인"></td></tr>
   </table>
</form>
</body>
</html>