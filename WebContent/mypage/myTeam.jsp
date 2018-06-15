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
	마이팀
	<a href="TeamList.action">다른 팀 목록</a>
	<div align="left">
		<table width="600" border="0" cellspacing="0" cellpadding="2">
			<tr align="center" bgcolor="#F3F3F3">
				<td width="50"><strong>팀명</strong></td>
				<td width="50"><strong>팀마스터</strong></td>
				<td width="50"><strong>지역</strong></td>
				<td width="70"><strong>팀유형</strong></td>
				<td width="100"><strong>팀 경기유형</strong></td>
				<td width="70"><strong>평균연령</strong></td>
				<td width="70"><strong>평균실력</strong></td>
				<td width="70"><strong>팀 인원수</strong></td>
				<td width="70"><strong>팀 소개</strong></td>
				<td width="70"><strong>팀 마크</strong></td>
			</tr>

			<tr align="center">
				<td width="50"><strong><s:property value="%{resultClass.team_id}" /></strong></td>
				<td width="50"><strong><s:property value="%{resultClass.team_master}" /></strong></td>
				<td width="50"><strong><s:property value="resultClass.team_area" /></strong></td>
				<td width="70"><strong><s:property value="%{resultClass.team_type}" /></strong></td>
				<td width="100"><strong><s:property	value="resultClass.team_fieldtype" /></strong></td>
				<td width="70"><strong><s:property value="resultClass.team_age" /></strong></td>
				<td width="70"><strong><s:property value="resultClass.team_skill" /></strong></td>
				<td width="70"><strong><s:property value="resultClass.team_count" /></strong></td>
				<td width="70"><strong><s:property value="resultClass.team_intro" /></strong></td>
				<td width="70"><strong><img width="200" height="200" src="team/teamIMG/<s:property value="resultClass.file_savname" />"></strong></td>
			</tr>
			<tr>
				<td><input type="button" value="팀 정보 수정" onclick="aboutTeam('TeamModifyForm.action?team_id=<s:property value="%{resultClass.team_id}"/>','팀 정보를 수정')"></td>
				
			</tr>
		</table>

		<br>

		<br>
	</div>
	<br>
	<div align="right">
		팀 회원 목록
		<table width="600" border="0" cellspacing="0" cellpadding="2">
			<tr align="center" bgcolor="#F3F3F3">
				<td>회원 아이디</td>
				<td>회원 이름</td>
				<td>주 포지션</td>
				<td colspan="3">회원</td>
			</tr>
			<s:iterator value="teamMemberList" status="stat">
			
				<tr>
					<td><s:property value="mem_id" /></td>
					<td><s:property value="m_name" /></td>
					<td><s:property value="m_position" /></td>
					<s:if test="team_admin == 2">
						<td>마스터</td>
					</s:if>
					<s:if test="team_admin == 1">
						<td>관리자</td>
					</s:if>
					<s:if test="team_admin == 0">
						<td>회원</td>
					</s:if>
					<s:if test="teamInfoParam.team_admin == 2">
						<s:if test="team_admin!=2">
						<td>
						<form action="changeTeamAdmin.action" method="post">
							<s:hidden name="mem_id" value="%{mem_id}"/>
							<s:hidden name="team_id" value="%{resultClass.team_id}"/>
							<select name="team_admin">
								<option value="0">회원</option>
								<option value="1">관리자</option>
							</select>
							<input type="submit" value="변경"/>
						</form>
						</td>
						<td>
							<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="team_id"/>&mem_id=<s:property value="mem_id"/>','제명')">제명</a>
						</td>
						</s:if>
					</s:if>
				</tr>
			</s:iterator>
			<tr>
				<s:if test="%{resultClass.team_master} == #session.session_id">
				<td>
				<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="team_id"/>&mem_id=<s:property value="#session.session_id"/>','탈퇴')">팀 탈퇴하기</a>
				</td>
				</s:if>
			</tr>
		</table>
	</div>
	<s:if test="teamInfoParam.team_admin == 1 || teamInfoParam.team_admin == 2">
		<div align="right">
			가입 대기자
			<table width="600" border="0" cellspacing="0" cellpadding="2">
				<tr align="center" bgcolor="#F3F3F3">
					<td>회원 아이디</td>
					<td>회원 이름</td>
					<td>주 포지션</td>
					<td>가입관리</td>
				</tr>
				<s:iterator value="teamJoinList" status="stat">
					<tr>
						<td><s:property value="mem_id" /></td>
						<td><s:property value="m_name" /></td>
						<td><s:property value="m_position" /></td>
						<td>
						<a href="#" onclick="aboutTeam('teamJoinAgree.action?team_id=<s:property value="resultClass.team_id"/>&mem_id=<s:property value="mem_id"/>','승인')">가입승인</a>
						&nbsp;/&nbsp;
						<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="resultClass.team_id"/>&mem_id=<s:property value="mem_id"/>','거절')">가입거절</a>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
		
	</s:if>
</body>
</html>