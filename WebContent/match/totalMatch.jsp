<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ü��ġ</title>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<script type="text/javascript">
function aboutMatch(url,msg){
	if (confirm(msg+" �Ͻðڽ��ϱ�?") == true){    //Ȯ��
		location.href=url;
	}else{   //���
	    return;
	}
}
</script>
</head>
<body>

<table border="0" align="center">
	<tr>
		<td height="120"></td>
	</tr>
</table>
<s:iterator value="list" status="stat">
	
<div id="total_m" style="margin-left:200px; margin-right:200px;">
	<table align="center" border=0 width="100%">
	<s:if test="match_type eq 'Solo'">
	
		<tr align="center" bgcolor="#F3F3F3">
			<td width="80"><strong>��ġ����</strong></td>
			<td width="80"><strong>����ȣ</strong></td>
			<td width="80"><strong>�������</strong></td>
			<td width="110"><strong>�����</strong></td>
			<td width="160"><strong>�����</strong></td>
			<td width="80"><strong>�������</strong></td>
			<td width="120"><strong>���</strong></td>
			<td width="420"><strong>����</strong></td>
			<td width="100"><strong>��û�ο�</strong></td>
			<td width="100"><strong>�ִ��ο�</strong></td>
			<td width="50">&nbsp;&nbsp;</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="2" colspan="11"></td>
		</tr>
		<tr bgcolor="#FFFFFF" align="center">
			<td align="center"><s:property value="match_type"/></td>
			<td align="center"><s:property value="game_no"/></td>
			<td align="center"><s:property value="game_type"/></td>
			<td align="center"><s:property value="game_day"/></td>
			<td align="center"><s:property value="stadium"/></td>
			<td align="center"><s:property value="game_area"/></td>
			<td align="center"><s:property value="fee"/></td>
			<td align="center"><s:property value="content"/></td>
			<td align="center"><s:property value="people_count"/></td>
			<td align="center"><s:property value="people_max"/></td>
			<s:if test="#session.session_id != null">
				<td align="center">
					<s:if test="mem_id != null">
						<a href="#" onclick="aboutMatch('cancelMatch.action?match_no=<s:property value="match_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','���')">���</a>
					</s:if>
					<s:else>
						<s:if test="people_count == people_max">����</s:if>
						<s:else><a href="#" onclick="aboutMatch('joinMatch.action?match_no=<s:property value="match_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','��û')">��û</a></s:else>
					</s:else>
				</td>
			</s:if>
		</tr>
		<tr bgcolor="#777777">
			<td height="2" colspan="11"></td>
		</tr>
	</s:if>
	<s:if test="match_type eq 'Team'">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="80"><strong>��ġ����</strong></td>
			<td width="80"><strong>����ȣ</strong></td>
			<td width="80"><strong>�������</strong></td>
			<td width="110"><strong>�����</strong></td>
			<td width="160"><strong>�����</strong></td>
			<td width="80"><strong>�������</strong></td>
			<td width="120"><strong>���</strong></td>
			<td width="100"><strong>����������</strong></td>
			<td width="320"><strong>����</strong></td>
			<td width="100"><strong>HOME��</strong></td>
			<td width="100"><strong>AWAY��</strong></td>
			<td width="50">&nbsp;&nbsp;</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="2" colspan="12"></td>
		</tr>
		<tr bgcolor="#FFFFFF" align="center">
			<td align="center"><s:property value="match_type"/></td>
			<td align="center"><s:property value="game_no"/></td>
			<td align="center"><s:property value="game_type"/></td>
			<td align="center"><s:property value="game_day"/></td>
			<td align="center"><s:property value="stadium"/></td>
			<td align="center"><s:property value="game_area"/></td>
			<td align="center"><s:property value="fee"/></td>
			<td align="center"><s:property value="uniform_color"/></td>
			<td align="center"><s:property value="content"/></td>
			<td align="center"><s:property value="team_id"/></td>
			<td align="center"><s:property value="team2_id"/></td>
			<s:if test="teamInfoResult.team_admin == 1 || teamInfoResult.team_admin == 2">
				<td align="center">
					<s:if test="team2_id != null">
						<s:if test="team2_id != memParam.myteam">����</s:if>
						<s:else><s:a href="#" onclick="cancelMatch('%{cancelURL}')">���</s:a></s:else>
					</s:if>
					<s:else>
						<s:if test="team_id == memParam.myteam"></s:if>
						<s:else><s:a href="#" onclick="joinMatch('%{joinURL}')">��û</s:a></s:else>
					</s:else>
				</td>
			</s:if>
		</tr>
		<tr bgcolor="#777777">
			<td height="2" colspan="12"></td>
		</tr>
	</s:if>
	<s:if test="list.size() <= 0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="12">��ϵ� �Խù��� �����ϴ�.</td>			
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>
	</s:if>	
	</table>
	<table align="center">
		<tr bgcolor="#777777">
			<td height="10" colspan="12"></td>
		</tr>
	</table>
</div>
</s:iterator>
<br>
<div style="float:bottom; top:10px;">
<table align="center">
	<tr align="center">
		<td colspan="12"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
</table>
</div>
<table border="0" align="center">
	<tr>
		<td height="120"></td>
	</tr>
</table>
</body>
</html>