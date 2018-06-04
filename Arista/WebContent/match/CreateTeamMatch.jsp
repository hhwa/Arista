<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스트럿츠2 게시판</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css" type="text/css">

<script type="text/javascript">
function validation(){
	var frm = document.forms[0];
	
	if(frm.game_day.value==""){
		alert("경기일을 입력해주세요");
		return false;
	}else if(frm.game_type.value==""){
		alert("경기종류을 입력해주세요");
		return false;
	}else if(frm.stadium.value==""){
		alert("경기장를 입력해주세요");
		return false;
	}else if(frm.fee.value==""){
		alert("참가비를 입력해주세요.");
		return false;
	}else if(frm.game_area.value==""){
		alert("경기 지역을 입력해주세요.");
		return false;
	}else if(frm.uniform_color.value==""){
		alert("내용을 입력해주세요.");
		return false;
	}else if(frm.content.value==""){
		alert("내용을 입력해주세요.");
		return false;
	}
	return true;
	
}

</script>
</head>
<body>
<div style="margin:auto;">
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr>
		<td align="center"><h2>Team Match</h2></td>
	</tr>
</table>
<s:if test="resultClass == NULL">
	<form action="CreateTeamMatch.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
</s:if>
<s:else>
	<form action="modifyTeamMatch.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
		<s:hidden name="game_no" value="%{resultClass.game_no}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
</s:else>
	<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
		</tr>
       
       	<tr bgcolor="#777777">
        	<td height="1" colspan="2"></td>
       	</tr>
			
       	<tr>
        	<td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  경기 날짜</td>
         	<td width="500" bgcolor="#FFFFFF">
           	<s:textfield name="game_day" theme="simple" value="%{resultClass.game_day}" cssStyle="width:370px" maxlength="50"/>
         	</td>
       	</tr>
       							
       	<tr bgcolor="#777777">
        	<td height="1" colspan="2"></td>
       	</tr>
       
       	<tr>
         	<td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  경기 종류 </td>
         	<td bgcolor="#FFFFFF">
         	
         	<input type="radio" name="game_type" value="풋살" checked="checked"/>풋살
         	<input type="radio" name="game_type" value="축구"/>축구
			
           	<!--<s:textfield name="game_type" theme="simple" value="%{resultClass.game_type}" cssStyle="width:100px" maxlength="20"/>-->
        	</td>
       	</tr>
       	<tr bgcolor="#777777">
         	<td height="1" colspan="2"></td>	
       	</tr>
	
		<tr>
        	<td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  경기 지역</td>
         	<td width="500" bgcolor="#FFFFFF">
         	<s:if test="areaList != null">
         		<select name="game_area"> <!-- onchange -->
         			<s:iterator value="areaList">
         				<option value="<s:property/>"><s:property/></option>
         			</s:iterator>
         		</select>
         	</s:if>
           <!-- 	<s:textfield name="game_area" theme="simple" value="%{resultClass.game_area}" cssStyle="width:370px" maxlength="50"/> -->
         	</td>
       	</tr>
       							
       	<tr bgcolor="#777777">
        	<td height="1" colspan="2"></td>
       	</tr>
       	
       	<tr>
         	<td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  경기장 </td>
         	<td bgcolor="#FFFFFF">
           	<s:textfield name="stadium" theme="simple" value="%{resultClass.stadium}" cssStyle="width:100px" maxlength="20"/>
         	</td>
       	</tr>
       	<tr bgcolor="#777777">
         	<td height="1" colspan="2"></td>	
       	</tr>
       	
		<tr>
        	<td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  비용</td>
         	<td width="500" bgcolor="#FFFFFF">
           	<s:textfield name="fee" theme="simple" value="%{resultClass.fee}" cssStyle="width:370px" maxlength="50"/>
         	</td>
       	</tr>
       	
       	<tr bgcolor="#777777">
         	<td height="1" colspan="2"></td>	
       	</tr>
       	
       	<tr>
        	<td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  유니폼 색상</td>
         	<td width="500" bgcolor="#FFFFFF">
           	<s:textfield name="uniform_color" theme="simple" value="%{resultClass.uniform_color}" cssStyle="width:370px" maxlength="50"/>
         	</td>
       	</tr>
       	
       	<tr bgcolor="#777777">
         	<td height="1" colspan="2"></td>
       	</tr>
       	
       	<tr>
         	<td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
         	<td bgcolor="#FFFFFF">
           	<s:textarea name="content" theme="simple" value="%{resultClass.content}" cols="50" rows="10" />
         	</td>
       	</tr>
       	
       	<tr bgcolor="#777777">
        	<td height="1" colspan="2"></td>
       	</tr>
	       
       	<tr>
         	<td height="10" colspan="2"></td>
       	</tr>
        <tr>
         	<td align="right" colspan="2">
	         	<input name="submit" type="submit" value="작성완료" class="inputb">
           		<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='TeamMatchList.action?currentPage=<s:property value="currentPage" />'">
        	</td>
       	</tr>
    </table>
    </form>
</div>
</body>
</html>