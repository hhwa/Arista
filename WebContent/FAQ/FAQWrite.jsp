<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FAQ</title>

<script type="text/javascript">
function validation(){
	var frm = document.forms(0);
	
	if(frm.faq_subject.value == ""){
		alert("제목을 입력해주세요.");
		return false;
	} else if(frm.faq_content.value == ""){
		alert("내용을 입력해주세요.");
		return false;
	}
	return true;
}
</script>
</head>

<body>

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><h2>FAQ</h2></td>
  </tr>
  <tr>
    <td height="30"></td>
  </tr>

</table>


  
  <s:if test="resultClass == NULL">
    <form action="FAQWrite.action" method="post" enctype="multipart/form-data" 
    onsubmit="return validation();">
  </s:if>

  <s:else>
    <form action="FAQUpdate.action" method="post" enctype="multipart/form-data">
    <s:hidden name="faq_no" value="%{resultClass.faq_no}" />
    <s:hidden name="currentPage" value="%{currentPage}"/>
  </s:else>
    
  <table width="600" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td width="100">제목</td>
      <td width="500">
        <s:textfield name="faq_subject" theme="simple" value="%{resultClass.faq_subject}"
        cssStyle="width:370px" maxlength="50"/>
      </td>
    </tr>


    <tr>
      <td>내용</td>
      <td>
        <s:textarea name="faq_content" theme="simple" value="%{resultClass.faq_content}" cols="50" rows="10"/>
      </td>
    </tr>
  </table>
  
  <table width="600" border="0" cellspacing="0" cellpadding="0">      
    <tr>
      <td height="10" colspan="2"></td>
    </tr>
    
    <tr>
      <td align="right" colspan="2">
        <input name="submit" type="submit" value="작성완료">
        <input name="list" type="button" value="목록" 
        onClick="javascript:location.href='FAQList.action?currentPage=<s:property value="currentPage" />'">
      </td>
    </tr>
  </table>
</body>
</html>