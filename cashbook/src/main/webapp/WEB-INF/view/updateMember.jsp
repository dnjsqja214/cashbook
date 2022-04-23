<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
	         		<div><input type = "radio" name = "memberGender" value="여자">여자</div>
	         		<div><input type = "radio" name = "memberGender" value="남자">남자</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>