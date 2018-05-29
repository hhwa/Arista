<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>팀 생성</title>
	<SCRIPT type="text/javascript">
		function validation(){
			var frm = document.forms(0);
			
			if(frm.team_id.value == ""){
				alert("팀명을 입력해주세요.");
				return false;
			}
			else if(frm.team_type.value == "선택"){
				alert("소속유형을 선택해 주세요.");
				return false;
			}
			else if(frm.team_fieldtype.value == "선택"){
				alert("경기유형을 선택해 주세요.");
				return false;
			}
			else if(frm.team_age.value == "선택"){
				alert("연령대를 선택해 주세요.");
				return false;
			}
			else if(frm.team_skill.value == "선택"){
				alert("실력을 선택해 주세요.");
				return false;
			}
			return true;
		}
	</SCRIPT>	
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>팀 생성</h2></td>
		</tr>
	</table>
	
		<s:if test="resultClass == NULL">
			<form action="writeAction.acion" method="post" enctype="multipart/form-data" onsubmit="return validation();"/>
		</s:if>
		
		<s:else>
			<form action="modifyAction.action" method="post" enctype="multpart/form-data"/>
			<s:hidden name="team_no" value="%{resultClass.team_no}"/>
			<s:hidden name="currenstPage" value="%{resultClass.currentPage}"/>
			<s:hidden name="old_file" value="%{resultClass.file_savname}"/>
		</s:else>
		
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  팀명</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="team_id" theme="simple" value="%{resultClass.team_id}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  지역</td>
          <td width="500" bgcolor="#FFFFFF">
          	<select name="team_area">
     	    	<option selected="selected">선택</option> 
				<option>서울</option>
         		<option>경기</option>
         		<option>충북</option>
         		<option>충남</option>
         		<option>전라</option>
         		<option>경기</option>
         		<option>강원</option>
         	</select>
          </td>
        </tr>
        
		<tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>          
          <td width="50" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  소속유형</td>
          <td width="250" bgcolor="#FFFFFF">
          	<select name="team_type">
     	    	<option selected="selected">선택</option> 
				<option>청소년</option>
         		<option>대학생</option>
         		<option>직장인</option>
         		<option>성인</option>
         		<option>조기축구회</option>
         	</select>
          </td>
        </tr>        
         
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>          
          <td width="50" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  종목유형</td>
          <td width="250" bgcolor="#FFFFFF">
          	<select name="team_fieldtype">
     	    	<option selected="selected">선택</option> 
				<option>축구</option>
         		<option>풋살</option>
         	</select>
          </td>
        </tr>         
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>          
          <td width="50" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  연령대</td>
          <td width="250" bgcolor="#FFFFFF">
          	<select name="team_age">
     	    	<option selected="selected">선택</option> 
				<option>10대</option>
         		<option>20대</option>
         		<option>30대</option>
         		<option>40대</option>
         		<option>50대 이상</option>
         	</select>
          </td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>          
          <td width="50" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  실력</td>
          <td width="250" bgcolor="#FFFFFF">
          	<select name="team_skill">
     	    	<option selected="selected">선택</option> 
				<option>상</option>
         		<option>중</option>
         		<option>하</option>
         	</select>
          </td>
        </tr>            
        							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  간략한 소개</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textarea name="team_intro" theme="simple" value="%{resultClass.team_intro}" cols="50" rows="10"/>
          </td>
        </tr>
                							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4">  첨부파일 </td>
          <td bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.file_orgname != NULL">
		&nbsp; * <s:property value="resultClass.file_orgname" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
	</s:if>
						
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
            <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='teamlistAction.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
</body>
</html>