//app.use(function (req, res, next) {
//  if (req.url && req.url.indexOf('.htm') > -1) {
//    res.header('Content-Type', 'text/html');
//  }
//  next();
//});

//중복체크 실행 여부 확인
//select 유효성 검사
function checkIt(){
 	var userinput = eval("document.userinput");
 	//아이디 유효성 검사 정규식
	var idExp = /^[a-zA-Z0-9]{4,12}$/; 
	//이름 유효성 검사 정규식
	var nameExp = /[~!@\#$%<>^&*\()\-=+_\’]/gi;
	//닉네임 유효성 검사 정규식
	var nickExp = /[~!@\#$%<>^&*\()\-=+_\’]/gi;
	//이메일 유효성 검사 정규식
	var emailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	//휴대폰 번호 유효성 검사 정규식
	var phoneExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
//	var phoneExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
	//출생연도
	var yearExp =/^[0-9]{4}$/;
		
	var id = document.userinput.m_id.value;
	var pw = document.userinput.m_passwd.value;
	var name = document.userinput.m_name.value;
	var nick = document.userinput.m_nickname.value;
	
	 if(!idExp.test(id)){
		alert("아이디는 특수문자/한글/공백은 사용할 수 없습니다.(4자 이상)");
	 	return false;
	 }
	
	 
	 if(pw.length<8||pw.length>20){
		 alert("비밀번호는 8자리 ~20자리 이내로 입력해주세요.");
			  return false;
	 }
		 
	 if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
			  return false;
		 } 
	 
	 if(pw != userinput.m_passwd2.value){
		 alert("비밀번호가 일치하지 않습니다.")
		 return false;
	 }

	 
	 if(name == "" || name==null) {
			alert("이름을 입력해주세요.")
			return false;
		}
	 
	 if(name.search(/\s/) != -1) {
			alert("이름에 공백을 사용하실 수 없습니다.")
			return false;
		}
	 
	 if(nameExp.test(name)){
		 alert("이름에 특수문자를 사용하실 수 없습니다.")
		 return false;
	 }
	 
	 
	 if(nick == "" || nick==null) {
			alert("닉네임을 입력해주세요.")
			return false;
		}
	 
	 if(nick.search(/\s/) != -1) {
			alert("닉네임에 공백을 사용하실 수 없습니다.")
			return false;
		}
	 
	 if(nickExp.test(nick)){
		 alert("닉네임에 특수문자를 사용하실 수 없습니다.")
		 return false;
	 }
	
		 
	 if(!phoneExp.test(document.userinput.m_mobilephone.value)){
		 alert("휴대폰 번호를 형식에 맞게 입력해주세요.")
		 return false;
	 }
	 
	 if(document.userinput.m_region.value =="선택"){
		 alert("지역을 선택해주세요.");
		 return false;
	 }
	 
	 
	 if(!yearExp.test(document.userinput.m_birthyear.value)){
		 alert("출생연도는 공백없이 숫자만 입력해주세요.");
		 return false;
	 }
	 
	 if(!emailExp.test(document.userinput.m_email.value)){
		 alert("이메일 형식에 맞게 입력해주세요.");
		return false;
	 }
	 
	 if(userinput.idcheckresult.value != 1){
		 alert("아이디 중복체크를 해주세요.");
		 return false;
	 } 
	 
	 if(userinput.nickcheckresult.value != 1){
		 alert("닉네임 중복체크를 해주세요.");
		 return false;
	 } 
	 
	 if(userinput.emailcheckresult.value != 1){
		 alert("이메일 중복체크를 해주세요.");
		 return false;
	 } 
	 
}
	
	 // 아이디 중복체크 창 오픈
	function openConfirmid(userinput) {
		var id = userinput.m_id.value;
		//정규식 a~z, A~Z, 0 ~9만 입력 받고 자릿수는 4~12로 제한한다.
		var regExp1 = /^[a-zA-Z0-9]{4,12}$/; 
		
		 if(!regExp1.test(id)){
			alert("아이디는 특수문자/한글/공백은 사용할 수 없습니다.(4자 이상)");
		 	return false;
		 }
		 
		
	//url과 사용자 입력 id를 조합합니다.	
	url = "memberIdCheck.action?m_id="+id;
	//새로운 윈도우를 엽니다.
	open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=530, height=200");
	}
	 
	function openConfirmnick(userinput) {
		var regExp2 = /[~!@\#$%<>^&*\()\-=+_\’]/gi;
		var m_nickname = document.userinput.m_nickname.value;

		if(m_nickname == "" || m_nickname==null){
			alert("닉네임을 입력해주세요.")
			return false;
		}
		
		if(m_nickname.search(/\s/) != -1) {
			alert("닉네임에 공백을 사용하실 수 없습니다.")
			return false;
		}
		
		if(regExp2.test(m_nickname)){
			alert("닉네임에 특수문자를 사용하실 수 없습니다. (2자 이상)")
			return false;
		}
		
	
	url = "memberNickCheck.action?m_nickname="+m_nickname;
	open(url, "confirm2", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=530, height=200");
	}
	
	function openConfirmemail(userinput) {
		var regExp3 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var m_email = userinput.m_email.value;

		
		if(!regExp3.test(m_email)){
			alert("이메일 형식에 맞게 입력해주세요.")
			return false;
		}

	
	url = "memberEmailCheck.action?m_email="+m_email;
	open(url, "confirm3", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=530, height=200");
	}
	
