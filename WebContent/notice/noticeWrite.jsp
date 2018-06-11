<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>

<script type="text/javascript">
function validation(){
	var frm = document.forms(0);
	
	if(frm.notice_subject.value == ""){
		alert("제목을 입력해주세요.");
		return false;
	} else if(frm.notice_id.value == ""){
		alert("이름을 입력해주세요.");
		return false;
	} else if(frm.notice_content.value == ""){
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
    <td align="center"><h2>공지사항</h2></td>
  </tr>
  <tr>
    <td height="30"></td>
  </tr>

</table>



  <s:if test="resultClass == NULL">
    <form action="noticeWrite.action" method="post" enctype="multipart/form-data" 
    onsubmit="return validation();">
  </s:if>


  <s:else>
    <form action="noticeUpdate.action" method="post" enctype="multipart/form-data">
    <s:hidden name="notice_no" value="%{resultClass.notice_no}" />
    <s:hidden name="currentPage" value="%{currentPage}"/>
  </s:else>
    
  <table width="600" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td width="100">제목</td>
      <td width="500">
        <s:textfield name="notice_subject" theme="simple" value="%{resultClass.notice_subject}"
        cssStyle="width:370px" maxlength="50"/>
      </td>
    </tr>

    <tr>
      <td>이름</td>
      <td>
        <s:textfield name="notice_id" theme="simple" value="%{resultClass.notice_id}"
         maxlength="20"/>
      </td>
    </tr>

    <tr>
      <td>내용</td>
      <td>
        <s:textarea name="notice_content" theme="simple" value="%{resultClass.notice_content}" cols="50" rows="10"/>
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
        onClick="javascript:location.href='noticeList.action?currentPage=<s:property value="currentPage" />'">
      </td>
    </tr>
  </table>
  
</body>
</html>