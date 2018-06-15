<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.cont_si{
	padding: 0px 0px 0px 20px;
}
.bu_2{
	background-color: #2d2d30;
	color: #ffffff;
	padding: 3px 8px 3px 8px;
}
.bu_2 a{
	color:#ffffff;
}
.bu_2 a:hover {
	color: #ffffff;
	text-decoration: none;
}

.bu_2 a:action {
	color: #777;
	text-decoration: none;
}

.bu_2 a:link {
	color: #777;
	text-decoration: none;
}
.team_img {
	border: 3px;
	border-radius: 80px;
	-moz-border-radius: 80px;
	-khtml-border-radius: 80px;
	-webkit-border-radius: 80px;
}
</style>
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ġ���</title>
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
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr>
		<td height="40"></td>
	</tr>
</table>
<s:iterator value="list" status="stat">
<div style="margin-left:20px; margin-right:20px;">
	<table align="center" style="width:30%; float:left; margin-left:10px; margin-right:10px;" >
	
	
	<tr><td class="bu_2" colspan="11" >NO. <s:property value="game_no"/></td><tr>
	<tr height="130" >
		<td width="150" align="center"><img class="team_img" width="100" height="100" src="/Arista/team/teamIMG/<s:property value="imgMap[#stat.index]" />"></td>
		<td width="150" align="center"><img class="team_img" width="100" height="100" src="/Arista/team/teamIMG/<s:property value="imgMap[#stat.index+10]" />"></td>
	</tr>
	<tr>
		<td align="center"><b><s:property value="team_id"/></b></td>
		<td align="center">
			<s:if test="team2_id==null">�����</s:if>
			<s:else><b><s:property value="team2_id"/></b></s:else>
		</td>
	</tr>
	<tr>
		<td height="8" colspan="11"></td>
	</tr>
	<tr>
		<td style="font-size: 12px;" class="cont_si" colspan="11">
			������� : <s:property value="game_type"/><br>
			����� : <s:property value="game_day"/><br>
			����� : <s:property value="stadium"/><br>
			���� : <s:property value="game_area"/><br>
			��� : <s:property value="fee"/><br>
			������ ���� : <s:property value="uniform_color"/><br>
			���� : <s:property value="content"/><br>
		</td>
	</tr>
	<tr>
		<td height="8" colspan="11"></td>
	</tr>
	<tr>
		<s:if test="teamInfoResult.team_admin == 1 || teamInfoResult.team_admin == 2">
				<td class="bu_2" align="center" colspan="11" style="color:#ffffff;">
					<s:if test="team2_id != null">
						<s:if test="team2_id != memParam.myteam">����</s:if>
						<s:else><a href="#" onclick="aboutMatch('joinMatch.action?game_no=<s:property value="game_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','���')">���</a></s:else>
					</s:if>
					<s:else>
						<s:if test="team_id == memParam.myteam">
							<a href="#" onclick="aboutMatch('modifyTeamMatchForm.action?game_no=<s:property value="game_no"/>&currentPage=<s:property value="currentPage"/>','�� ��ġ�� ����')">��ġ����</a>&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" onclick="aboutMatch('deleteTeamMatch.action?game_no=<s:property value="game_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','�� ��ġ�� ����')">��ġ����</a>					
						</s:if>
						<s:else><a href="#" onclick="aboutMatch('cancelMatch.action?game_no=<s:property value="game_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','��û')">��û</a></s:else>
					</s:else>
				</td>
			</s:if>
	</tr>
	<tr>
		<td height="25" colspan="11"></td>
	</tr>
	</table>
	</div>
	</s:iterator>
	
<div style="margin-left:20px; margin-right:20px;">
<table align="center" style="width:30%; float:left; margin-left:10px; margin-right:10px;" >
	<s:if test="list.size() <= 0">
	
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="11">��ϵ� �Խù��� �����ϴ�.</td>			
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
	</tr>
	</s:if>
	
	</table>
</div>
<br>	

<form action="TeamMatchList.action" method="post">
<table align="center" width="90%">
	<s:if test="teamInfoResult.team_admin == 1 || teamInfoResult.team_admin == 2">
	<tr align="right">
		<td colspan="11">
			<input type="button" value="         ����ġ ����         " id="bu_1" onclick="javascript:location.href='CreateTeamMatchForm.action?currentPage=<s:property value="currentPage"/>';">
		</td>
	</tr>
	</s:if>
	<tr align="center">
		<td colspan="11"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
</table>
</form>
<br>
</body>
</html>