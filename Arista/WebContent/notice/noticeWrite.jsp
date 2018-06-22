<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
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

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center"></td>
  </tr>
  <tr>
    <td height="100"></td>
  </tr>
</table>

  <s:if test="resultClass == NULL">
    <form action="noticeWrite.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
  </s:if>

  <s:else>
    <form action="noticeUpdate.action" method="post" enctype="multipart/form-data">
    <s:hidden name="notice_no" value="%{resultClass.notice_no}" />
    <s:hidden name="currentPage" value="%{currentPage}"/>
  </s:else>
    
  <table width="600" cellspacing="0" cellpadding="0" align="center">
   
    <tr>
      <td width="80" align="center" class="bu_2">작성자</td>
      <td width="3"></td>
      <td class="under_pad">
      <s:if test="resultClass == NULL">${session.session_id}</s:if>
      <s:else>${resultClass.notice_id}</s:else>
      </td>
    </tr>
    <tr height="3"><td></td></tr>
    <tr>
      <td align="center" class="bu_2">제목</td>
      <td width="3"></td>
      <td width="500" class="under_pad">
        <s:textfield name="notice_subject" theme="simple" value="%{resultClass.notice_subject}"
        cssStyle="width:370px" maxlength="50"/>
      </td>
    </tr>

    <tr height="3"><td></td></tr>
    <tr>
      <td align="center" class="bu_2">내용</td>
      <td width="3"></td>
      <td>
        <s:textarea name="notice_content" wrap="hard" theme="simple" value="%{resultClass.notice_content}" cols="70" rows="10"/>
      </td>
    </tr>
  </table>
  
  <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">      
    <tr>
      <td height="30" colspan="2"></td>
    </tr>
    
    <tr>
      <td align="right" colspan="2">
        <input class="bu_2" name="submit" type="submit" value=" 작성하기 ">
        <input class="bu_2" name="list" type="button" value="  취    소  " onclick="javascript:location.href='noticeList.action?currentPage=<s:property value="currentPage" />'">
      </td>
    </tr>
    <tr height="100"></tr>
  </table>
  
</body>
</html>