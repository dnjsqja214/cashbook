<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<select type="radio" name="memberGender">
					<option value="">등급선택</option>
	                <option value="man">남자</option>
	                <option value="womㅁn">여자</option>
	            </select>
			</td>
		</tr>
		<tr>
			<th>성함</th>
			<td>
				<input type="text" name="memberName">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>