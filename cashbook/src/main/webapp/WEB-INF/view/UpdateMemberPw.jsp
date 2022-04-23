<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 수정</h1>
	<form method="post" action="UpdateMemberPwController">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="memberId" value=<%=session.getAttribute("sessionMemberId")%> readonly="readonly"></td>
		</tr>
		<tr>
			<th>현재 비밀번호</th>
			<td>
				<input type="password" name="currentPw">
			</td>
		</tr>
		<tr>
			<th>수정 비밀번호</th>
			<td>
				<input type="password" name="updatePw">
			</td>
		</tr>
		<tr>
			<th>수정 비밀번호 확인</th>
			<td>
				<input type="password" name="checkPw">
			</td>
		</tr>
	</table>
	<div>
		<button type="submit">수정</button>
	</div>
	</form>
</body>
</html>