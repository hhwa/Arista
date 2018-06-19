<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
input.bottom {
   display:black;
   border: none;
   border-bottom: 1px solid #000000;
   width: 180px;
   border-color: #000000;
   /*font-family: 'Lucida Handwriting', serif;*/
}
#noImage{
   background-image: url('/Arista/mypage/image/noImage.jpg');
   background-size:100%;
   padding: 160px 0px 0px 0px;
}
</style>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" charset="EUC-KR">
function checkIt(){
	var nickExp = /[~!@\#$%<>^&*\()\-=+_\��]/gi;
	var emailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var phoneExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
		
	var pw = userinput.m_passwd.value
	var nick = document.userinput.m_nickname.value;
	var nick2 = document.userinput.m_nickname2.value;
	var mail = document.userinput.m_email.value; 
	var mail2 = document.userinput.m_email2.value; 
	
	 if(pw.length<8||pw.length>20){
		 alert("��й�ȣ�� 8�ڸ� ~20�ڸ� �̳��� �Է����ּ���.");
			  return false;
	 }
		 
	 if(pw.search(/\s/) != -1){
		  alert("��й�ȣ�� ���� ���� �Է����ּ���.");
			  return false;
		 } 
	 
	 if(pw != userinput.m_passwd2.value){
		 alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
		 return false;
	 }
	 
	 
	 if(nick == "" || nick==null) {
			alert("�г����� �Է����ּ���.")
			return false;
		}
	 
	 if(nick.search(/\s/) != -1) {
			alert("�г��ӿ� ������ ����Ͻ� �� �����ϴ�.")
			return false;
		}
	 
	 if(nickExp.test(nick)){
		 alert("�г��ӿ� Ư�����ڸ� ����Ͻ� �� �����ϴ�.")
		 return false;
	 }
	
		 
	 if(!phoneExp.test(document.userinput.m_mobilephone.value)){
		 alert("�޴��� ��ȣ�� ���Ŀ� �°� �Է����ּ���.")
		 return false;
	 }
	 
	 if(document.userinput.m_region.value =="����"){
		 alert("������ �������ּ���.");
		 return false;
	 }
	 
	 
	 if(!emailExp.test(mail)){
		 alert("�̸��� ���Ŀ� �°� �Է����ּ���.");
		return false;
	 }
	
	 
	 if(userinput.nickchecked.value == 0 && nick != nick2){
		 alert("�г��� �ߺ�üũ�� ���ּ���.");
		 return false;
	 } 
	 
	 if(userinput.emailchecked.value == 0 && email != email2){
		 alert("�̸��� �ߺ�üũ�� ���ּ���.");
		 return false;
	 } 
	 
}
function openConfirmnick(userinput) {
	var regExp2 = /[~!@\#$%<>^&*\()\-=+_\��]/gi;
	var m_nickname = document.userinput.m_nickname.value;

	if(m_nickname == "" || m_nickname==null){
		alert("�г����� �Է����ּ���.")
		return false;
	}
	
	if(m_nickname.search(/\s/) != -1) {
		alert("�г��ӿ� ������ ����Ͻ� �� �����ϴ�.")
		return false;
	}
	
	if(regExp2.test(m_nickname)){
		alert("�г��ӿ� Ư�����ڸ� ����Ͻ� �� �����ϴ�. (2�� �̻�)")
		return false;
	}
	

url = "memberNickCheck.action?m_nickname="+m_nickname;
open(url, "confirm2", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
}

function openConfirmemail(userinput) {
	var regExp3 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var m_email = userinput.m_email.value;

	
	if(!regExp3.test(m_email)){
		alert("�̸��� ���Ŀ� �°� �Է����ּ���.")
		return false;
	}


url = "memberEmailCheck.action?m_email="+m_email;
open(url, "confirm3", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
}



</script>
</head>
<body>
<s:form method="post" action="modiftyMemberPro" name="userinput" enctype="multipart/form-data" onsubmit="return checkIt();">
	<s:hidden name="prof_image_save" value="%{memberResult.prof_image_save}"/>
	<s:hidden name="m_id" value="%{memberResult.m_id}"/>
	<input type="hidden" name="nickchecked" value="0"/>
	<input type="hidden" name="emailchecked" value="0"/>
	<input type="hidden" name="m_email2" value="<s:property value="memberResult.m_email"/>"/>
	<input type="hidden" name="m_nickname2" value="<s:property value="memberResult.m_nickname"/>"/>
	
	<table align="center">
   <tr height="50" ><td></td></tr>
      <tr height="40">
         <td width="140"><b>���̵� <font color="#FF0000">*</font></b></td>
         <td width="190" id="bu_in">
            <s:property value="memberResult.m_id"/>
         </td>
      </tr>
      <tr height="40">
         <td><b>��й�ȣ <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="password" name="m_passwd" size="20" placeholder="�� 8�� �̻� �Է�">
            </td>
      </tr>
      <tr height="40">
         <td><b>��й�ȣ Ȯ��  <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="password" name="m_passwd2" size="20">
         </td>
      </tr>
      <tr height="40">
         <td><b>�̸�  <font color="#FF0000">*</font></b></td>
         <td id="bu_in">
            <s:property value="memberResult.m_name"/>
         </td>
      </tr>
      <tr height="40">
         <td><b>�г���  <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="text" name="m_nickname" maxlength="15" size="20" value="<s:property value="memberResult.m_nickname"/>">
         </td>
         <td>
            <input id="bu_1" type="button" name="check_nick" value="  �г��� �ߺ�Ȯ��  " OnClick="openConfirmnick(this.form)">
         </td>
      </tr>   
      <tr height="40">
         <td><b>������  <font color="#FF0000">*</font></b></td>
         <td>
         <s:property value="memberResult.m_position"/> &nbsp;>&nbsp;
         <s:if test="posiList != null">
               <select name="m_position">
                  <s:iterator value="posiList">
                     <option value="<s:property/>"><s:property/></option>
                  </s:iterator>
               </select>
            </s:if>
            </td>
      </tr>
      <tr height="40">
         <td><b>�޴��� ��ȣ  <font color="#FF0000">*</font></b></td>
         <td>
            <input type="text" name="m_mobilephone" size="20" maxlength="11" value="<s:property value="memberResult.m_mobilephone"/>"> 
         </td>
         
      </tr>      
                  
      <tr height="40">
         <td><b>����  <font color="#FF0000">*</font></b></td>
         <td>
            <s:if test="areaList != null">
               <select name="m_region">
                  <s:iterator value="areaList">
                     <option value="<s:property/>"><s:property/></option>
                  </s:iterator>
               </select>
            </s:if>
         </td>
      </tr>
      <tr height="40">
         <td><b>�������  <font color="#FF0000">*</font></b></td>
         <td><s:property value="memberResult.m_birthyear"/></td>
      </tr>
      <tr height="40">
      <td><b>�̸���  <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="text" name="m_email" size="30" value="<s:property value="memberResult.m_email"/>">
         </td>
         <td>
            <input id="bu_1" type="button" name="email_nick" value="  �̸��� �ߺ�Ȯ��   " OnClick="openConfirmemail(this.form)">
         </td>
      </tr>
      
      <tr height="160">
         <td><b>�����ʻ���</b></td>
            <td width="130" rowspan="4" align="center">
            <img width="160" height="160" src="/Arista/profUpload/<s:property value='memberResult.prof_image_save'/>">
            <%-- <img width="160" height="160" src="/Arista/admin/member/profUpload/<s:property value="memParam.prof_image_save"/>"> --%>
      </td>
   	</tr>
   <tr>
    <td colspan="2"><b>�����ʻ��� ����</b>
         <s:file name="upload" theme="simple"/></td>   
   </tr>
      </table>
      <table align="center">         
      <tr height="60">
         <td align="center">
            <input id="bu_1" type="submit" name="confirm" value="        �� ��        ">&nbsp;&nbsp;&nbsp;
            <input id="bu_1" type="button" value="     �ǵ�����     " onclick="javascript:window.location='modiftyMemberForm.action?m_id=<s:property value="memberResult.m_id"/>'">&nbsp;&nbsp;&nbsp;
            <input id="bu_1" type="button" value="        ��  ��        " onclick="javascript:window.location='mypage.action'">
         </td>
      </tr>   
      <tr height="40"><td></td></tr>      
   </table>

	</s:form>


</body>
</html>