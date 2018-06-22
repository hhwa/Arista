<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css?ver=1" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>팀매치목록</title>
<script type="text/javascript">
function aboutMatch(url,msg){
	if (confirm(msg+" 하시겠습니까?") == true){    //확인
		location.href=url;
	}else{   //취소
	    return;
	}
}

function open_win_noresizable (url, name){
	var oWin = window.open(url, name, 
			"scrollbars=no,status=no,resizable=no,width=530,height=700");
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
<div style="margin-left:20%; margin-right:20%;">
	<table align="center" style="width: 30%; float: left;margin-left:10px; margin-right:10px;">
	
<%
	String GameDay = request.getAttribute("game_day").toString();
	String GameTime = request.getAttribute("game_time").toString().substring(0 , 2);
	
	String Game = GameDay+" "+GameTime+":00";
	java.util.Date thisdate = new java.util.Date();	//오늘 날짜
	java.util.Date actdate; //스트링을 date로 저장할 변수
	actdate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(Game); 
%>	
	<tr><td style="border-left: 2px solid #2d2d30;border-right: 2px solid #2d2d30;" class="bu_2" colspan="3" width="300">NO. <s:property value="game_no"/></td><tr>
	<tr height="150" >
		<td colspan="2" align="center"><a href="javascript:open_win_noresizable('TeamView2.action?team_no=<s:property value="teamNoMap[#stat.index]"/>','team')"><img class="team_img" width="100" height="100" src="/Arista/team/teamIMG/<s:property value="imgMap[#stat.index]" />"></a></td>
		<td width="150" align="center">
			<s:if test="team2_id !=null"><a href="javascript:open_win_noresizable('TeamView2.action?team_no=<s:property value="teamNoMap[#stat.index+10]"/>','team')"></s:if>
			<s:else><a href="#"></s:else>
			<img class="team_img" width="100" height="100" src="/Arista/team/teamIMG/<s:property value="imgMap[#stat.index+10]" />">
		</a></td>
	</tr>
	<tr>
		<td class="border_side_bu" align="center" colspan="2"><b><font size="2"><s:property value="team_id"/></font></b></td>
		<td class="border_side_bu" align="center">
			<s:if test="team2_id==null"><font size="2">대기중</font></s:if>
			<s:else><b><font size="2"><s:property value="team2_id"/></font></b></s:else>
		</td>
	</tr>
	<tr>
		<td class="border_left" height="8" width="100"></td>
		<td width="50"></td>
		<td class="border_right" width="150"></td>
	</tr>
	<tr height="150">
		<td width="100" class="cont_si_left">
			<font color="#FF0000">*</font> 경기종류<br>
			<font color="#FF0000">*</font> 경기일<br>
			<font color="#FF0000">*</font> 경기장<br>
			<font color="#FF0000">*</font> 경기시간<br>
			<font color="#FF0000">*</font> 지역<br>
			<font color="#FF0000">*</font> 비용<br>
			<font color="#FF0000">*</font> 유니폼 색상<br>
			<font color="#FF0000">*</font> 내용<br>
		</td>
		<td colspan="2"  class="cont_si_right">
		<s:property value="game_type"/><br>
		<s:property value="game_day"/><br>
		<s:property value="stadium"/><br>
		<s:property value="game_time"/><br>
		<s:property value="game_area"/><br>
		<s:property value="fee"/>원<br>
		<s:property value="uniform_color"/><br>
		<s:property value="content"/><br>
		</td>
	</tr>
	<tr class="border_top">
		<td height="5" colspan="3"></td>
	</tr>
	<tr>
	<%if( (actdate != null) && (actdate.getTime()>thisdate.getTime()) ) { %>
		<s:if test="teamInfoResult.team_admin == 1 || teamInfoResult.team_admin == 2">
				<td class="bu_2" align="center" colspan="11" style="color:#ffffff;">
					<s:if test="team2_id != null">
						<s:if test="team2_id != memParam.myteam">마&nbsp;&nbsp;&nbsp;&nbsp;감</s:if>
						<s:else><a href="#" onclick="aboutMatch('cancelTeamMatch.action?game_no=<s:property value="game_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','취소')">취&nbsp;&nbsp;&nbsp;&nbsp;소</a></s:else>
					</s:if>
					<s:else>
						<s:if test="team_id == memParam.myteam">
							<a href="#" onclick="aboutMatch('modifyTeamMatchForm.action?game_no=<s:property value="game_no"/>&currentPage=<s:property value="currentPage"/>','이 매치를 수정')">매치 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" onclick="aboutMatch('deleteTeamMatch.action?game_no=<s:property value="game_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','이 매치를 삭제')">매치 삭제</a>					
						</s:if>
						<s:else><a href="#" onclick="aboutMatch('joinTeamMatch.action?game_no=<s:property value="game_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','신청')">신&nbsp;&nbsp;&nbsp;&nbsp;청</a></s:else>
					</s:else>
				</td>
			</s:if>
			<s:else>
				<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;"></td>
			</s:else>
	<%}else{ %>
		<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;">매치 종료</td>
	<%} %>
	</tr>
	<tr>
		<td height="25" colspan="3"></td>
	</tr>
	</table>
	</div>
	</s:iterator>
	
<div style="margin-left:20px; margin-right:20px;">
<table align="center" style="width:30%; float:left; margin-left:10px; margin-right:10px;" >
	<s:if test="list.size() <= 0">
	
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="3">등록된 게시물이 없습니다.</td>			
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="3"></td>
	</tr>
	</s:if>
	
	</table>
</div>
<br>	
<div style="margin-left:20%; margin-right:20%;">
<form action="TeamMatchList.action" method="post">
<table align="center" width="90%">
	<s:if test="teamInfoResult.team_admin == 1 || teamInfoResult.team_admin == 2">
	<tr align="right">
		<td colspan="11">
			<input type="button" style="height:50px; width:250px" value="         팀매치 생성         " id="bu_1" onclick="javascript:location.href='CreateTeamMatchForm.action?currentPage=<s:property value="currentPage"/>';">
		</td>
	</tr>
	</s:if>
	<tr align="center">
		<td colspan="11"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
	<tr height="100"></tr>
</table>
</form>
</div>
<br>
</body>
</html>