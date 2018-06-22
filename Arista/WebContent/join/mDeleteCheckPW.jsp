<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
 </head>
<body>
<form action="deleteCheck.action" method="post">
<s:hidden name="m_id" value="%{m_id}"/>

<table width="200" align="center">
   <tr><td align="center"><h2>비밀번호 확인</h2></td></tr>
   <tr height="21">
      <td align="center" colspan="0"><input class="bottom" type="password" name="m_passwd" size="24" maxlength="20" placeholder="PW" autocomplete="off"></td>
   </tr>
   <tr height="13"><td></td></tr>
   <tr height="30"><td align="center" id="bu_1"><input id="bu_1" name="submit" type="submit" value="확  인"></td></tr>
   </table>
</form>
</body>
</html>