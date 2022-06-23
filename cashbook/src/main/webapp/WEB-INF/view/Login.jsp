<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<br><br><br>
	<h2 class="text-center">Login</h2>
	<form method="post" id="login" action="<%=request.getContextPath()%>/LoginController">
    <div class="form-group">
		Username:
		<input type="text" class="form-control" id="uname" placeholder="Enter username" name="memberId" required value="guest">
		<span id="helpId"></span>
    </div>
    <div class="form-group">
		Password:
		<input type="password" class="form-control" id="pw" placeholder="Enter password" name="memberPw" required value="1234">
		<span  id="helpPw"></span>
    </div>
	<div>
    	<button id="btn" class="btn btn-primary btn-block" type="button" >Login</button>
		<a class="float-right btn btn-info btn-block" role="button" href="<%=request.getContextPath()%>/InsertMemberController">회원가입</a>
	</div>
 	</form>
</div>
<script>
$('#btn').click(function(){
	if($('#uname').val() == ''){
		$('#helpId').text('아이디를 입력해주세요').css("color","red");
	} else {
		$('#helpId').text('');
	}
	if($('#pw').val() == '') {
		$('#helpPw').text('비밀번호를 입력해주세요').css("color","red");
	} else {
		$('#helpPw').text('');
	}
	if($('#uname').val() != '' && $('#pw').val() != '') {
		$("#login").submit();
	}
});
</script>
</body>
</html>