<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>회원가입</title>
<script src="./join/joinForm.js" type="text/javascript">
</script>
</head>
<body>
<s:form method="post" action="MemberJoinAction" name="userinput" enctype="multipart/form-data" onsubmit="return checkIt();">
	<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
		<tr>
			<td colspan="2" height="39" align="center" >
				<font size="+1"><b>회원가입</b></font></td>
		</tr>
		<tr>
			<td width="200"><b>아이디 입력</b></td>
			<td width="400"></td>
		</tr>
		<tr>
			<td width="200"> 사용자 ID </td>
			<td width="400">
				<input type="text" name="m_id" size="10" maxlength="12">
				<input type="button" name="check_id" value="ID중복확인" OnClick="openConfirmid(this.form)">
		</tr>
		<tr>
			<td width="200">비밀번호</td>
			<td width="400">
				<input type="password" name="m_passwd" size="20">
			</td>
		</tr>
		<tr>
			<td width="200">비밀번호 확인</td>
			<td width="400">
				<input type="password" name="passwd2" size="20">
			</td>
		</tr>				
		<tr>
			<td width="200"><b>개인정보 입력</b></td>
			<td width="400"> </td>
		</tr>
		<tr>
			<td width="200">이름</td>
			<td width="400">
				<input type="text" name="m_name" size="15" maxlength="15">
			</td>
		</tr>
		<tr>
			<td width="200">닉네임</td>
			<td width="400">
				<input type="text" name="m_nickname" size="15" maxlength="15">
				<input type="button" name="check_nick" value="닉네임 중복확인" OnClick="openConfirmnick(this.form)">
			</td>
		</tr>

			<tr>
			<td width="200">포지션</td>
			<td width="400">
			<select name="m_position">
			<option selected="selected">선택</option> 
			<option>LWF</option>
			<option>ST</option>
			<option>RWF</option>
			<option>LWM</option>
			<option>CAM</option>
			<option>CM</option>
			<option>CDM</option>
			<option>CB</option>
			<option>LB</option>
			<option>LWB</option>
			<option>RB</option>
			<option>RWB</option>
			<option>GK</option>
			</select>
			<font color="red" size="2">※포지션을 선택해주세요.</font>
			</td>
		</tr>
		
		<tr>
			<td width="200">휴대폰 번호</td>
			<td width="400">
				<input type="text" name="m_mobilephone" size="11"> <font size="2">예시)010-1111-1111</font>
				
			</td>
		</tr>				
		<tr>
			<td width="200">지역</td>
			<td width="400">
				<!-- <input type="text" name="m_region" size="20"> -->
				<select name="m_region"><option value="선택">선택</option>
								<option value="서울">서울</option>
								<option value="경기도">경기도</option>
								<option value="강원도">강원도</option>
								<option value="충청도">충청도</option>
								<option value="전라도">전라도</option>
								<option value="경상도">경상도</option>
								<option value="제주도">제주도</option>
							</select>
			</td>
		</tr>
		<tr>
			<td width="200">출생연도</td>
			<td width="400">
				<input type="text" name="m_birthyear" size="10">
			<font size="2">예시)1990</font></td>
		</tr>
		<tr>
			<td width="200">이메일</td>
			<td width="400">
				<input type="text" name="m_email" size="30">
				<input type="button" name="email_nick" value="이메일 중복확인" OnClick="openConfirmemail(this.form)">
				
			</td>
		</tr>
		

		<tr>
			<td>프로필사진</td>
			<td>
			<s:file name="upload" theme="simple"/>
			
			</td>	
		</tr>				
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="confirm" value="등 록">
				<input type="reset" name="reset" value="다시 입력">
				<input type="button" value="취소" onclick="javascript:window.location='loginForm.action'">
			</td>
		</tr>			
	</table>
	</s:form>
</body>
</html>
