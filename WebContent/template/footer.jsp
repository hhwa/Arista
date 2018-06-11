<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
/* Add a dark background color to the footer */
footer {
    background-color: #2d2d30;
    color: #f5f5f5;
    padding: 32	px;
}

footer a {
    color: #f5f5f5;
}

footer a:hover {
    color: #777;
    text-decoration: none;
}
</style>
 <script>
$(document).ready(function(){
    // Initialize Tooltip
    $('a[data-toggle="tooltip"]').tooltip(); 
    
    $("#test").click(function() {
    	
    	return false;

    })
})
</script> 
</head>
<body>
<footer class="text-center">
<br>
	<a class="up-arrow" href="#" data-toggle="tooltip" title="맨 위로">
		<span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<br>
	<br>
	
	<a href="privacy.action"> 개인정보처리방침</a> &nbsp;
	<a href="promise.action"> 이용약관 </a> &nbsp;
	<a href="emailx.action"> 이메일무단수집거부 </a> &nbsp;
	
 <p><span class="glyphicon glyphicon-copyright-mark"></span>&nbsp;Copyrightⓒ 2017 Off The Match. All rights reserved. e-mail : hyunhwa91@naver.com</p>
 <p><a href="#" onclick="return false;" data-toggle="tooltip" title="bboya & huna"><img src="/Arista/template/image/footer_logo.png" width="10%"/></a></p><br>
</footer>
</body>
</html>