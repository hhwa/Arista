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
	border-color: #000000;
	width:60px;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.StadiumForm.stadium_zipcode.value=data.zonecode; //5자리 우편주소
                document.StadiumForm.stadium_addr.value=fullRoadAddr;	//도로명주소
                /* document.StadiumForm.address2.value=data.jibunAddress; //지번주소 */
               

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

               /*  } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')'; */

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    function validation(){
    	var frm = document.StadiumForm;
    	
    	if(frm.stadium_name.value == ""){
    		alert("경기장 이름을 입력해주세요.");
    		return false;
    	}
    	else if(frm.stadium_tel.value == "선택"){
    		alert("전화번호를 입력해주세요");
    		return false;
    	}
    	else if(frm.stadium_zipcode.value == "선택"){
    		alert("주소를 입력해주세요");
    		return false;
    	}
    	else if(frm.stadium_addr2.value == "선택"){
    		alert("상세주소를 입력해주세요.");
    		return false;
    	}
    	else if(frm.stadium_day.value == "선택"){
    		alert("이용 가능 요일을 선택해주세요");
    		return false;
    	}
    	else if(frm.stadium_time.value == ""){
    		alert("이용 가능 시간을 선택해주세요.");
    		return false;
    	}
    	return true;
    }
</script>
<title>경기장 등록</title>

</head>

<body>
   
<s:if test="resultClass == NULL">
	<form action="StadiumWrite.action" name="StadiumForm" method="post" enctype="multipart/form-data">
</s:if>
     
<s:else>
	<form action="StadiumModify.action" name="StadiumForm" method="post" enctype="multipart/form-data">
    	<s:hidden name="stadium_no" value="%{resultClass.stadium_no}" />
        <s:hidden name="currentPage" value="%{currentPage}" />
        <s:hidden name="old_file" value="%{resultClass.stadium_main_img_save}" />
</s:else>
        
	<table align="center">
		<tr height="50"><td></td></tr>
		<tr>
        	<td colspan="11" class="font_12" align="right" style="padding:0px 50px"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        <tr height="20" ><td></td></tr>
         
        <tr height="40">
        	<td width="200"><b>경기장 이름 <font color="#FF0000">*</font></b></td>
        	<td width="300">
           		<s:if test="resultClass == NULL">
        		<s:textfield name="stadium_name" theme="simple" value="%{resultClass.stadium_name}" cssClass="bottom" id="bu_in" cssStyle="width:370px" maxlength="50" />
        		</s:if>
        		<s:else>
        		<s:hidden name="stadium_name" theme="simple" value="%{resultClass.stadium_name}" /><s:property value="resultClass.stadium_name"/>
        		</s:else>
           	</td>
        </tr>
         	
        <tr height="40">
        	<td width="200"><b>경기장 유형 <font color="#FF0000">*</font></b></td>
        	<td width="300">
        		<input type="radio" name="stadium_type" value="풋살경기장" <s:if test="resultClass.stadium_type eq '풋살경기장'"> checked="checked"</s:if>/>풋살경기장&nbsp;
         		<input type="radio" name="stadium_type" value="축구경기장" <s:if test="resultClass.stadium_type eq '축구경기장'"> checked="checked"</s:if>/>축구경기장
           	</td>
        </tr>
              
        <tr height="40">
        	<td width="200"><b>전화번호 <font color="#FF0000">*</font></b></td>
           	<td width="500">
           		<s:textfield name="stadium_tel" theme="simple" value="%{stadium_tel}" maxlength="4" cssClass="bottom" id="bu_in" cssStyle="width:50px;"/>&nbsp; - &nbsp;
           		<s:textfield name="stadium_tel1" theme="simple" value="%{stadium_tel1}"  maxlength="4"cssClass="bottom" id="bu_in" cssStyle="width:50px;" />&nbsp; - &nbsp;
           		<s:textfield name="stadium_tel2" theme="simple" value="%{stadium_tel2}" maxlength="4"cssClass="bottom" id="bu_in" cssStyle="width:50px;" />
            </td>
        </tr>
             
        <tr height="40">
        	<td width="200"><b>우편번호 <font color="#FF0000">*</font></b></td>
          	<td width="500">
				<input type="text" class="bottom" style="width:80px; padding:0px 0px 0px 10px;" name="stadium_zipcode" value="${resultClass.stadium_zipcode }" readonly="readonly">
				<input type="button" id="bu_1" value="우편번호찾기" onclick="DaumPostcode()" placehoder="우편번호를 검색하세요">
			</td>
		</tr>
		<tr>
		<tr height="40">
        	<td width="200"><b>도로명 주소 <font color="#FF0000">*</font></b></td>
          	<td width="500">
				<input type="text" class="bottom" style="width:370px; padding:0px 0px 0px 10px;" name="stadium_addr" value="${resultClass.stadium_addr }" placeholder="도로명주소" readonly="readonly"/>
			</td>
		</tr>
		<tr height="40">
          	<td width="200"></td>
          	<td width="500">
				<input type="text" class="bottom" style="width:370px; padding:0px 0px 0px 10px;" name="stadium_addr2" value="${resultClass.stadium_addr2 }" placeholder="상세주소"/>
			<!-- <input type="text" id="address2" name="address2" placeholder="지번주소"> -->
			</td>
			<span id="guide" style="color:#999"></span>
		</tr>
        <tr height="40">
          	<td width="200"><b>사용 가능 요일 <font color="#FF0000">*</font></b></td>
          	<td width="500">
          		<input type="checkbox" name="stadium_days" value="월" <s:if test="mon != null"> checked="checked"</s:if>>월&nbsp;
          		<input type="checkbox" name="stadium_days" value="화" <s:if test="tue != null"> checked="checked"</s:if>>화&nbsp;
          		<input type="checkbox" name="stadium_days" value="수" <s:if test="wed != null"> checked="checked"</s:if>>수&nbsp;
          		<input type="checkbox" name="stadium_days" value="목" <s:if test="thu != null"> checked="checked"</s:if>>목&nbsp;
          		<input type="checkbox" name="stadium_days" value="금" <s:if test="fri != null"> checked="checked"</s:if>>금&nbsp;
          		<input type="checkbox" name="stadium_days" value="토" <s:if test="sat != null"> checked="checked"</s:if>>토&nbsp;
          		<input type="checkbox" name="stadium_days" value="일" <s:if test="sun != null"> checked="checked"</s:if>>일&nbsp;
        		<%-- <s:textfield name="stadium_day" theme="simple" value="%{resultClass.stadium_day}" cssClass="bottom" id="bu_in" cssStyle="width:370px" maxlength="50" /> --%>
            </td>
        </tr>
             
              
        <tr height="40">
        	<td width="200"><b>사용 가능 시간 <font color="#FF0000">*</font></b></td>
          	<td width="500">
          	<select name="stadium_time" class="bottom" id="bu_in">
          		<s:iterator value="timeList" status="stat">
          			<s:if test="stadium_time eq timeList[#stat.index]">
          			<option value="<s:property/>" selected="selected"><s:property/></option>
          			</s:if>
          			<s:else>
          			<option value="<s:property/>"><s:property/></option>
          			</s:else>
          		</s:iterator>
          	</select>&nbsp; ~ &nbsp;
          	<select name="stadium_time1" class="bottom" id="bu_in">
          		<s:iterator value="timeList" status="stat">
          			<s:if test="stadium_time1 eq timeList[#stat.index]">
          				<option value="<s:property/>" selected="selected"><s:property/></option>
          			</s:if>
          			<s:else>
          				<option value="<s:property/>"><s:property/></option>
          			</s:else>
          		</s:iterator>
          	</select>	
            	<%-- <s:textfield name="stadium_time" theme="simple" value="%{resultClass.stadium_time}" cssClass="bottom" id="bu_in" cssStyle="width:370px" maxlength="50" /> --%>
            </td>
        </tr>
             
        <tr height="40">
        	<td width="200"><b>경기장 이미지 <font color="#FF0000">*</font></b></td>
            <td width="500">
            	<s:file name="upload" theme="simple" />
                 
                <s:if test="resultClass.stadium_main_img_org != NULL" >
                &nbsp; * <s:property value="resultClass.stadium_main_img_org" />파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
                </s:if>
            </td>
        </tr>
                
        <tr>
        	<td height="30" colspan="2"></td>
        </tr>
                 
        <tr height="100">
          	<td align="right" colspan="2">
        	    <input name="submit" type="submit" style="width:125px; height:25px;" value="작성완료" class="bu_2"/>
                <input name="stadiumlist" type="button" style="width:125px; height:25px;" value="목록" class="bu_2" onClick="javascript:location.href='StadiumList.action?currentPage=<s:property value="currentPage" />'"/>
            </td>
        </tr>
        <tr height="100"></tr>
	</table>
    </form>
</body>
</html>