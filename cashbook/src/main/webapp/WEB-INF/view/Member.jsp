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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
   .bottom {margin-bottom:80px;}
   .top {margin-top:30px;}
   .plus {color : #487AB8;}
   .minus {color: #e33950f2;}
	hr {margin-top: 1.5rem;}
</style>
</head>
<jsp:include page="/WEB-INF/view/upMenu.jsp"></jsp:include>
<body>
	<div class="container"><br>
	<h2 class = "text-center bottom top">개인정보</h2>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
		<a class="btn btn-outline-secondary" role="button" href="<%=request.getContextPath()%>/CashBookListByMonthController">뒤로가기</a>
		<table class="table table-bordered">
			<tr>
				<th class="table-info" width="100">아이디</th>
				<td width="500"><%=m.getMemberId()%></td>
			</tr>
			<tr>
				<th class="table-info" width="100" >성함</th>
				<td width="500"><%=m.getMemberName()%></td>
			</tr>
			<tr>
				<th class="table-info" width="100">성별</th>
				<td width="500"><%=m.getMemberGender()%></td>
			</tr>
			<tr>
				<th class="table-info" width=100">생성날짜</th>
				<td width="500"><%=m.getCreateDate()%></td>
			</tr>
		</table>
		<div>
			<a class="btn btn-warning" role="button" href="<%=request.getContextPath()%>/UpdateMemberPwController">비밀번호 수정</a>
			<a class="btn btn-danger float-right" role="button" href="<%=request.getContextPath()%>/DeleteMemberController?MemberId=<%=m.getMemberId()%>">회원삭제</a> 
		</div>
		</br>
			<a class="btn btn-warning" role="button" href="<%=request.getContextPath()%>/UpdateMemberController?memberName=<%=m.getMemberName()%>">회원수정</a>
		</div>
	</div>
	</div>
</body>
</html>