<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<s:form method="post" action="modiftymemberPro" name="userinput" enctype="multipart/form-data">
	<s:hidden name="prof_image_save" value="%{memberResult.prof_image_save}"/>
	<s:hidden name="m_id" value="%{memberResult.m_id}"/>

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
			<td width="400"><s:property value="memberResult.m_id"/></td>
		</tr>
		<tr>
			<td width="200">새로운 비밀번호</td>
			<td width="400">
				<input type="password" name="m_passwd" size="15" maxlength="12" value="<s:property value="memberResult.m_passwd"/>" >
			</td>
		</tr>
		<tr>
			<td width="200">새로운 비밀번호 확인</td>
			<td width="400">
				<input type="password" name="passwd2" size="15" maxlength="12" value="<s:property value="memberResult.m_passwd"/>">
			</td>
		</tr>				
		<tr>
			<td width="200"><b>개인정보 입력</b></td>
			<td width="400"> </td>
		</tr>
		<tr>
			<td width="200">이름</td>
			<td width="400"><s:property value="memberResult.m_name"/>
			</td>
		</tr>
		<tr>
			<td width="200">닉네임</td>
			<td width="400">
				<input type="text" name="m_nickname" size="20" value="<s:property value="memberResult.m_nickname"/>">
				<input type="button" name="check_nick" value="닉네임 중복확인" OnClick="openConfirmnick(this.form)">
			</td>
		</tr>

			<tr>
			<td width="200">포지션</td>
			<td width="400"><s:property value="memberResult.m_position"/> >
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
			<font color="red" size="2">※포지션을 새로 선택해주세요.</font>
			</td>
		</tr>
		
		<tr>
			<td width="200">휴대폰 번호</td>
			<td width="400">
				<input type="text" name="m_mobilephone" size="20" value="<s:property value="memberResult.m_mobilephone"/>"> <font size="2">예시)01011111111</font>
				
			</td>
		</tr>				
		<tr>
			<td width="200">지역</td>
			<td width="400">
				<input type="text" name="m_region" size="20" value="<s:property value="memberResult.m_region"/>">
			</td>
		</tr>
		<tr>
			<td width="200">출생연도</td>
			<td width="400"><s:property value="memberResult.m_birthyear"/>
		<%-- 		<input type="text" name="m_birthyear" size="10" value="<s:property value="memberResult.m_birthyear"/>">
			<font size="2">예시)1990</font></td> --%>
		</tr>
		<tr>
			<td width="200">이메일</td>
			<td width="400"><s:property value="memberResult.m_email"/>
				<%-- <input type="text" name="m_email" size="30" value="<s:property value="memberResult.m_email"/>">
				<input type="button" name="email_nick" value="이메일 중복확인" OnClick="openConfirmemail(this.form)" value="<s:property value="memberResult.m_email"/>"> --%>
				
			</td>
		</tr>
		<tr>
		<td>기존 프로필사진</td>
		</tr>
		<tr>
		
		<td><img src="${profpath}"></td>
		</tr>

		<tr>
			
			<td>
			프로필사진 수정하기> <s:file name="upload" theme="simple"/>
			
			</td>	
		</tr>				
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="confirm" value="등 록" onclick="return checkIt()">
				<input type="reset" name="reset" value="다시 입력">
				<input type="button" value="취소" onclick="javascript:window.location='modiftymemberForm.action?m_id=<s:property value="memberResult.m_id"/>'">
			</td>
		</tr>			
	</table>
	</s:form>


</body>
</html>