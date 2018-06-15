<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	������
	<a href="TeamList.action">�ٸ� �� ���</a>
	<div align="left">
		<table width="600" border="0" cellspacing="0" cellpadding="2">
			<tr align="center" bgcolor="#F3F3F3">
				<td width="50"><strong>����</strong></td>
				<td width="50"><strong>��������</strong></td>
				<td width="50"><strong>����</strong></td>
				<td width="70"><strong>������</strong></td>
				<td width="100"><strong>�� �������</strong></td>
				<td width="70"><strong>��տ���</strong></td>
				<td width="70"><strong>��սǷ�</strong></td>
				<td width="70"><strong>�� �ο���</strong></td>
				<td width="70"><strong>�� �Ұ�</strong></td>
				<td width="70"><strong>�� ��ũ</strong></td>
			</tr>

			<tr align="center">
				<td width="50"><strong><s:property value="%{resultClass.team_id}" /></strong></td>
				<td width="50"><strong><s:property value="%{resultClass.team_master}" /></strong></td>
				<td width="50"><strong><s:property value="resultClass.team_area" /></strong></td>
				<td width="70"><strong><s:property value="%{resultClass.team_type}" /></strong></td>
				<td width="100"><strong><s:property	value="resultClass.team_fieldtype" /></strong></td>
				<td width="70"><strong><s:property value="resultClass.team_age" /></strong></td>
				<td width="70"><strong><s:property value="resultClass.team_skill" /></strong></td>
				<td width="70"><strong><s:property value="resultClass.team_count" /></strong></td>
				<td width="70"><strong><s:property value="resultClass.team_intro" /></strong></td>
				<td width="70"><strong><img width="200" height="200" src="team/teamIMG/<s:property value="resultClass.file_savname" />"></strong></td>
			</tr>
			<tr>
				<td><input type="button" value="�� ���� ����" onclick="aboutTeam('TeamModifyForm.action?team_id=<s:property value="%{resultClass.team_id}"/>','�� ������ ����')"></td>
				
			</tr>
		</table>

		<br>

		<br>
	</div>
	<br>
	<div align="right">
		�� ȸ�� ���
		<table width="600" border="0" cellspacing="0" cellpadding="2">
			<tr align="center" bgcolor="#F3F3F3">
				<td>ȸ�� ���̵�</td>
				<td>ȸ�� �̸�</td>
				<td>�� ������</td>
				<td colspan="3">ȸ��</td>
			</tr>
			<s:iterator value="teamMemberList" status="stat">
			
				<tr>
					<td><s:property value="mem_id" /></td>
					<td><s:property value="m_name" /></td>
					<td><s:property value="m_position" /></td>
					<s:if test="team_admin == 2">
						<td>������</td>
					</s:if>
					<s:if test="team_admin == 1">
						<td>������</td>
					</s:if>
					<s:if test="team_admin == 0">
						<td>ȸ��</td>
					</s:if>
					<s:if test="teamInfoParam.team_admin == 2">
						<s:if test="team_admin!=2">
						<td>
						<form action="changeTeamAdmin.action" method="post">
							<s:hidden name="mem_id" value="%{mem_id}"/>
							<s:hidden name="team_id" value="%{resultClass.team_id}"/>
							<select name="team_admin">
								<option value="0">ȸ��</option>
								<option value="1">������</option>
							</select>
							<input type="submit" value="����"/>
						</form>
						</td>
						<td>
							<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="team_id"/>&mem_id=<s:property value="mem_id"/>','����')">����</a>
						</td>
						</s:if>
					</s:if>
				</tr>
			</s:iterator>
			<tr>
				<s:if test="%{resultClass.team_master} == #session.session_id">
				<td>
				<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="team_id"/>&mem_id=<s:property value="#session.session_id"/>','Ż��')">�� Ż���ϱ�</a>
				</td>
				</s:if>
			</tr>
		</table>
	</div>
	<s:if test="teamInfoParam.team_admin == 1 || teamInfoParam.team_admin == 2">
		<div align="right">
			���� �����
			<table width="600" border="0" cellspacing="0" cellpadding="2">
				<tr align="center" bgcolor="#F3F3F3">
					<td>ȸ�� ���̵�</td>
					<td>ȸ�� �̸�</td>
					<td>�� ������</td>
					<td>���԰���</td>
				</tr>
				<s:iterator value="teamJoinList" status="stat">
					<tr>
						<td><s:property value="mem_id" /></td>
						<td><s:property value="m_name" /></td>
						<td><s:property value="m_position" /></td>
						<td>
						<a href="#" onclick="aboutTeam('teamJoinAgree.action?team_id=<s:property value="resultClass.team_id"/>&mem_id=<s:property value="mem_id"/>','����')">���Խ���</a>
						&nbsp;/&nbsp;
						<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="resultClass.team_id"/>&mem_id=<s:property value="mem_id"/>','����')">���԰���</a>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
		
	</s:if>
</body>
</html>