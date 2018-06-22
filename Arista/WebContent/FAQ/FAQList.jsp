<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">
<title>FAQ</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center"></td>
  </tr>
  <tr>
    <td height="100"></td>
  </tr>

</table>
<table width="600" cellspacing="0" cellpadding="0" align="center">
  <tr align="center">
    <td height="25" width="70" class="bu_2">NO</td>
    <td width="3"></td>
    <td align="center" class="bu_2">제목</td>
  </tr>
  
<s:iterator value="list" status="stat">
  <s:url id="viewURL" action="FAQView">
    
    <s:param name="faq_no">
      <s:property value="faq_no"/>
    </s:param>
    
    <s:param name="currentPage">
      <s:property value="currentPage"/>
    </s:param>
    
  </s:url> 
  	<tr>
  		<td height="5"></td>
	</tr> 
	<tr align="center">
  		<td height="25"><s:property value="faq_no"/></td>
  		<td width="3"></td>
  		<td align="left" style="padding:0px 0px 0px 25px;"><s:a href="%{viewURL}"><s:property value="faq_subject" /></s:a></td>
	</tr>  
	<tr>
  		<td height="1" colspan="3"></td>
	</tr>
	<tr style="background-color: #2d2d30;"><td height="1" colspan="3"></td></tr>
  
</s:iterator>  
  
<s:if test="list.size() <= 0">
  
  <tr align="center">
    <td colspan="5">등록된 게시물이 없습니다.</td>
  </tr>
  
</s:if>  
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr><td height="20"></td></tr>
	
	<s:if test="#session.session_adminYN eq 1">
	<tr>
		<td colspan="2" ></td>
		<td class="bu_2"  align="center" width="100" height="25">
  			<input type="button" style="width:125px; height:25px;" value="글쓰기" onClick="javascript:location.href='FAQWriteForm.action?currentPage=<s:property value="currentPage" />';">
  		</td>
	</tr>
	</s:if>
	<tr align="center">
  		<td width="100"></td>
  		<td><s:property value="pagingHtml" escape="false" /></td>
  		<td width="100"></td>
	</tr>
	<tr height="100"></tr>
</table>
</body>
</html>