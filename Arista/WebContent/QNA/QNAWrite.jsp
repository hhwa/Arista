<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A</title>

<script type="text/javascript">
function validation(){
	var frm = document.forms(0);
	
	if(frm.qna_password.value == ""){
		alert("비밀번호를 입력하세요.");
		return false;
	}else if(frm.qna_subject.value == ""){
		alert("제목을 입력해주세요.");
		return false;
	} else if(frm.qna_content.value == ""){
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
  

  
  <s:if test="reply">
    <form action="QNAReply.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
      <s:hidden name="ref" value="%{resultClass.ref }"/>
      <s:hidden name="re_step" value="%{resultClass.re_step }"/>
      <s:hidden name="re_level" value="%{resultClass.re_level }"/>
  </s:if>
  
  <s:elseif test="resultClass == NULL">
    <form action="QNAWrite.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
  </s:elseif>
  
  <s:else>
    <form action="QNAUpdate.action" method="post" enctype="multipart/form-data">
    <s:hidden name="qna_no" value="%{resultClass.qna_no}" />
    <s:hidden name="currentPage" value="%{currentPage}"/>
  </s:else>
  
    
  <table width="600" cellspacing="0" cellpadding="0" align="center">

     <tr>
      <td width="150" align="center" class="bu_2">아이디</td>
      <td width="3"></td>
      <td class="under_pad">${session.session_id}</td>
    </tr>
    <tr height="3"><td></td></tr>
    
  <s:if test="#session.session_adminYN != 1">
    <tr>
      <td align="center" class="bu_2">비밀번호</td>
       <td width="3"></td>
      <td width="450" class="under_pad">
     	 <input type="password" name="qna_password" size="20" maxlength="20">
      </td>
    </tr>
  </s:if>
    
    <tr height="3"><td></td></tr>
    <tr>
      <td align="center" class="bu_2">제목</td>
       <td width="3"></td>
      <td class="under_pad">
        <s:textfield name="qna_subject" theme="simple" value="%{resultClass.qna_subject}" cssStyle="width:370px" maxlength="50"/>
      </td>
    </tr>
	<tr height="3"><td></td></tr>

    <%-- <s:if test="#session.session_id != null"><%= session.getAttribute("session_id") %></s:if> --%>
<%-- s:if로 조건주고 getAttribute로 가져와도 되고, ${ }식 써서 값을 가져올수있다. 두가지방법 --%>

    <tr>
      <td align="center" class="bu_2">내용</td>
      <td width="3"></td>
      <td>
        <s:textarea name="qna_content" theme="simple" value="%{resultClass.qna_content}" cols="70" rows="10"/>
      </td>
    </tr>
  </table>
  
  <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">      
     <tr>
      <td height="50" colspan="2"></td>
    </tr>
    
    <tr>
      <td align="right" colspan="2">
        <input class="bu_2" name="submit" type="submit" value=" 작성하기 ">
        <s:if test="resultClass == NULL">
        <input class="bu_2" name="list" type="button" value="  취    소  " onClick="javascript:location.href='QNAList.action?currentPage=<s:property value="currentPage" />'">
        </s:if>
        <s:else>
        <input class="bu_2" name="list" type="button" value="  취    소  " onClick="javascript:history.back()">
        </s:else> 

      </td>
    </tr>
    <tr height="100"></tr>
  </table>
</body>
</html>