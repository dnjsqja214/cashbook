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
</head>
<body>
<div class="container">
	<br><br><br>
	<h2 class="text-center">Login</h2>
	<form method="post" action="<%=request.getContextPath()%>/LoginController">
    <div class="form-group">
		<label for="uname">Username:</label>
		<input type="text" class="form-control" id="uname" placeholder="Enter username" name="memberId" required value="guest">
		<div class="valid-feedback">Valid.</div>
		<div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
		<label for="pwd">Password:</label>
		<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="memberPw" required value="1234">
		<div class="valid-feedback">Valid.</div>
		<div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group form-check">
		<label class="form-check-label">
	        <input class="form-check-input" type="checkbox" name="remember" required checked="checked"> I agree on blabla.
	        <div class="valid-feedback">Valid.</div>
	        <div class="invalid-feedback">Check this checkbox to continue.</div>
		</label>
    </div>
	<div>
    	<button type="submit" class="btn btn-primary">Submit</button>
		<a class="float-right btn btn-info" role="button" href="<%=request.getContextPath()%>/InsertMemberController">회원가입</a>
	</div>
 	</form>
</div>
</body>
</html>