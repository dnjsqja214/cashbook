<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
	
	String error = request.getParameter("error");
	
	%>
</head>
<body>
	<h1>비밀번호 수정</h1>
	<%
	String code = "";
	if("1".equals(error)){
		code = "현재 비밀번호 올바르지 않습니다.";
	}
	if("2".equals(error)){
		code = "변경할 비밀번호와 비밀번호 확인이 동일하지 않습니다.";
	}
	
	%>
	<!-- 에러코드에 따라 출력 -->
	<span style="color: red;"><%=code %></span>
	
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