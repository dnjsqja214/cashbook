<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<body>
	<div class="container">
	<br><br><br>
	<h1 class="text-center">회원 가입</h1>
		<a class="btn btn-outline-secondary" role="button" href="<%=request.getContextPath()%>/LoginController">뒤로가기</a>
		<form method="post" action="<%=request.getContextPath()%>/InsertMemberController">
		<table class="table table-bordered">
		<colgroup>
			<col width = "20%" class="text-center">
			<col width = "*">
		</colgroup>
			<tr>
				<th class = "table-primary text-center">아이디</th>
				<td>
					<input type="text" name="memberId" class ="form-control">
				</td>
			</tr>
			<tr>
				<th class = "table-primary text-center">비밀번호</th>
				<td>
					<input type="password" name="memberPw" class ="form-control">
				</td>
			</tr>
			<tr>
				<th class = "table-primary text-center">성별</th>
				<td>
					<div>
						<input type = "radio" name = "memberGender" value="여자">여자
		         		<input type = "radio" name = "memberGender" value="남자">남자
		         	</div>
				</td>
			</tr>
			<tr>
				<th class = "table-primary text-center">성함</th>
				<td>
					<input type="text" name="memberName" class ="form-control">
				</td>
			</tr>
		</table>
		<div>
			<button type="submit"  class="btn btn-primary">가입</button>
		</div>
		</form>
	</div>
</body>
</html>