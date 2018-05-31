<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>QNA</title>

<script type="text/javascript">
function validation(){
	var frm = document.forms(0);
	
	if(frm.subject.value == ""){
		alert("������ �Է����ּ���.");
		return false;
	} else if(frm.name.value == ""){
		alert("�̸��� �Է����ּ���.");
		return false;
	} else if(frm.password.value == ""){
		alert("��й�ȣ�� �Է��ϼ���.");
		return false;
	} else if(frm.content.value == ""){
		alert("������ �Է����ּ���.");
		return false;
	}
	return true;
}
</script>
</head>

<body>

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><h2>QNA</h2></td>
  </tr>
  <tr>
    <td height="30"></td>
  </tr>

</table>

  <s:if test="reply">
    <form action="replyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
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
    
  <table width="600" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td width="100">����</td>
      <td width="500">
        <s:textfield name="qna_subject" theme="simple" value="%{resultClass.qna_subject}"
        cssStyle="width:370px" maxlength="50"/>
      </td>
    </tr>

    <tr>
      <td>�̸�</td>
      <td>
        <s:textfield name="qna_id" theme="simple" value="%{resultClass.qna_id}"
         maxlength="20"/>
      </td>
    </tr>

    <tr>
      <td>��й�ȣ</td>
      <td>
        <s:textfield name="qna_password" theme="simple" value="%{resultClass.qna_password}" maxlength="20"/>
      </td>
    </tr>

    <tr>
      <td>����</td>
      <td>
        <s:textarea name="qna_content" theme="simple" value="%{resultClass.qna_content}" cols="50" rows="10"/>
      </td>
    </tr>
  </table>
  
  <table width="600" border="0" cellspacing="0" cellpadding="0">      
    <tr>
      <td height="10" colspan="2"></td>
    </tr>
    
    <tr>
      <td align="right" colspan="2">
        <input name="submit" type="submit" value="�ۼ��Ϸ�">
        <input name="list" type="button" value="���" 
        onClick="javascript:location.href='QNAList.action?currentPage=<s:property value="currentPage" />'">
      </td>
    </tr>
  </table>
</body>
</html>