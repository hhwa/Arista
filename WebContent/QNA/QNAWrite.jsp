<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A</title>

<script type="text/javascript">
function validation(){
	var frm = document.forms(0);
	
	if(frm.qna_subject.value == ""){
		alert("제목을 입력해주세요.");
		return false;
	} else if(frm.qna_id.value == ""){
		alert("이름을 입력해주세요.");
		return false;
	} else if(frm.qna_password.value == ""){
		alert("비밀번호를 입력하세요.");
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
    <td align="center"><h2>Q&A</h2></td>
  </tr>
  <tr>
    <td height="30"></td>
  </tr>

</table>

  <s:if test="reply">
    <form action="QNAReply.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
      <s:hidden name="ref" value="%{resultClass.ref }"/>
      <s:hidden name="re_step" value="%{resultClass.re_step }"/>
      <s:hidden name="re_level" value="%{resultClass.re_level }"/>
  </s:if>
  
  <s:elseif test="resultClass == NULL">
    <form action="QNAWrite.action" method="post" enctype="multipart/form-data" 
    onsubmit="return validation();">
  </s:elseif>

  <s:else>
    <form action="QNAUpdate.action" method="post" enctype="multipart/form-data">
    <s:hidden name="qna_no" value="%{resultClass.qna_no}" />
    <s:hidden name="currentPage" value="%{currentPage}"/>
  </s:else>
  
    
  <table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td width="100">제목</td>
      <td width="500">
        <s:textfield name="qna_subject" theme="simple" value="%{resultClass.qna_subject}"
        cssStyle="width:370px" maxlength="50"/>
      </td>
    </tr>

    <tr>
      <td>이름</td>
      <td>
      <s:if test="reply">${session.session_id}</s:if>
      <s:elseif test="#{session.session_id != null }">${resultClass.qna_id}</s:elseif>
      <s:elseif test="writeCheck == 0">${session.session_id}
      </s:elseif>
      <s:elseif test="writeCheck == 1">${resultClass.qna_id}
      </s:elseif>
            
      </td>
    </tr>
    <%-- <s:if test="#session.session_id != null"><%= session.getAttribute("session_id") %></s:if> --%>
<%-- s:if로 조건주고 getAttribute로 가져와도 되고, ${ }식 써서 값을 가져올수있다. 두가지방법 --%>
    <tr>
      <td>비밀번호</td>
      <td>
        <s:textfield name="qna_password" theme="simple" value="%{resultClass.qna_password}" maxlength="20"/>
      </td>
    </tr>

    <tr>
      <td>내용</td>
      <td>
        <s:textarea name="qna_content" theme="simple" value="%{resultClass.qna_content}" cols="50" rows="10"/>
      </td>
    </tr>
  </table>
  
  <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">      
    <tr>
      <td height="10" colspan="2"></td>
    </tr>
    
    <tr>
      <td align="right" colspan="2">
        <input name="submit" type="submit" value="작성완료">
        <input name="list" type="button" value="목록" 
        onClick="javascript:location.href='QNAList.action?currentPage=<s:property value="currentPage" />'">
      </td>
    </tr>
  </table>
</body>
</html>