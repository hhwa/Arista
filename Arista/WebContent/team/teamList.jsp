<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Team List</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td height="80"></td>
  		</tr>
  	</table>
<s:iterator value="list" status="stat">

	<s:url id="viewURL" action="TeamView" >
		<s:param name="team_no">
			<s:property value="team_no" />
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage" />
		</s:param>
	</s:url>
  
	<div style="margin-left:20%; margin-right:20%;">
	<table align="center" style="width: 30%; float: left;margin-left:10px; margin-right:10px;">

		<tr>
        	<td align="center"><img class="team_img" width="100" height="100" src="/Arista/team/teamIMG/<s:property value="imgMap[#stat.index]" />"></td>
        </tr>
        <tr height="20"><td></td></tr>
		<tr>
        	<td align="center" class="border_side_bu"> &nbsp;<s:property value="team_id" /></td>
        </tr>
		<tr>
        	<td height="25" class="teamlist_cont" >지역 &nbsp;: &nbsp;<s:property value="team_area"/></td>
        </tr>
        <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
        </tr>
        <tr>
        	<td height="25" class="teamlist_cont" >연령대 &nbsp;: &nbsp;<s:property value="team_age"/></td>
        </tr>
        <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
        </tr>
        <tr>
        	<td height="75" align="left" class="teamlist_cont"><s:property value="team_intro" /></td>
      	</tr>
      	<tr align="center" onclick="location.href='TeamView.action?team_no=<s:property value="team_no" />&currentPage=<s:property value="currentPage" />'">
      		<td align="center" class="border_side_bu">상세보기</td>
      	</tr>
			
		<s:if test="list.size() <= 0">
				
	  		<tr bgcolor="#FFFFFF"  align="center">
				<td colspan="5">등록된 게시물이 없습니다.</td>
            </tr>						
	      	<tr bgcolor="#777777">
      			<td height="1" colspan="5"></td>
    	    </tr>
    		
    	</s:if>
    </table>
    </div>
</s:iterator>
<table height="30"></table>
<div style="margin-left:20%; margin-right:20%;">
<table align="center" width="90%">	
		<tr height="100"></tr>	
	    <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	</tr>
    	<tr align="center">
			<td colspan="5">
			<form>
				<select name="topic" class="bottom" id="bu_in">
					<option value="0">팀명</option>
					<option value="1">지역</option>
					<option value="1">연령대</option>
				</select>&nbsp;&nbsp;
				<s:textfield name="search" theme="simple" value="" cssClass="bottom" cssStyle="width:120px" maxlength="20" />&nbsp;&nbsp;
				<input name="submit" type="submit" value="검색" class="bu_2"/>
			</form>
			</td>
		</tr>
		<tr height="100"></tr>
	</table>
	</div>
</body>
</html>