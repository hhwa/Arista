<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>My Team</title>
</head>
<body>
	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td><h2>My Team</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td><h3>My Team�� �����ϴ�.</h3></td>
  		</tr>
 	</table>
 	
 	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">	
 		<tr>
 			<!-- <td><a href="http://localhost:8080/Arista/team/makeTeam.jsp">�� ���� �ϱ�</a></td> -->
  			<td><input name="list" type="button" value="�� ���� �ϱ�" class="inputb" onClick="javascript:location.href='http://localhost:8080/Arista/team/makeTeam.jsp'"></td>
  		</tr>
  		
  		<tr>
  			<td height="20"></td>
  		</tr>
  		
  		<tr>
  			<td><input name="list" type="button" value="�� ��û ���" class="inputb" onClick="javascript:location.href='teamlistAction.action?currentPage=<s:property value="currentPage" />'"></td>
		</tr>
	</table>
  	
</body>
</html>