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

<table width="100%" height="800" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td height="100" colspan="3" >
	<tiles:insertAttribute name="header"/>
	</td>
</tr>
<tr>
	<td valign="top" width="15%" ><tiles:insertAttribute name="menu"/></td>
	<td valign="top" width="70%" ><tiles:insertAttribute name="body"/></td>
	<td valign="top" width="15%" ><tiles:insertAttribute name="right"/></td>
</tr>
<tr>
	<td height="100" colspan="3" >
	<tiles:insertAttribute name="footer"/>
	</td>
</tr>	
</table>
</body>
</html>