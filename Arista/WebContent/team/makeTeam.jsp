<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.bottom {
	display:black;
	border: none;
	border-bottom: 1px solid #000000;
	width: 180px;
	border-color: #000000;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function validation(){
	var frm = document.userinput;
	
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
	else if(frm.team_age.value == ""){
		alert("연령대를 입력해주세요.");
		return false;
	}
	else if(frm.team_intro.value == ""){
		alert("간략한 소개를 부탁 드립니다.");
		return false;
	}else if(frm.idcheckresult.value != 1){
		alert("팀 이름 중복확인 해주세요");
		return false;
	}
	return true;
}
function openConfirmid(userinput) {	 
	
	var id = userinput.team_id.value
//url과 사용자 입력 id를 조합합니다.	
url = "teamIdCheck.action?team_id="+id;
//새로운 윈도우를 엽니다.
open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=530, height=200");
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>팀 생성</title>	
</head>
<body>

	<s:if test="resultClass == NULL">
		<form name="userinput" action="TeamCreate.action" method="post" enctype="multipart/form-data" onsubmit="return validation();"/>
		<s:hidden name="idcheckresult" value="<s:property value='idcheckresult'/>"/>
	</s:if>
		
	<s:else>
		<form name="userinput" action="TeamModify.action" method="post" enctype="multipart/form-data" onsubmit="return validation();"/>
		<s:hidden name="team_no" value="%{resultClass.team_no}"/>
		<s:hidden name="currentPage" value="%{resultClass.currentPage}"/>
		<s:hidden name="old_file" value="%{resultClass.file_savname}"/>
		<s:hidden name="idcheckresult" value="1"/>
	</s:else>
		
	<table align="center">
		<tr height="50"><td></td></tr>
		<tr>
          <td colspan="11" class="font_12" align="right" style="padding:0px 50px"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        <tr height="20" ><td></td></tr>
        
		<tr height="40">
          	<td width="100"><b>팀명 <font color="#FF0000">*</font></b></td>
          	<s:if test="resultClass == NULL">
          	<td width="300">
            	<s:textfield name="team_id" cssClass="bottom" id="bu_in" theme="simple" cssStyle="width:370px"/>
          	</td>
          	<td>
				<input id="bu_1" type="button" name="check_id" value="팀 이름 중복확인  " onclick="openConfirmid(this.form)">
			</td>
			</s:if>
			<s:else>
			<td width="300" style="padding:0px 0px 0px 10px;"><s:hidden name="team_id" value="%{resultClass.team_id}"/><s:property value="%{resultClass.team_id}"/></td>
			</s:else>
        </tr>
	   
		<tr height="40">
          	<td width="100"><b>지역 <font color="#FF0000">*</font></b></td>
         	<td width="500">
          		<select name="team_area" class="bottom" id="bu_in">
     	    		<option>선택</option> 
					<option value="서울" <s:if test="resultClass.team_area eq '서울'">selected="selected"</s:if>>서울</option>
					<option value="인천" <s:if test="resultClass.team_area eq '인천'">selected="selected"</s:if>>인천</option>
					<option value="경기" <s:if test="resultClass.team_area eq '경기'">selected="selected"</s:if>>경기</option>
					<option value="강원" <s:if test="resultClass.team_area eq '강원'">selected="selected"</s:if>>강원</option>
					<option value="충남" <s:if test="resultClass.team_area eq '충남'">selected="selected"</s:if>>충남</option>
					<option value="충북" <s:if test="resultClass.team_area eq '충북'">selected="selected"</s:if>>충북</option>
					<option value="세종" <s:if test="resultClass.team_area eq '세종'">selected="selected"</s:if>>세종</option>
					<option value="대전" <s:if test="resultClass.team_area eq '대전'">selected="selected"</s:if>>대전</option>
					<option value="전북" <s:if test="resultClass.team_area eq '전북'">selected="selected"</s:if>>전북</option>
					<option value="전남" <s:if test="resultClass.team_area eq '전남'">selected="selected"</s:if>>전남</option>
					<option value="광주" <s:if test="resultClass.team_area eq '광주'">selected="selected"</s:if>>광주</option>
					<option value="경북" <s:if test="resultClass.team_area eq '경북'">selected="selected"</s:if>>경북</option>
					<option value="경남" <s:if test="resultClass.team_area eq '경남'">selected="selected"</s:if>>경남</option>
					<option value="대구" <s:if test="resultClass.team_area eq '대구'">selected="selected"</s:if>>대구</option>
					<option value="울산" <s:if test="resultClass.team_area eq '울산'">selected="selected"</s:if>>울산</option>
					<option value="부산" <s:if test="resultClass.team_area eq '부산'">selected="selected"</s:if>>부산</option>
         		</select>
          	</td>
        </tr>
        
		<tr height="40">
          	<td width="50"><b>소속유형 <font color="#FF0000">*</font></b></td>
          	<td width="250">
          		<select name="team_type"class="bottom" id="bu_in">
     	    		<option>선택</option> 
					<option <s:if test="resultClass.team_type eq '청소년'">selected="selected"</s:if>>청소년</option>
         			<option <s:if test="resultClass.team_type eq '대학생'">selected="selected"</s:if>>대학생</option>
         			<option <s:if test="resultClass.team_type eq '직장인'">selected="selected"</s:if>>직장인</option>
         			<option <s:if test="resultClass.team_type eq '성인'">selected="selected"</s:if>>성인</option>
         			<option <s:if test="resultClass.team_type eq '조기축구회'">selected="selected"</s:if>>조기축구회</option>
         		</select>
          	</td>
        </tr>        
         
		<tr height="40">
          	<td width="50"><b>종목유형 <font color="#FF0000">*</font></b></td>
          	<td width="250">
          
        	<input type="radio" name="team_fieldtype" value="풋살" <s:if test="resultClass.team_fieldtype eq '풋살'">checked="checked"</s:if>/>풋살&nbsp;
        	<input type="radio" name="team_fieldtype" value="축구" <s:if test="resultClass.team_fieldtype eq '축구'">checked="checked"</s:if>/>축구

          	</td>
        </tr>         
        
		<tr height="40">       
          	<td width="50" ><b>연령대 <font color="#FF0000">*</font></b></td>
          	<td width="250">
          	<select name="team_age" class="bottom" id="bu_in">
     	    	<option>선택</option> 
				<option <s:if test="resultClass.team_age eq '10대'">selected="selected"</s:if>>10대</option>
         		<option <s:if test="resultClass.team_age eq '20대'">selected="selected"</s:if>>20대</option>
         		<option <s:if test="resultClass.team_age eq '30대'">selected="selected"</s:if>>30대</option>
         		<option <s:if test="resultClass.team_age eq '40대'">selected="selected"</s:if>>40대</option>
         		<option <s:if test="resultClass.team_age eq '50대 이상'">selected="selected"</s:if>>50대 이상</option>
         	</select>
          	</td>
        </tr>
        
		<tr height="40">    
          	<td width="50"><b>실력 <font color="#FF0000">*</font></b></td>
          	<td width="250">
          	<select name="team_skill" class="bottom" id="bu_in">
     	    	<option>선택</option> 
				<option <s:if test="resultClass.team_skill eq '최상' ">selected="selected"</s:if>>최상</option>
				<option <s:if test="resultClass.team_skill eq '중상' ">selected="selected"</s:if>>중상</option>
         		<option <s:if test="resultClass.team_skill eq '중간' ">selected="selected"</s:if>>중간</option>
         		<option <s:if test="resultClass.team_skill eq '중하' ">selected="selected"</s:if>>중하</option>
         		<option <s:if test="resultClass.team_skill eq '최하' ">selected="selected"</s:if>>최하</option>
         	</select>
          	</td>
        </tr>   
        
		<tr height="40">
          	<td width="100"><b>팀 인원 <font color="#FF0000">*</font></b></td>
          	<td width="500">
            	<s:textfield name="team_count" cssClass="bottom" id="bu_in" theme="simple" value="%{resultClass.team_count}" cssStyle="width:370px" maxlength="50"/>
          	</td>
        </tr>         
        							
        <tr height="40">
          	<td width="100"><b>팀 소개 <font color="#FF0000">*</font></b></td>
          	<td>
          		<textarea name="team_intro" maxlength="75" cols="48" rows="10" >${resultClass.team_intro}</textarea>
          	</td>
        </tr>
                							
        
        <tr height="40">
          	<td width="100"><b>팀 로고 </b></td>
          	<td>
          	<%-- <s:file name="upload" theme="simple"/> --%>
          	<input type="file" name="upload"/>
            <s:if test="resultClass.file_orgname != NULL">
				&nbsp; * <s:property value="resultClass.file_orgname" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
			</s:if>
          	</td>
        </tr>
        
        <tr>
          <td height="30" colspan="2"></td>
        </tr>
        
        
        <tr height="40">
          	<td align="right" colspan="2">
          		<input name="submit" type="submit" style="width:125px; height:25px;" class="bu_2" value="작성완료" >
            	<input name="list" type="button" class="bu_2" style="width:125px; height:25px;" value="목  록" onClick="javascript:location.href='TeamList.action?currentPage=<s:property value="currentPage" />'">
          	</td>
        </tr>
		<tr height="100"></tr>
    </table>
    </form>
</body>
</html>