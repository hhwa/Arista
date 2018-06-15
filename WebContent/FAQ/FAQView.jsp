<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FAQ</title>

</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  <tr>
    <td align="center"><h2>FAQ</h2>
  </td>
  
  <tr>
    <td height="20"></td>
  </tr>
  
</table>

<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
 
  <tr>
    <td height="1" colspan="2"></td>
  </tr>
  <tr>
    <td width="70">&nbsp;&nbsp;제목</td>
    <td width="500">
    &nbsp;&nbsp;<s:property value="resultClass.faq_subject" />
    </td>
  </tr>
  
  <tr>
    <td>&nbsp;&nbsp;내용</td>
    <td>
    &nbsp;&nbsp;<s:property value="resultClass.faq_content" />
    </td>
  </tr>
  

</table>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right" colspan="2">
    
      <s:url id="updateURL" action="FAQUpdate">
        <s:param name="faq_no">
          <s:property value="faq_no"/>
        </s:param>
      </s:url>
      
      <s:url id="deleteURL" action="FAQDelete">
        <s:param name="faq_no">
          <s:property value="faq_no" />
        </s:param>
      </s:url>
	<s:if test="#session.session_adminYN eq 1">
    <input name="list" type="button" value="수정" 
    onClick="javascript:location.href='FAQUpdateForm.action?faq_no=<s:property value="faq_no" />&currentPage=<s:property value="currentPage" />'">
      
    <input name="list" type="button" value="삭제" 
    onClick="javascript:location.href='FAQDelete.action?faq_no=<s:property value="faq_no" />&currentPage=<s:property value="currentPage" />'">    
    </s:if>
   
    <input name="list" type="button" value="목록" 
    onClick="javascript:location.href='FAQList.action?currentPage=<s:property value="currentPage" />'">
    </td>
  </tr>
</table>

</body>
</html>