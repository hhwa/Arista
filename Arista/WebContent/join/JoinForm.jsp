<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<script language="javaScript">
	function checkIt(){
		var useinput = eval("document.userinput");
		var id = userinput.m_id.value
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var re = /[~!@\#$%^&*\()\-=+_']/gi;
		if(!id) {
			alert("ID�� �Է��ϼ���");
			return false;
		}
	/* 	else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
            alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�.");
            return false;
		}  */
		
		if(!userinput.m_passwd.value) {
			alert("��й�ȣ�� �Է��ϼ���");
			return false;
		}
		
		if(userinput.m_passwd.value != userinput.passwd2.value)
		{
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
			return false;
		}
		
		if(!userinput.m_name.value) {
			alert("����� �̸��� �Է��ϼ���");
			return false;
		}
		if (!isNaN(userinput.m_name.value))	{
			alert("����� �̸��� ���ڷ� �Է��ϼ���");
		
			return false;
		}
		
		
		if(!userinput.m_nickname.value) {
			alert("�г����� �Է��ϼ���");
			return false;
		}
		else if(re.test(userinput.m_nickname.value)){
			alert("�г��� ������ �ùٸ��� �ʽ��ϴ�.");
			return false;
		}
		
		if(!userinput.m_mobilephone.value) {
			alert("�޴�����ȣ�� �Է��ϼ���");
			return false;
		}
			
		if (isNaN(userinput.m_mobilephone.value))	{
			alert("�޴��� ��ȣ�� '-'�� ������ ���ڷ� �Է��ϼ���");
			return false;
		}
		
		if(!userinput.m_region.value) {
			alert("�������� �Է��ϼ���");
			return false;
		}
		
		if(!userinput.m_birthyear.value) {
			alert("�������� �Է��ϼ���");
			return false;
		}
		
		if(isNaN(userinput.m_birthyear.value)) {
			alert("�������� ���ڷ� �Է��ϼ���");
			return false;
		}
		
		if(!userinput.m_email.value) {
			alert("�̸����� �Է��ϼ���");
			return false;
		}
		else if(exptext.test(userinput.m_email.value)==false){
			alert("�̸��� ������ �ùٸ��� �ʽ��ϴ�.");
		return false;
		}
	    }
	
	 // ���̵� �ߺ�üũ â ����
	function openConfirmid(userinput) {
		var id = userinput.m_id.value
		if(id == ""){
			alert("���̵� �Է��ϼ���");
			return;
		}
		 else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
             alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�.");
             return false;
         }
	
	//url�� ����� �Է� id�� �����մϴ�.	
	url = "memberIdCheck.action?m_id="+id;
	//url = "<s:url action='memberIdCheck.action'/>"+"?m_ID="+id;
	//���ο� �����츦 ���ϴ�.
	open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	 
	function openConfirmnick(userinput) {
		var re = /[~!@\#$%^&*\()\-=+_']/gi;
		var m_nickname = userinput.m_nickname.value
		if(m_nickname == ""){
			alert("�г����� �Է��ϼ���");
			return;
		}
		else if(re.test(userinput.m_nickname.value)){
			alert("�г��� ������ �ùٸ��� �ʽ��ϴ�.");
			return false;
		}
		
	
	url = "memberNickCheck.action?m_nickname="+m_nickname;
	open(url, "confirm2", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	
	function openConfirmemail(userinput) {
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var m_email = userinput.m_email.value
		if(m_email == ""){
			alert("�̸����� �Է��ϼ���");
			return;
		}
		else if(exptext.test(m_email)==false){
			alert("�̸��� ������ �ùٸ��� �ʽ��ϴ�.");
		return false;
		}
		
	
	url = "memberEmailCheck.action?m_email="+m_email;
	open(url, "confirm3", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	
</script>
</head>

<body>

<s:form method="post" action="MemberJoinAction" name="userinput" enctype="multipart/form-data">
	<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
		<tr>
			<td colspan="2" height="39" align="center" >
				<font size="+1"><b>ȸ������</b></font></td>
		</tr>
		<tr>
			<td width="200"><b>���̵� �Է�</b></td>
			<td width="400"></td>
		</tr>
		<tr>
			<td width="200"> ����� ID </td>
			<td width="400">
				<input type="text" name="m_id" size="10" maxlength="12">
				<input type="button" name="check_id" value="ID�ߺ�Ȯ��" OnClick="openConfirmid(this.form)">
		</tr>
		<tr>
			<td width="200">��й�ȣ</td>
			<td width="400">
				<input type="password" name="m_passwd" size="15" maxlength="12">
			</td>
		</tr>
		<tr>
			<td width="200">��й�ȣ Ȯ��</td>
			<td width="400">
				<input type="password" name="passwd2" size="15" maxlength="12">
			</td>
		</tr>				
		<tr>
			<td width="200"><b>�������� �Է�</b></td>
			<td width="400"> </td>
		</tr>
		<tr>
			<td width="200">�̸�</td>
			<td width="400">
				<input type="text" name="m_name" size="15" maxlength="10">
			</td>
		</tr>
		<tr>
			<td width="200">�г���</td>
			<td width="400">
				<input type="text" name="m_nickname" size="15" maxlength="10">
				<input type="button" name="check_nick" value="�г��� �ߺ�Ȯ��" OnClick="openConfirmnick(this.form)">
			</td>
		</tr>

			<tr>
			<td width="200">������</td>
			<td width="400">
			<select name="m_position">
			<option selected="selected">����</option> 
			<option>LWF</option>
			<option>ST</option>
			<option>RWF</option>
			<option>LWM</option>
			<option>CAM</option>
			<option>CM</option>
			<option>CDM</option>
			<option>CB</option>
			<option>LB</option>
			<option>LWB</option>
			<option>RB</option>
			<option>RWB</option>
			<option>GK</option>
			</select>
			<font color="red" size="2">���������� �������ּ���.</font>
			</td>
		</tr>
		
		<tr>
			<td width="200">�޴��� ��ȣ</td>
			<td width="400">
				<input type="text" name="m_mobilephone" size="11"> <font size="2">����)01011111111</font>
				
			</td>
		</tr>				
		<tr>
			<td width="200">����</td>
			<td width="400">
				<input type="text" name="m_region" size="20">
			</td>
		</tr>
		<tr>
			<td width="200">������</td>
			<td width="400">
				<input type="text" name="m_birthyear" size="10">
			<font size="2">����)1990</font></td>
		</tr>
		<tr>
			<td width="200">�̸���</td>
			<td width="400">
				<input type="text" name="m_email" size="30">
				<input type="button" name="email_nick" value="�̸��� �ߺ�Ȯ��" OnClick="openConfirmemail(this.form)">
				
			</td>
		</tr>
		

		<tr>
			<td>�����ʻ���</td>
			<td>
			<s:file name="upload" theme="simple"/>
			
			</td>	
		</tr>				
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="confirm" value="�� ��" onclick="return checkIt()">
				<input type="reset" name="reset" value="�ٽ� �Է�">
				<input type="button" value="���" onclick="javascript:window.location='loginForm.jsp'">
			</td>
		</tr>			
	</table>
	</s:form>
</body>
</html>