//app.use(function (req, res, next) {
//  if (req.url && req.url.indexOf('.htm') > -1) {
//    res.header('Content-Type', 'text/html');
//  }
//  next();
//});
//function validation(){
//	var frm = document.forms(0);
//	
//	if(frm.team_id.value == ""){
//		alert("팀명을 입력해주세요.");
//		return false;
//	}
//	else if(frm.team_type.value == "선택"){
//		alert("소속유형을 선택해 주세요.");
//		return false;
//	}
//	else if(frm.team_fieldtype.value == "선택"){
//		alert("경기유형을 선택해 주세요.");
//		return false;
//	}
//	else if(frm.team_age.value == "선택"){
//		alert("연령대를 선택해 주세요.");
//		return false;
//	}
//	else if(frm.team_skill.value == "선택"){
//		alert("실력을 선택해 주세요.");
//		return false;
//	}
//	else if(frm.team_age.value == ""){
//		alert("연령대를 입력해주세요.");
//		return false;
//	}
//	else if(frm.team_intro.value == ""){
//		alert("간략한 소개를 부탁 드립니다.");
//		return false;
//	}else if(frm.idcheckresult.value != 1){
//		alert("팀 이름 중복확인 해주세요");
//		return false;
//	}
//	return true;
//}
//function openConfirmid(userinput) {	 
//	
//	var id = userinput.team_id.value
////url과 사용자 입력 id를 조합합니다.	
//url = "teamIdCheck.action?team_id="+id;
////새로운 윈도우를 엽니다.
//open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
//}