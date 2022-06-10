<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<body>
	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
		&nbsp;
	 	<a class="navbar-brand" href="<%=request.getContextPath()%>/CashBookListByMonthController"><strong><h4>Cashbook</h4></strong></a>
	 	<div class="col-lg-9 text-right"></div>
		 	<a class="text-dark" href="<%=request.getContextPath()%>/SelectMemberOneController?MemberId=<%=session.getAttribute("sessionMemberId")%>">[<%=session.getAttribute("sessionMemberId")%>]</a>님 반갑습니다. &nbsp;&nbsp;
		    <a class="text-danger" href="<%=request.getContextPath()%>/LogoutController">로그아웃</a>
	</nav>
</body>
</html>