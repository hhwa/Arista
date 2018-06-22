<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function aboutTeam(url,msg){
	if (confirm(msg+" 하시겠습니까?") == true){    //확인
		location.href=url;
	}else{   //취소
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

<div align="left" style="margin-left:20%; margin-right: 20%; margin-bottom: 150px;">
   <table width="320" align="center" style="float:left; margin-left:35px; margin-right:35px;" >
      
      <tr>
         <td height="200" colspan="3" align="center"><strong><img class="team_img" width="200" height="200" src="team/teamIMG/<s:property value="resultClass.file_savname" />"></strong></td>
      </tr>
      <tr>
         <td height="8" width="120"></td>
         <td width="50"></td>
         <td width="150"></td>
      </tr>
      <tr>
         <td class="border_side_bu" align="center" colspan="3"><b><s:property value="%{resultClass.team_id}" /></b></td>
      </tr>
      <tr>
         <td class="border_left" height="8" width="120"></td>
         <td width="50"></td>
         <td class="border_right" width="150"></td>
      </tr>
      <tr>
         <td height="10" class="cont_si_left"></td>
         <td colspan="2"  class="cont_si_right"></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 팀 마스터</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.team_master}" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 지역</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="resultClass.team_area" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 팀유형</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.team_type}" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 팀 경기유형</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property   value="resultClass.team_fieldtype" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 평균연령</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="resultClass.team_age" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 평균실력</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="resultClass.team_skill" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 팀 인원수</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="resultClass.team_count" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 팀 소개</td>
         <td colspan="2" width="220"class="cont_si_right"><strong><s:property value="resultClass.team_intro" /></strong></td>
      </tr>
      <tr>
         <td height="10" class="cont_si_left"></td>
         <td colspan="2"  class="cont_si_right"></td>
      </tr>
      <tr class="border_top">
         <td height="5" colspan="3"></td>
      </tr>
      
   </table>
</div>
<br>
<div align="right">
	<table width="420" border="0" cellspacing="0" cellpadding="2" style="float:left; margin-left:20px; margin-right:50px;">
    	 <tr><td colspan="6" align="right" style="font-size: 12px; padding: 0px 10px 0px 0px;">회원목록</td></tr>
    	 <tr align="center" class="bu_2">
            <td height="25" align="center">아이디</td>
            <td align="center">이름</td>
            <td align="center" width="60">주 포지션</td>
            <td align="center" colspan="3" width="160">등급</td>
         </tr>
         <tr height="5"><td></td></tr>
         <s:iterator value="teamMemberList" status="stat">
            
            <tr class="list_cont" height="25">
               <td align="left" style="padding:0px 0px 0px 10px;"><s:property value="mem_id" /></td>
               <td align="center"><s:property value="m_name" /></td>
               <td align="center"><s:property value="m_position" /></td>
               <s:if test="team_admin == 2">
                  <td width="60" align="center">마스터</td>
               </s:if>
               <s:if test="team_admin == 1">
                  <td align="center">관리자</td>
               </s:if>
               <s:if test="team_admin == 0">
                  <td align="center">회원</td>
               </s:if>
               <s:if test="teamInfoParam.team_admin == 2">
                  <s:if test="team_admin!=2">
                  <td align="center" width="120">
                  <form action="changeTeamAdmin.action" method="post">
                     <s:hidden name="mem_id" value="%{mem_id}"/>
                     <s:hidden name="team_id" value="%{resultClass.team_id}"/>
                     <select name="team_admin">
                        <option value="0" <s:if test="team_admin==0"> selected="selected" </s:if>>회원</option>
                        <option value="1" <s:if test="team_admin==1"> selected="selected" </s:if>>관리자</option>
                        <option value="2" <s:if test="team_admin==2"> selected="selected" </s:if>>마스터</option>
                     </select>
                     <input type="submit" id="bu_1" value="변경"/>
                  </form>
                  </td>
                  <td width="30" align="center">
                     <input type="button" value="제명" id="bu_1" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="team_id"/>&mem_id=<s:property value="mem_id"/>','제명')"/>
                  </td>
                  </s:if>
               </s:if>
            </tr>
         </s:iterator>
    </table>
</div>
<s:if test="teamInfoParam.team_admin == 1 || teamInfoParam.team_admin == 2">
      <div align="right">
         <table width="420" border="0" cellspacing="0" cellpadding="2" style="float:left; margin-left:20px; margin-right:50px;">
         <tr height="8"><td></td></tr>
         <tr><td colspan="6" align="right" style="font-size: 12px; padding: 0px 10px 0px 0px;">가입대기자</td></tr>
         <tr align="center" class="bu_2" height="25">
               <td>아이디</td>
               <td>이름</td>
               <td align="center" width="60">주 포지션</td>
               <td align="center" width="210">가입관리</td>
            </tr>
            <tr height="5"><td></td></tr>
            <s:iterator value="teamJoinList" status="stat">
               <tr class="list_cont" height="25">
                  <td align="left" style="padding:0px 0px 0px 10px;"><s:property value="mem_id" /></td>
                  <td align="center"><s:property value="m_name" /></td>
                  <td align="center"><s:property value="m_position" /></td>
                  <td align="center">
                  <a href="#" onclick="aboutTeam('teamJoinAgree.action?team_id=<s:property value="resultClass.team_id"/>&mem_id=<s:property value="mem_id"/>','승인')">가입승인</a>
                  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="resultClass.team_id"/>&mem_id=<s:property value="mem_id"/>','거절')">가입거절</a>
                  </td>
               </tr>
            </s:iterator>
    	</table>
	</div>
</s:if>
<div style="margin-left:20%; margin-right:20%; margin-top: 450px;">
	<table style="margin:35px;">
   		<tr>
      		<td align="center" colspan="3" class="border_side_bu" width="320">
      			<input type="button" value="팀 정보 수정" onclick="aboutTeam('TeamModifyForm.action?team_id=<s:property value="%{resultClass.team_id}"/>','팀 정보를 수정')">&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
      		<s:if test="teamInfoParam.team_admin == 2">
      			<input type="button" value="팀 삭제" onclick="aboutTeam('DeleteTeam.action?team_id=<s:property value="%{resultClass.team_id}"/>','팀 삭제를')">&nbsp;&nbsp;&nbsp;&nbsp;
      		</s:if>
      		<s:else>
      			<input type="button" value="팀 탈퇴" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="team_id"/>&mem_id=<s:property value="#session.session_id"/>','탈퇴')"/>
      		</s:else>
      		</td>
      		<td width="55"></td>
      		<td align="center" colspan="3"><input type="button" style="width:420px;" class="border_side_bu" value="다른 팀 목록" onclick="location.href='TeamList.action'"></td>
      	</tr>
	</table>
</div>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
   <tr>
      <td height="40"></td>
   </tr>
</table>
</body>
</html>