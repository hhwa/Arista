<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script language="javaScript">
	function checkIt(){
		var useinput = eval("document.userinput");
		var id = userinput.m_id.value
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var re = /[~!@\#$%^&*\()\-=+_']/gi;
		if(!id) {
			alert("ID를 입력하세요");
			return false;
		}
	/* 	else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
            alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
            return false;
		}  */
		
		if(!userinput.m_passwd.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		if(userinput.m_passwd.value != userinput.passwd2.value)
		{
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		
		if(!userinput.m_name.value) {
			alert("사용자 이름을 입력하세요");
			return false;
		}
		if (!isNaN(userinput.m_name.value))	{
			alert("사용자 이름은 문자로 입력하세요");
		
			return false;
		}
		
		
		if(!userinput.m_nickname.value) {
			alert("닉네임을 입력하세요");
			return false;
		}
		else if(re.test(userinput.m_nickname.value)){
			alert("닉네임 형식이 올바르지 않습니다.");
			return false;
		}
		
		if(!userinput.m_mobilephone.value) {
			alert("휴대폰번호를 입력하세요");
			return false;
		}
			
		if (isNaN(userinput.m_mobilephone.value))	{
			alert("휴대폰 번호는 '-'를 제외한 숫자로 입력하세요");
			return false;
		}
		
		if(!userinput.m_region.value) {
			alert("지역명을 입력하세요");
			return false;
		}
		
		if(!userinput.m_birthyear.value) {
			alert("출생년월을 입력하세요");
			return false;
		}
		
		if(isNaN(userinput.m_birthyear.value)) {
			alert("출생년월을 숫자로 입력하세요");
			return false;
		}
		
		if(!userinput.m_email.value) {
			alert("이메일을 입력하세요");
			return false;
		}
		else if(exptext.test(userinput.m_email.value)==false){
			alert("이메일 형식이 올바르지 않습니다.");
		return false;
		}
	    }
	
	 // 아이디 중복체크 창 오픈
	function openConfirmid(userinput) {
		var id = userinput.m_id.value
		if(id == ""){
			alert("아이디를 입력하세요");
			return;
		}
		 else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
             alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
             return false;
         }
	
	//url과 사용자 입력 id를 조합합니다.	
	url = "memberIdCheck.action?m_id="+id;
	//url = "<s:url action='memberIdCheck.action'/>"+"?m_ID="+id;
	//새로운 윈도우를 엽니다.
	open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	 
	function openConfirmnick(userinput) {
		var re = /[~!@\#$%^&*\()\-=+_']/gi;
		var m_nickname = userinput.m_nickname.value
		if(m_nickname == ""){
			alert("닉네임을 입력하세요");
			return;
		}
		else if(re.test(userinput.m_nickname.value)){
			alert("닉네임 형식이 올바르지 않습니다.");
			return false;
		}
		
	
	url = "memberNickCheck.action?m_nickname="+m_nickname;
	open(url, "confirm2", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	
	function openConfirmemail(userinput) {
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var m_email = userinput.m_email.value
		if(m_email == ""){
			alert("이메일을 입력하세요");
			return;
		}
		else if(exptext.test(m_email)==false){
			alert("이메일 형식이 올바르지 않습니다.");
		return false;
		}
		
	
	url = "memberEmailCheck.action?m_email="+m_email;
	open(url, "confirm3", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	
</script>
</head>

<body>

<s:form method="post" action="MemberJoinAction" name="userinput" enctype="multipart/form-data">
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
				<input type="password" name="m_passwd" size="15" maxlength="12">
			</td>
		</tr>
		<tr>
			<td width="200">비밀번호 확인</td>
			<td width="400">
				<input type="password" name="passwd2" size="15" maxlength="12">
			</td>
		</tr>				
		<tr>
			<td width="200"><b>개인정보 입력</b></td>
			<td width="400"> </td>
		</tr>
		<tr>
			<td width="200">이름</td>
			<td width="400">
				<input type="text" name="m_name" size="15" maxlength="10">
			</td>
		</tr>
		<tr>
			<td width="200">닉네임</td>
			<td width="400">
				<input type="text" name="m_nickname" size="15" maxlength="10">
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
				<input type="text" name="m_mobilephone" size="11"> <font size="2">예시)01011111111</font>
				
			</td>
		</tr>				
		<tr>
			<td width="200">지역</td>
			<td width="400">
				<input type="text" name="m_region" size="20">
			</td>
		</tr>
		<tr>
			<td width="200">출생년월</td>
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
				<input type="submit" name="confirm" value="등 록" onclick="return checkIt()">
				<input type="reset" name="reset" value="다시 입력">
				<input type="button" value="취소" onclick="javascript:window.location='loginForm.jsp'">
			</td>
		</tr>			
	</table>
	</s:form>
</body>
</html>