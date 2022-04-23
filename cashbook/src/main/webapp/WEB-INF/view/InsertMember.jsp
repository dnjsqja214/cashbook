<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 가입</h1>
	<form method="post" action="<%=request.getContextPath()%>/InsertMemberController">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="memberId">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="memberPw">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<div><input type = "radio" name = "memberGender" value="0">여자</div>
	         	<div><input type = "radio" name = "memberGender" value="1">남자</div>
			</td>
		</tr>
		<tr>
			<th>성함</th>
			<td>
				<input type="text" name="memberName">
			</td>
		</tr>
	</table>
	<div>
		<button type="submit">가입</button>
	</div>
	</form>
</body>
</html>