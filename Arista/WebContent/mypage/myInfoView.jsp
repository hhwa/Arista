<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
function open_win_noresizable (url, name){
	var oWin = window.open(url, name, 
			"scrollbars=no,status=no,resizable=no,width=300,height=150");
}
</script>
</head>
<body>
<center>
<br><br><br><br><br><br>
<table width="400">
<h5>
	<tr>
		<td width=30% height="40"><b>���̵�</b> </td>
		<td width=70%><s:property value="memParam.m_id"/></td>
	</tr>
	
	<tr>
		<td width=30% height="40"><b>�̸�</b> </td>
		<td width=70%> <s:property value="memParam.m_name"/></td>
	</tr>
	<tr>
		<td width=30% height="40"><b>�г���</b> </td>
		<td width=70%> <s:property value="memParam.m_nickname"/></td>
	</tr>
	<tr>	
		<td width=30% height="40"><b>����</b> </td>
		<td width=70%> <s:property value="memParam.m_mobilephone"/></td>
	</tr>
	<tr>
		<td width=30% height="40"><b>�������</b> </td>
		<td width=70%> <s:property value="memParam.m_birthyear"/></td>
	</tr>
	<tr>
		<td width=30% height="40"><b>����</b> </td>
		<td width=70%> <s:property value="memParam.m_region"/></td>
	</tr>
	<tr>
		<td width=30% height="40"><b>�̸���</b> </td>
		<td width=70%> <s:property value="memParam.m_email"/></td>
	</tr>
	<tr>
		<td width=30% height="40"><b>������</b> </td>
		<td width=70%> <s:property value="memParam.m_position"/></td>
	</tr>
	<tr>
		<td width=30% height="40"><b>����</b> </td>
		<td width=70%> <img src="<s:property value='memParam.prof_image_save'/>"></td>
	</tr>
	<tr>
		<td width=30% height="40"><b>������</b> </td>
		<td width=70%> <s:property value="memParam.m_joindate"/></td>
	</tr>
</h5>	
</table>

<br><br>
<table>
<tr>
	<td align="center" width=100 bgcolor="red" ><a href="modiftyMemberForm.action">��  ��</a></td>
	
	<td width=100></td>
	<td align="center" width=100 bgcolor="red">
		<a href="#" onclick="javascript:open_win_noresizable('deleteMemberPW.action?m_id=<s:property value="memParam.m_id"/>','delete')">Ż  ��</a>
	</td> 
</table>
</center>

</body>
</html>