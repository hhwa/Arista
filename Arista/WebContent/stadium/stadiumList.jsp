<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>경기장 목록</title>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td height="20"></td>
	</tr>
</table>

<s:iterator value="list" status="stat">
       
	<s:url id="viewURL" action="StadiumView" >
    	<s:param name="stadium_no">
        	<s:property value="stadium_no" />
        </s:param>
        <s:param name="currentPage">
        	<s:property value="currentPage" />
        </s:param>
    </s:url>
    
<div align="left" style="margin-left:20%; margin-right: 20%;">
	<table style="width:30%; float:left; margin:10px;" border="0" cellspacing="0" cellpadding="2">
		<tr>
        	<td align="center"><img class="team_img" width="100" height="100" src="/Arista/stadium/stadiumIMG/<s:property value="stadium_main_img_save" />"></td>
        </tr>
        <tr height="20"><td></td></tr>
		<tr>
        	<td align="center" class="border_side_bu"> &nbsp;<s:property value="stadium_name" /></td>
        </tr>
        <tr>
        	<td height="25" class="teamlist_cont" >경기장 유형&nbsp;: &nbsp;<s:property value="stadium_type"/></td>
        </tr>
        <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
        </tr>
		<tr>
        	<td height="25" class="teamlist_cont" >전화번호&nbsp;: &nbsp;<s:property value="stadium_tel"/></td>
        </tr>
        <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
        </tr>
        <tr>
        	<td height="45" class="teamlist_cont" >주    소 &nbsp;: &nbsp;<s:property value="stadium_addr"/></td>
        </tr>
        <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
        </tr>
        <tr>
        	<td height="25" class="teamlist_cont" >이용가능 날짜 &nbsp;: &nbsp;<s:property value="stadium_day"/></td>
        </tr>
        <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
        </tr>
        <tr>
        	<td height="25" class="teamlist_cont" >이용가능 시간&nbsp;: &nbsp;<s:property value="stadium_time"/></td>
        </tr>
        <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
        </tr>
      	<tr align="center" onclick="location.href='StadiumView.action?stadium_no=<s:property value="stadium_no" />&currentPage=<s:property value="currentPage" />'">
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
		<tr height="50"></tr>              
        <s:if test="#session.session_adminYN == 1">
        <tr align="right">
      		<td colspan="5">
            	<input type="button" style="width:250px; height:50px;" value="경기장 등록" class="bu_2" onclick="javascript:location.href='StadiumForm.action?currentPage=<s:property value="currentPage" />';"></input> 
            </td>
        </tr>
        </s:if>
        <tr align="center" height="50">
        	<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
        </tr>
        <tr align="center" height="50">
	        <td colspan="5">
            <form>
    	        <select name="topic" class="bottom" id="bu_in">
        	        <option value="0">경기장 이름</option>
                    <option value="1">경기장  주소</option>
                    <option value="2">경기장 전화번호</option>
                </select>&nbsp;&nbsp;
                <s:textfield name="search" theme="simple" value="" cssClass="bottom" cssStyle="width:120px" maxlength="20" />
                <input name="submit" type="submit" value="검색" class="bu_2"/>
           </form>
           </td>
        </tr>
        <tr height="100"></tr>
    </table>
</div>
</body>
</html>