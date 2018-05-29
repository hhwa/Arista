<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>QNA</title>

<script type="text/javascript">
function open_win_noresizable (url, name){
	var oWin = window.open(url, name, 
			"scrollbars=no,status=no,resizable=no,width=300,height=150");
}

</script>
</head>
<body>

<table width="600" border="0" cellspaicng="0" cellpadding="2">
  <tr>
    <td align="center"><h2>QNA</h2>
  </td>
  
  <tr>
    <td height="1" colspan="2"></td>
  </tr>
  
</table>

<table width="600" border="1" cellspacing="0" cellpadding="0">

  <tr>
    <td bgcolor="#F4F4F4"> 번호</td>
    <td bgcolor="#FFFFFF">
    &nbsp;&nbsp;<s:property value="resultClass.no" />
    </td>








</body>
</html>