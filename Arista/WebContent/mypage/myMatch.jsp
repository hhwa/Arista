<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
			<font color="#FF0000">*</font> 경기시간<br>
			<font color="#FF0000">*</font> 경기장<br>
			<font color="#FF0000">*</font> 지역<br>
			<font color="#FF0000">*</font> 비용<br>
			<font color="#FF0000">*</font> 내용<br>
		</td>
		<td colspan="2"  class="cont_si_right">
		<s:property value="game_type"/><br>
		<s:property value="game_day"/><br>
		<s:property value="game_time"/><br>
		<s:property value="stadium"/><br>
		<s:property value="game_area"/><br>
		<s:property value="fee"/><br>
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
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="11">등록된 게시물이 없습니다.</td>			
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="11"></td>
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