<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>삭제 확인</title>
	
	<script type="text/javascript">
		function locationURL() {
		
		if ( window.name == 'delete' )
			{
			alert('삭제되었습니다.');
			window.opener.parent.location.href='deletee.action?no=<s:property value="team_no" />&currentPage=<s:property value="currentPage" />';
			}	
		window.close();
		}
	</script>
</head>
<body>

  	<script>locationURL()</script>
  	
</body>
</html>