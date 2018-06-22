<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>경기장 정보</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=OzF4ASqUVlimy_abhPsf&submodules=geocoder"></script>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="50"></td>
		</tr>
	</table>

<div align="left" style="margin-left:15%; margin-right:50px" >
   <table align="center" style="float:left; margin-right:50px;" >
		<tr>
         	<td height="200" colspan="3" align="center"><strong><img class="team_img" src="<%=request.getContextPath()%>/stadium/stadiumIMG/<s:property value="resultClass.stadium_main_img_save" />" width="150" height="150"></strong></td>
      	</tr>
      	<tr>
        	<td height="8" width="120"></td>
        	<td width="50"></td>
        	<td width="150"></td>
      	</tr>
		<tr>
        	<td class="border_side_bu" align="center" colspan="3"><b><s:property value="%{resultClass.stadium_name}" /></b></td>
      	</tr>
		<tr>
        	<td class="border_left" height="8" width="90"></td>
         	<td width="100"></td>
         	<td class="border_right" width="150"></td>
      	</tr>
      	<tr>
         	<td height="10" class="cont_si_left"></td>
         	<td colspan="2"  class="cont_si_right"></td>
      	</tr>
      	<tr>
       	  	<td height="25"  class="cont_si_left" ><font color="#FF0000">*</font> 경기장 유형</td>
        	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.stadium_type}" /></strong></td>
      	</tr>
      	<tr>
       	  	<td height="25"  class="cont_si_left" ><font color="#FF0000">*</font> 경기장 주소</td>
        	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.stadium_addr}" /></strong></td>
      	</tr>
      	<tr>
       	  	<td height="25" class="cont_si_left" ><font color="#FF0000">*</font> 경기장 상세주소</td>
        	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.stadium_addr2}" /></strong></td>
      	</tr>
      	<tr>
       	  	<td height="25" class="cont_si_left" ><font color="#FF0000">*</font> 이용 가능 날짜</td>
        	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.stadium_day}" /></strong></td>
      	</tr>
      	<tr>
       	  	<td height="25"  class="cont_si_left" ><font color="#FF0000">*</font> 이용 가능 시간</td>
        	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.stadium_time}" /></strong></td>
      	</tr>
      	<tr>
       	  	<td height="25"  class="cont_si_left" ><font color="#FF0000">*</font> 경기장 전화번호</td>
        	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.stadium_tel}" /></strong></td>
      	</tr>
      	<tr>
       	  	<td height="25" class="cont_si_left" ><font color="#FF0000">*</font> 경기장 등록일</td>
        	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.stadium_regdate}" /></strong></td>
      	</tr>
      	<tr>
         	<td height="10" class="cont_si_left"></td>
         	<td colspan="2"  class="cont_si_right"></td>
      	</tr>
      	<tr class="border_top">
         	<td height="5" colspan="3"></td>
      	</tr>
		<tr>
			<td width="100" align="center" colspan="3" class="bu_2">경기장 지도</td>
		</tr>
		<tr>
			<td colspan="3">
				<div id="map" style="width: 100%; height: 300px;"></div> 
				<script>
				var map = new naver.maps.Map('map');
			      var myaddress = '${resultClass.stadium_addr}';
			      
			      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
			    	  if (status !== naver.maps.Service.Status.OK) {
			              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
			          }
			          var result = response.result;
			          
			          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
			          map.setCenter(myaddr);

			          var marker = new naver.maps.Marker({
			              position: myaddr,
			              map: map
			            });

			          naver.maps.Event.addListener(marker, "click", function(e) {
			              if (infowindow.getMap()) {
			                  infowindow.close();
			              } else {
			                  infowindow.open(map, marker);
			              }
			            });

			          var infowindow = new naver.maps.InfoWindow({
			              content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
			          });
			      });
				</script>
			</td>
		</tr>
		<tr height="20"><td></td></tr>
		</table>
		
		</div>
<div align="right" style="margin-left:50px; margin-right:15%">
	<table>
		<tr><td height="150"></td></tr>
      	<tr>
           <td width="100" class="bu_2">경기장 일정</td>
           <td bgcolor="#FFFFFF">
                                      팀매치 신청  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*솔로매치는 매치메뉴에서 신청해 주세요~
             </td>
      	</tr>
      </table>
<%
	//보여줄 연도, 달 받아오기. 파라미터 값이 숫자가 아니거나 null이면 현재 달로 보여줌.
	GregorianCalendar curDate = new GregorianCalendar();
	int year = 0;
	int month = 0; //원하는 달-1 값. 예)2월 = 1
	try{
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		curDate.set(Calendar.YEAR, year); //보여줄 연도 setting
		curDate.set(Calendar.MONTH, month); //보여줄 달 setting
		curDate.set(Calendar.DAY_OF_MONTH, 1); //일자는 1일로 고정
	}catch(NumberFormatException nfe){
		year = curDate.get(Calendar.YEAR);
		month = curDate.get(Calendar.MONTH);
	}
	int firstDay = new GregorianCalendar(curDate.get(Calendar.YEAR), curDate.get(Calendar.MONTH), 1).get(Calendar.DAY_OF_WEEK); //해당 달의 시작하는 날 idx
	int lastDay = curDate.getActualMaximum(Calendar.DAY_OF_MONTH); //해당 달의 마지막 날
	
	//오늘 일자 구하기
	GregorianCalendar getToday = new GregorianCalendar();
	int todayYear = getToday.get(Calendar.YEAR);
	int todayMonth = getToday.get(Calendar.MONTH);
	int todayDate = getToday.get(Calendar.DAY_OF_MONTH)+1;
 	
	java.util.Date thisdate = new java.util.Date();	//오늘 날짜
	//달력 구현
	int row = 7; //행
	int col = 5; //열
	int day = 1;
	
	int sr;
	if(Integer.parseInt(request.getAttribute("list2.size()").toString()) == 0){
		sr = 0;
	}else{
    	sr = Integer.parseInt(request.getAttribute("sa").toString());
	}
   	
	String a = Integer.toString(year);
    String b =Integer.toString(month+1);
    String c =Integer.toString(day);
    
	int stadium_no = Integer.parseInt(request.getAttribute("resultClass.stadium_no").toString());
    int currentPage = Integer.parseInt(request.getAttribute("currentPage").toString());
    String stadium_name = request.getAttribute("resultClass.stadium_name").toString();
    int mastercheck = Integer.parseInt(request.getAttribute("mastercheck").toString());
    
	out.println("<table class=inp border=1>");
	out.println("	<tr>");
	out.println("		<td class=bu_2 colspan="+row+" align=center><a href='"+traverseDate("downYear", year, month,stadium_no,currentPage)+"'><font style='text-decoration: none; color:#FFFFFF;'>▼</font></a><font style='font-size: 18'>"+year+"</font>년<a href='"+traverseDate("upYear", year, month,stadium_no,currentPage)+"'><font style='text-decoration: none; color:#FFFFFF;'>▲</font></a>&nbsp;<a href='"+traverseDate("downMonth", year, month,stadium_no,currentPage)+"'><font style='text-decoration: none; color:#FFFFFF;'>▼</font></a><font style='font-size: 18'>"+(month+1)+"</font>월<a href='"+traverseDate("upMonth", year, month,stadium_no,currentPage)+"'><font style='text-decoration: none; color:#FFFFFF;'>▲</font></a>&nbsp;&nbsp;</td>");//<a href='./JSPCalendar.jsp'><font style='text-decoration: none; color:#FFFFFF;'>reset</font></a>
	out.println("	</tr>");
	out.println("	<tr align=center height=25>");
	out.println("		<td class=bu_2 valign=top><font color='red'><b>일</b></font></td>"); 
	out.println("		<td class=bu_2 valign=top><b>월</b></td>");
	out.println("		<td class=bu_2 valign=top><b>화</b></td>");
	out.println("		<td class=bu_2 valign=top><b>수</b></td>");
	out.println("		<td class=bu_2 valign=top><b>목</b></td>");
	out.println("		<td class=bu_2 valign=top><b>금</b></td>");
	out.println("		<td class=bu_2 valign=top><font color='blue'><b>토</b></font></td>");
	out.println("	</tr>");

	for(int i = 0; i < col; i++){
		out.println("<tr align=left height=100>");
		for(int j = 0; j < row; j++){
			out.println("<td class=inp width=80 bgcolor='#FCFDFE' valign=top>");
			if(day <= lastDay){
				//첫 주 시작하는 날 전까지는 빈칸으로 채우기
				if(i == 0 && (j+1) < firstDay){
					out.println("&nbsp;");
					continue;
				}
				String d = String.valueOf(year);
				String e,f;
				if(month+1<10){
					e = "0"+String.valueOf(month+1);
				}else{
					e = String.valueOf(month+1);
				}
				if(day<10){
					f = "0"+String.valueOf(day);
				}else{
					f = String.valueOf(day);
				}
				String g = d+"-"+e+"-"+f;
				java.util.Date actdate; //스트링을 date로 저장할 변수
				actdate = new SimpleDateFormat("yyyy-MM-dd").parse(g); 
				
				if(j == 0){ //일요일
					if(sr>0){
					for(int r=0; r<sr; r++){
						if(g.equals(request.getAttribute("list2.get("+ r +").getGame_day()").toString())){
				        	if((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime()))){
								out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='orange' style='text-decoration: none;'><b>" + day++ + "!</b></font></a>"+printToday(todayYear, year, todayMonth, month, todayDate, day)+ "<br />");
							  	for(int o=0; o<sr; o++){
							    	if(g.equals(request.getAttribute("list2.get("+ o +").getGame_day()"))){
							    		out.println("<font size='1'>"+ request.getAttribute("list2.get("+ o +").getGame_time()")+"</font><br />");
							      	} 
							  	}break;  
				            }else{
				            	out.println("<font color='orange' style='text-decoration: none;'><b>" + day++ + "</b></font></a>"+printToday(todayYear, year, todayMonth, month, todayDate, day)+ "<br />");
								for(int o=0; o<sr; o++){
									if(g.equals(request.getAttribute("list2.get("+ o +").getGame_day()"))){
										out.println("<font size='1'>"+ request.getAttribute("list2.get("+ o +").getGame_time()")+"</font><br />");
									} 
								}break;
				             }
						}else{
	                    	if(r == sr-1 &&  ((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime())))){
	                        	out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='red' style='text-decoration: none;'><b>" + day++ + "</b></font></a>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
	                        }else if(r ==sr-1){
	                          	out.println("<font color='red' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
	                        }
						}
					}
					}else{
						if((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime()))){
                        	out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='red' style='text-decoration: none;'><b>" + day++ + "</b></font></a>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
                        }else{
                          	out.println("<font color='red' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
                        }
					}
				}else if(j == 6){ //토요일
					if(sr>0){
					for(int r=0; r<sr; r++){
						if(g.equals(request.getAttribute("list2.get("+ r +").getGame_day()").toString())){
							if((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime()))){		
								out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='orange' style='text-decoration: none;'><b>" + day++ + "</b></font></a>"+printToday(todayYear, year, todayMonth, month, todayDate, day)+ "<br />");
								for(int o=0; o<sr; o++){
								    if(g.equals(request.getAttribute("list2.get("+ o +").getGame_day()"))){
								    	out.println("<font size='1'>"+ request.getAttribute("list2.get("+ o +").getGame_time()")+"</font><br />");
								    } 
								}break;  
					        }else{
					     		out.println("<font color='orange' style='text-decoration: none;'><b>" + day++ + "</b></font></a>"+printToday(todayYear, year, todayMonth, month, todayDate, day)+ "<br />");
							 	for(int o=0; o<sr; o++){
									if(g.equals(request.getAttribute("list2.get("+ o +").getGame_day()"))){
										out.println("<font size='1'>"+ request.getAttribute("list2.get("+ o +").getGame_time()")+"</font><br />");
									} 
								}break;
					        }
						}else{
							if(r == sr-1 &&  ((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime())))){
		                		out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='blue' style='text-decoration: none;'><b>" + day++ + "</b></font></a>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
		               		}else if(r ==sr-1){
		                   		out.println("<font color='blue' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
		                	}
						}
					}
					}else{
						if((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime()))){
	                		out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='blue' style='text-decoration: none;'><b>" + day++ + "</b></font></a>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
	               		}else{
	                   		out.println("<font color='blue' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
	                	}
					}
				}else{  //평일
					if(sr>0){
					for(int r=0; r<sr; r++){
						if(g.equals(request.getAttribute("list2.get("+ r +").getGame_day()").toString())){
							if((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime()))){			
								out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='orange' style='text-decoration: none;'><b>" + day++ + "</b></font></a>"+printToday(todayYear, year, todayMonth, month, todayDate, day)+ "<br />");
								for(int o=0; o<sr; o++){
									if(g.equals(request.getAttribute("list2.get("+ o +").getGame_day()"))){
										out.println("<font size='1'>"+ request.getAttribute("list2.get("+ o +").getGame_time()")+"</font><br />");
								    } 
								}break;  
					        }else{
					        	out.println("<font color='orange' style='text-decoration: none;'><b>" + day++ + "</b></font></a>"+printToday(todayYear, year, todayMonth, month, todayDate, day)+ "<br />");
								for(int o=0; o<sr; o++){
									if(g.equals(request.getAttribute("list2.get("+ o +").getGame_day()"))){
										out.println("<font size='1'>"+ request.getAttribute("list2.get("+ o +").getGame_time()")+"</font><br />");
									} 
								}break;
					        }
						}else{
							if(r == sr-1 &&  ((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime())))){
		                    	out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='black' style='text-decoration: none;'><b>" + day++ + "</b></font></a>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
		                	}else if(r ==sr-1){
		                       	out.println("<font color='black' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
		                    }
						}
					}
				}else{
					if((mastercheck == 1 || mastercheck == 2)&&((actdate != null) && (actdate.getTime()>thisdate.getTime()))){
                    	out.println("<a href='CreateTeamMatchForm.action?stadium_no="+stadium_no+"&game_day="+g+"'><font color='black' style='text-decoration: none;'><b>" + day++ + "</b></font></a>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
                	}else{
                       	out.println("<font color='black' style='text-decoration: none;'><b>" + day++ + "</b></font>" + printToday(todayYear, year, todayMonth, month, todayDate, day));
                    }
				}
				}
			}else{
				out.println("&nbsp;");
			}
			out.println("</td>");
		}
		out.println("</tr>");

		//해당 달의 1일이 금요일이나 토요일로 시작해서 5줄로 출력이 불가능한 경우 한 줄 추가
		if(((i+1) == col) && (lastDay > (day-1))){
			col++;
		}
	}
	out.println("</table>");
	
	String stadiumNo = request.getAttribute("stadium_no").toString();
%>

<%!
     
	
//연도, 달 이동 헬퍼 메소드
	private String traverseDate(String type, int year, int month,int stadium_no, int currentPage ){
		String href = "";
		if(type.equals("upYear")){
			href = "./StadiumView.action?stadium_no="+stadium_no+"&currentPage="+currentPage+"&year=" + (year+1) + "&month=" + month;
		}else if(type.equals("downYear")){
			href = "./StadiumView.action?stadium_no="+stadium_no+"&currentPage="+currentPage+"&year=" + (year-1) + "&month=" + month;
		}else if(type.equals("upMonth")){
			if(month == 11){
				href = "./StadiumView.action?stadium_no="+stadium_no+"&currentPage="+currentPage+"&year=" + (year+1) + "&month=0";
			}else{
				href = "./StadiumView.action?stadium_no="+stadium_no+"&currentPage="+currentPage+"&year=" + year + "&month=" + (month+1);
			}
		}else if(type.equals("downMonth")){
			if(month == 0){
				href = "./StadiumView.action?stadium_no="+stadium_no+"&currentPage="+currentPage+"&year=" + (year-1) + "&month=11";
			}else{
				href = "./StadiumView.action?stadium_no="+stadium_no+"&currentPage="+currentPage+"&year=" + year + "&month=" + (month-1);
			}
		}
		return href;
	}
	
	//오늘 일자 찍기 헬퍼 메소드
	private String printToday(int todayYear, int year, int todayMonth, int month, int todayDate, int day){
		if(todayYear == year && todayMonth == month && todayDate == day){
			return "&nbsp;<b>Today</b>";
		}
		return "";
	}
	
	private String print(){
		
			return "&nbsp;<font color='orange' style='text-decoration: none;'><b>Reserved</b></font>";
		
	}
	
%>

<table width="370" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr><td height="30"></td></tr>
    <tr>
    	<td align="right" colspan="10">
			<s:if test="#session.session_adminYN == 1">
        	<input name="list" type="button" value="수정" style="width: 85px; height: 35px;" class="bu_2" onClick="javascript:location.href='StadiumModifyForm.action?stadium_no=<s:property value="stadium_no"/>&currentPage=<s:property value="currentPage"/>'"> 
            <input name="list" type="button" value="삭제" style="width: 85px; height: 35px;" class="bu_2" onClick="javascript:location.href='StadiumDelete.action?stadium_no=<s:property value="stadium_no"/>&currentPage=<s:property value="currentPage"/>'">
            </s:if>
             
            <input name="list" type="button" value="목록" style="width: 85px; height: 35px;" class="bu_2" onClick="javascript:location.href='StadiumList.action?currentPage=<s:property value="currentPage" />'">
        </td>
    </tr>
    <tr height="100"></tr>          
</table>      
</div>




</body>
</html>
