<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FAQ</title>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center"><h2>FAQ</h2></td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>

<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
  <tr align="center">
    <td width="50">NO</td>
    <td align="left" width="350">&nbsp;&nbsp;제목</td>
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
<tr align="center">
  <td><s:property value="faq_no"/></td>
  <td align="left">&nbsp;&nbsp;<s:a href="%{viewURL}"><s:property value="faq_subject" /></s:a></td>
</tr>  
<tr>
  <td height="1" colspan="5"></td>
</tr>
  
</s:iterator>  
  
<s:if test="list.size() <= 0">
  
  <tr align="center">
    <td colspan="5">등록된 게시물이 없습니다.</td>
  </tr>
  
</s:if>  
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
<tr align="center">
  <td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
</tr>

<tr>
  <td colspan="5">
  </td>
</tr>
<s:if test="#session.session_adminYN eq 1">
<tr align="right">
  <td colspan="5">
  <input type="button" value="글쓰기" onClick="javascript:location.href='FAQWriteForm.action?currentPage=<s:property value="currentPage" />';">
  </td>
</tr>
</s:if>

</table>
</body>
</html>