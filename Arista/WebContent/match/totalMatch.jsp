<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체매치</title>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<script type="text/javascript">
function aboutMatch(url,msg){
	if (confirm(msg+" 하시겠습니까?") == true){    //확인
		location.href=url;
	}else{   //취소
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
	<s:if test="match_type eq 'Solo'">

		<tr><td style="border-left: 2px solid #2d2d30;border-right: 2px solid #2d2d30;" class="bu_2" colspan="3" width="300"><s:property value="match_type"/> NO. <s:property value="game_no"/></td><tr>
		<tr height="150">
			<td colspan="2" align="center"><div id="Solo_border"><s:property value="people_max"/></div></td>
			<td width="150" align="center"><div id="Solo_border"><s:property value="people_count"/></div></td>
		</tr>
		<tr>
			<td class="border_side_bu" align="center" colspan="2"><b>최대인원</b></td>
			<td class="border_side_bu" align="center">신청인원<td>
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
				<font color="#FF0000">*</font> 내용<br>
			</td>
			<td colspan="2"  class="cont_si_right">
				<s:property value="game_type"/><br>
				<s:property value="game_day"/><br>
				<s:property value="stadium"/><br>
				<s:property value="game_time"/><br>
				<s:property value="game_area"/><br>
				<s:property value="fee"/>원<br>
				<s:property value="content"/><br>
			</td>
		</tr>
		<tr class="border_top">
			<td height="5" colspan="3"></td>
		</tr>
		<tr>
<%if( (actdate != null) && (actdate.getTime()>thisdate.getTime()) ) { %>		
			<s:if test="#session.session_id != null">
				<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;">
					<s:if test="mem_id != null">
						<a href="#" onclick="aboutMatch('cancelMatch.action?match_no=<s:property value="match_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','취소')">취  소</a>
					</s:if>
					<s:else>
						<s:if test="people_count == people_max">마  감</s:if>
						<s:else><a href="#" onclick="aboutMatch('joinMatch.action?match_no=<s:property value="match_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','신청')">신  청</a></s:else>
					</s:else>
				</td>
			</s:if>
			<s:else>
				<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;"></td>
			</s:else>
<%}else{ %>
			<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;"> 매치 종료</td>
<%} %>			
		</tr>
		<tr>
			<td height="25" colspan="3"></td>
		</tr>
	</s:if>
	<s:if test="match_type eq 'Team'">
		<tr><td style="border-left: 2px solid #2d2d30;border-right: 2px solid #2d2d30;" class="bu_2" colspan="3" width="300"><s:property value="match_type"/> NO. <s:property value="game_no"/></td><tr>
		<tr height="150">
			<td colspan="2" align="center"><img class="team_img" width="100" height="100" src="/Arista/team/teamIMG/<s:property value="imgMap[#stat.index]" />"></td>
			<td width="150" align="center"><img class="team_img" width="100" height="100" src="/Arista/team/teamIMG/<s:property value="imgMap[#stat.index+10]" />"></td>
		</tr>
		<tr>
			<td class="border_side_bu" align="center" colspan="2"><b><s:property value="team_id"/></b></td>
			<td class="border_side_bu" align="center">
				<s:if test="team2_id==null">대기중</s:if>
				<s:else><b><s:property value="team2_id"/></b></s:else>
			<td>
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
				<font color="#FF0000">*</font> 경기시간<br>
				<font color="#FF0000">*</font> 경기장<br>
				<font color="#FF0000">*</font> 지역<br>
				<font color="#FF0000">*</font> 비용<br>
				<font color="#FF0000">*</font> 유니폼 색상<br>
				<font color="#FF0000">*</font> 내용<br>
			</td>
			<td colspan="2"  class="cont_si_right">
				<s:property value="game_type"/><br>
				<s:property value="game_day"/><br>
				<s:property value="game_time"/><br>
				<s:property value="stadium"/><br>
				<s:property value="game_area"/><br>
				<s:property value="fee"/>원<br>
				<s:property value="uniform_color"/><br>
				<s:property value="content"/><br>
			</td>
		</tr>
	
		<tr class="border_top">
			<td height="5" colspan="3"></td>
		</tr>
		<tr height="25">
		<%if( (actdate != null) && (actdate.getTime()>thisdate.getTime()) ) { %>
			<s:if test="#session.session_id !=null">
			<s:if test="teamInfoResult.team_admin == 1 || teamInfoResult.team_admin == 2">
				<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;">
					<s:if test="team2_id != null">
						<s:if test="team2_id != memParam.myteam">마  감</s:if>
						<s:else><a href="#" onclick="aboutMatch('cancelMatch.action?match_no=<s:property value="match_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','취소')">취  소</a></s:else>
					</s:if>
					<s:else>
						<s:if test="team_id == memParam.myteam"></s:if>
						<s:else><a href="#" onclick="aboutMatch('joinMatch.action?match_no=<s:property value="match_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','신청')">신  청</a></s:else>
					</s:else>
				</td>
			</s:if>
			<s:else>
				<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;"></td>
			</s:else>
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
	</s:if>
	<s:if test="list.size() <= 0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="12">등록된 게시물이 없습니다.</td>			
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>
	</s:if>	
	</table>
</div>
</s:iterator>
<br>
<div>
<table align="center" width="90%">
	<tr height="20"><td></td></tr>
	<tr align="center">
		<td colspan="12"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
</table>
</div>
<table border="0" align="center">
	<tr>
		<td height="40"></td>
	</tr>
</table>
</body>
</html>