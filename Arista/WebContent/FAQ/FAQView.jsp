<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
 
  <tr>
    <td height="1" colspan="2"></td>
  </tr>
  <tr>
    <td width="70" align="center" class="bu_2">제목</td>
    <td width="3"></td>
    <td width="500" class="under_pad"><s:property value="resultClass.faq_subject" /></td>
  </tr>
  <tr height="3"><td></td></tr>
  <tr>
    <td width="70" align="center" class="bu_2">내용</td>
    <td width="3"></td>
    <td colspan="3" class="under" width="500"><pre style="white-space:pre-wrap; background-color: #fff; border: none;"><s:property value="resultClass.faq_content"/></pre></td>
  </tr>
  

</table>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr height="100"><td></td></tr>
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
    <input class="bu_2" name="list" type="button" value="  수    정  " onclick="javascript:location.href='FAQUpdateForm.action?faq_no=<s:property value="faq_no" />&currentPage=<s:property value="currentPage" />'">
      
    <input class="bu_2" name="list" type="button" value="  삭    제  " onclick="javascript:location.href='FAQDelete.action?faq_no=<s:property value="faq_no" />&currentPage=<s:property value="currentPage" />'">    
    </s:if>
   
    <input class="bu_2" name="list" type="button" value="  목    록  " onclick="javascript:location.href='FAQList.action?currentPage=<s:property value="currentPage" />'">
    </td>
  	</tr>
  	<tr height="100"></tr>
</table>

</body>
</html>