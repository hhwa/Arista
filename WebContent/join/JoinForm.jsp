<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/>
<title>ȸ������</title>
<script src="./join/joinForm.js" type="text/javascript">
</script>
</head>
<body>
<s:form method="post" action="MemberJoinAction" name="userinput" enctype="multipart/form-data" onsubmit="return checkIt();">
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
				<input type="password" name="m_passwd" size="20">
			</td>
		</tr>
		<tr>
			<td width="200">��й�ȣ Ȯ��</td>
			<td width="400">
				<input type="password" name="passwd2" size="20">
			</td>
		</tr>				
		<tr>
			<td width="200"><b>�������� �Է�</b></td>
			<td width="400"> </td>
		</tr>
		<tr>
			<td width="200">�̸�</td>
			<td width="400">
				<input type="text" name="m_name" size="15" maxlength="15">
			</td>
		</tr>
		<tr>
			<td width="200">�г���</td>
			<td width="400">
				<input type="text" name="m_nickname" size="15" maxlength="15">
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
				<input type="text" name="m_mobilephone" size="11"> <font size="2">����)010-1111-1111</font>
				
			</td>
		</tr>				
		<tr>
			<td width="200">����</td>
			<td width="400">
				<!-- <input type="text" name="m_region" size="20"> -->
				<select name="m_region"><option value="����">����</option>
								<option value="����">����</option>
								<option value="��⵵">��⵵</option>
								<option value="������">������</option>
								<option value="��û��">��û��</option>
								<option value="����">����</option>
								<option value="���">���</option>
								<option value="���ֵ�">���ֵ�</option>
							</select>
			</td>
		</tr>
		<tr>
			<td width="200">�������</td>
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
				<input type="submit" value="�� ��">
				<input type="reset" name="reset" value="�ٽ� �Է�">
				<input type="button" value="���" onclick="javascript:window.location='loginForm.action'">
			</td>
		</tr>			
	</table>
	</s:form>
</body>
</html>
