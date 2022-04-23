<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="DeleteMemberController">
<h1>회원삭제</h1>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="memberId" value=<%=session.getAttribute("sessionMemberId")%> readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="memberPw">
			</td>
		</tr>
	</table>
		<button type="submit">삭제</button>
	</div>
</form>
</body>
</html>