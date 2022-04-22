<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	Member m = (Member)request.getAttribute("member");
	String memberId = request.getParameter("memberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><%=m.getMemberId()%></td>
		</tr>
		<tr>
			<th>생성날짜</th>
			<td><%=m.getCreateDate()%></td>
		</tr>
		<tr>
			<th>성함</th>
			<td><%=m.getMemberName()%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=m.getMemberGender()%></td>
		</tr>
	</table>
	<a href="<%=request.getContextPath()%>/UpdateMemberPwController?MemberId=<%=memberId%>">수정</a>
	<a href="<%=request.getContextPath()%>/DeleteMemberController?MemberId=<%=memberId%>">삭제</a> 
</body>
</html>