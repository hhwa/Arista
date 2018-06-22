<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr>
		<td height="40"></td>
	</tr>
</table>
<s:iterator value="list" status="stat">
		<s:url id="viewURL" action="matchState">
			<s:param name="game_no">
				<s:property value="game_no"/>
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage"/>			
			</s:param>
		</s:url>

<div style="margin-left:20%; margin-right:20%;">
	<table align="center" style="width:30%; float:left; margin-left:10px; margin-right:10px;" >
	
	
	<tr><td style="border-left: 2px solid #2d2d30;border-right: 2px solid #2d2d30;" class="bu_2" colspan="3" width="300">NO. <s:property value="game_no"/></td><tr>
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
		<s:property value="fee"/><br>
		<s:property value="uniform_color"/><br>
		<s:property value="content"/><br>
		</td>
	</tr>
			<tr class="border_top">
		<td height="5" colspan="3"></td>
	</tr>
	<tr>
		<td height="25" colspan="3"></td>
	</tr>		
	
</table>
</div>
</s:iterator>

<s:if test="list.size() <= 0">
<table align="center">
	<tr height="100"></tr>	
	<tr >
		<td class="under" style="width:300px;" colspan="11">등록된 게시물이 없습니다.</td>			
	</tr>
	
	</table>
</s:if>	

<table align="center" width="90%">
<tr height="100"></tr>
	<tr align="center">
		<td colspan="11"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
	<tr height="100"></tr>
</table>
</body>
</html>