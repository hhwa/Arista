<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><tiles:getAsString name="title"/></title>
</head>
<body>

<table width="100%" height="800" border="1" cellpadding="0" cellspacing="0">
<tr>
<<<<<<< HEAD
	<td height="100"colspan="2">
=======
	<td height="100"colspan="2" >
>>>>>>> ec38af9665d29f54e28f4fe9046a1819fb25a640
	<tiles:insertAttribute name="header"/>
	</td>
</tr>
<tr>
<<<<<<< HEAD
	<td valign="top"><tiles:insertAttribute name="body"/></td>
</tr>
<tr>
	<td height="100" colspan="2">
=======
	
	<td valign="top" width="80%" ><tiles:insertAttribute name="body"/></td>
</tr>
<tr>
	<td height="100" colspan="2" >
>>>>>>> ec38af9665d29f54e28f4fe9046a1819fb25a640
	<tiles:insertAttribute name="footer"/>
	</td>
</tr>	
</table>
</body>
</html>