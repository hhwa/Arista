<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function aboutTeam(url,msg){
	if (confirm(msg+" �Ͻðڽ��ϱ�?") == true){    //Ȯ��
		location.href=url;
	}else{   //���
	    return;
	}
}
</script>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr>
		<td height="100"></td>
	</tr>
</table>
<table align="center" width="500">
	<s:if test="teamInfoParam == null">
			<tr height="30"><td width="300" colspan="3" align="center" style="font-size: 30px;"><b>My Team </b>�� �����ϴ�.</td></tr>
	<tr height="40"><td></td></tr>
		<tr>
			<td width="100"></td>
			<td class="bu_2" align="center" style="color:#ffffff;">
				<a href="TeamCreateForm.action">�� ���� �Ϸ�����</a>
			</td>
			<td width="100"></td>
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td width="100"></td>
			<td class="bu_2" align="center">
				<a href="TeamList.action">�� ��û �Ϸ�����</a>
			</td>
			<td width="100"></td>
		</tr>
	</s:if>

	<s:else>
	<tr height="30"><td width="500" colspan="3" align="center" style="font-size: 30px;">
		<b><s:property value="teamInfoParam.team_id"/></b>�� ���� ��� ���Դϴ�.
		</td></tr>
		<tr height="40"><td></td></tr>
		<tr>
			<td width="80"></td>
			<td class="bu_2" align="center" style="color:#ffffff;">
				<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="teamInfoParam.team_id"/>&mem_id=<s:property value="#session.session_id"/>','���� ���')">���� ���</a> &nbsp;
			</td>
			<td width="80"></td>
		</tr>
	</s:else>
	<tr height="200"><td></td></tr>
</table>

</body>
</html>