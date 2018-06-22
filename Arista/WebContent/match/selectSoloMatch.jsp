<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ַθ�ġ���</title>
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
		<s:url id="joinURL" action="joinSoloMatch">
		<s:param name="game_no">
			<s:property value="game_no"/>
		</s:param>
		<s:param name="mem_id">
			<s:property value="#session.session_id"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>			
		</s:param>
	</s:url>
	<s:url id="cancelURL" action="cancelSoloMatch">
		<s:param name="game_no">
			<s:property value="game_no"/>
		</s:param>
		<s:param name="mem_id">
			<s:property value="#session.session_id"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>			
		</s:param>
	</s:url>
<div style="margin-left:20%; margin-right:20%;">
	<table align="center" style="width: 30%; float: left;margin-left:10px; margin-right:10px;">

<%
	String GameDay = request.getAttribute("game_day").toString();
	String GameTime = request.getAttribute("game_time").toString().substring(0 , 2);
	
	String Game = GameDay+" "+GameTime+":00";
	java.util.Date thisdate = new java.util.Date();	//���� ��¥
	java.util.Date actdate; //��Ʈ���� date�� ������ ����
	actdate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(Game); 
%>	
	<tr><td style="border-left: 2px solid #2d2d30;border-right: 2px solid #2d2d30;" class="bu_2" colspan="3" width="300">NO. <s:property value="game_no"/></td></tr>
	<tr height="150">
		<td colspan="2" align="center"><div id="Solo_border"><s:property value="people_max"/></div></td>
		<td width="150" align="center"><div id="Solo_border"><s:property value="people_count"/></div></td>
	</tr>
	<tr>
		<td class="border_side_bu" align="center" colspan="2"><b>�ִ��ο�</b></td>
		<td class="border_side_bu" align="center">��û�ο�</td>
	</tr>
	<tr>
		<td class="border_left" height="8" width="100"></td>
		<td width="50"></td>
		<td class="border_right" width="150"></td>
	</tr>
	<tr height="150">
		<td width="100" class="cont_si_left">
			<font color="#FF0000">*</font> �������<br>
			<font color="#FF0000">*</font> �����<br>
			<font color="#FF0000">*</font> ���ð�<br>
			<font color="#FF0000">*</font> �����<br>
			<font color="#FF0000">*</font> ����<br>
			<font color="#FF0000">*</font> ���<br>
			<font color="#FF0000">*</font> ����<br>
		</td>
		<td colspan="2"  class="cont_si_right">
			<s:property value="game_type"/><br>
			<s:property value="game_day"/><br>
			<s:property value="game_time"/><br>
			<s:property value="stadium"/><br>
			<s:property value="game_area"/><br>
			<s:property value="fee"/>��<br>
			<s:property value="content"/><br>
		</td>
	</tr>
	<tr class="border_top">
		<td height="5" colspan="3"></td>
	</tr>
	<tr>
	<%if( (actdate != null) && (actdate.getTime()>thisdate.getTime()) ) { %>	
		<s:if test="#session.session_id != null">
			<td class="bu_2" align="center" colspan="3" style="color:#ffffff;">
				<s:if test="#session.session_adminYN == 1">
					<a href="#" onclick="aboutMatch('modifySoloMatchForm.action?game_no=<s:property value="game_no"/>&currentPage=<s:property value="currentPage"/>','�� ��ġ�� ����')">��ġ ����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="aboutMatch('deleteSoloMatch.action?game_no=<s:property value="game_no"/>&mem_id=<s:property value="#session.session_id"/>&currentPage=<s:property value="currentPage"/>','�� ��ġ�� ����')">��ġ ����</a>
				</s:if>
				<s:else>
					<s:if test="mem_id != null">
						<s:a href="#" onclick="aboutMatch('%{cancelURL}','���')">��&nbsp;&nbsp;&nbsp;&nbsp;��</s:a>
					</s:if>
					<s:else>
						<s:if test="people_count == people_max">��&nbsp;&nbsp;&nbsp;&nbsp;��</s:if>
						<s:else><s:a href="#" onclick="aboutMatch('%{joinURL}','��û')">��&nbsp;&nbsp;&nbsp;&nbsp;û</s:a></s:else>
					</s:else>
				</s:else>
			</td>
		</s:if>
		<s:else>
		<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;"></td>
		</s:else>
		<%}else{ %>
		<td class="bu_2" height="25" align="center" colspan="3" style="color:#ffffff;"> ��ġ ����</td>
		<%} %>
	</tr>
	<tr>
		<td height="25" colspan="3"></td>
	</tr>
	<s:if test="list.size() <= 0">
	
	<tr bgcolor="#FFFFFF" align="center">
		<td colspan="10">��ϵ� �Խù��� �����ϴ�.</td>			
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="10"></td>
	</tr>
	</s:if>
	</table>
	</div>
</s:iterator>
<div style="margin-left:20%; margin-right:20%;">
	<table align="center" width="80%">
		
	<s:if test="#session.session_adminYN == 1">
	<tr align="right">
		<td>
			<input type="button" style="height:50px; width:250px;" value="�ַθ�ġ ����" id="bu_1" onclick="javascript:location.href='CreateSoloMatchForm.action?currentPage=<s:property value="currentPage"/>';">
		</td>
	</tr>
	<tr align="center">
			<td colspan="10"><s:property value="pagingHtml" escape="false"/></td>
	</tr>
	<tr height="100"></tr>
	</s:if>
</table>
</div>
<br>
<%-- <form action="SoloMatchList.action" method="post">
<table align="center">
	<tr>
		<td>
			<select name="topic">
				<option value="0" selected="selected">����</option>
				<option value="1">�ۼ���</option>
				<option value="2">����</option>
			</select>
			<input class="bor" type="text" name="search"/>
			<input style="padding: 1px 0px 0px 0px; height:22px;" id="bu_1" type="submit" value="   �˻�   " class="inputb">
		</td>
	</tr>
</table>
</form> --%>
</body>
</html>