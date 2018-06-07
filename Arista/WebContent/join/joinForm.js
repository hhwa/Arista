function checkIt(){
	 	var useinput = eval("document.userinput");
	 	//아이디 유효성 검사 정규식
		var idExp = /^[a-zA-Z0-9]{4,12}$/;
		//비밀번호
		var pw = userinput.m_passwd.value;
		//이름 유효성 검사 정규식
		var nameExp = /^[a-zA-Z가-힣]{2,15}$/;
		//닉네임 유효성 검사 정규식
		var nickExp = /^[a-zA-Z가-힣]{2,15}$/;
		//이메일 유효성 검사 정규식
		var emailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		//휴대폰 번호 유효성 검사 정규식
		var phoneExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		//출생연도
		var yearExp =/^[0-9]{4}$/;
		//지역
		//var regionExp = /^[가-힣]{2,20}$/;
		
		 if(!idExp.test(userinput.m_id.value)){
				alert("아이디는 특수문자/공백/한글을 사용할 수 없습니다.(4자 이상)");
			 	return false;
			 }
	/* 	 
		 if(pw.length<8||pw.length>20){
			 alert("비밀번호는 8자리 ~20자리 이내로 입력해주세요.");
			  return false;
		 }
		 
		 if(pw.search(/₩s/) != -1){
			  alert("비밀번호는 공백 없이 입력해주세요.");
			  return false;
		 } */

	
		 if(!nameExp.test(userinput.m_name.value)){
			 alert("이름은 한글 및 영문 대소문자만 입력해주세요.");
			 return false;
		 }
		 
		 if(!nickExp.test(userinput.m_nickname.value)){
			alert("닉네임은 특수문자/공백을 사용할 수 없습니다.(2자 이상)");
			return false;
		}
		 
		 if(!phoneExp.test(userinput.m_mobilephone.value)){
			 alert("휴대폰 번호 형식에 맞게 입력해주세요.")
			 return false;
		 }
		 
		/*  if(!regionExp.test(userinput.m_region.value)){
			 alert("지역명은 한글만 입력해주세요.");
			 return false;
		 } */
		 
		 if(!yearExp.test(userinput.m_birthyear.value)){
			 alert("출생연도는 공백없이 숫자만 입력해주세요.");
			 return false;
		 }
		 
		 if(!emailExp.test(userinput.m_email.value)){
			 alert("이메일 형식에 맞게 입력해주세요.");
			return false;
		 }
		 
		 
		}
	
		
	
	 // 아이디 중복체크 창 오픈
	function openConfirmid(userinput) {
		var id = userinput.m_id.value
		//정규식 a~z, A~Z, 0 ~9만 입력 받고 자릿수는 4~12로 제한한다.
		var regExp1 = /^[a-zA-Z0-9]{4,12}$/; 
		
		 if(!regExp1.test(id)){
			alert("아이디는 특수문자/한글/공백은 사용할 수 없습니다.(4자 이상)");
		 	return false;
		 }
		 
		
	//url과 사용자 입력 id를 조합합니다.	
	url = "memberIdCheck.action?m_id="+id;
	//새로운 윈도우를 엽니다.
	open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	 
	function openConfirmnick(userinput) {
		var regExp2 = /^[a-zA-Z가-힣]{2,15}/;
		var m_nickname = userinput.m_nickname.value;
		
		
		if(!regExp2.test(m_nickname)){
			alert("닉네임에 특수문자 및 공백을 사용하실 수 없습니다. (2자 이상)")
			return false;
		} 
		
	
	url = "memberNickCheck.action?m_nickname="+m_nickname;
	open(url, "confirm2", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
	
	function openConfirmemail(userinput) {
		var regExp3 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var m_email = userinput.m_email.value;
		
		if(!regExp3.test(m_email)){
			alert("이메일 형식에 맞게 입력해주세요.")
			return false;
		}

	
	url = "memberEmailCheck.action?m_email="+m_email;
	open(url, "confirm3", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}