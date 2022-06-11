<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CashbookOne</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
   .bottom {margin-bottom:80px;}
   .top {margin-top:30px;}
   .plus {color : #487AB8;}
   .minus {color: #e33950f2;}
	hr {margin-top: 1.5rem;}
</style>
<jsp:include page="/WEB-INF/view/upMenu.jsp"></jsp:include>
</head>
<body>
<%
	Cashbook c = (Cashbook)request.getAttribute("cashbook");
	int cashbookNo = Integer.parseInt(request.getParameter("cashbookNo"));
%>
	<div class="container"><br>
	<h2 class = "text-center bottom top">상세보기</h2>
		<table class="table table-bordered">
			<tr>
				<th class="table-info text-center" width="100">가계부 넘버</th>
				<td width="500"><%=c.getCashbookNo()%></td>
			</tr>
			<tr>
				<th class="table-info text-center">날짜</th>
				<td><%=c.getCashDate()%></td>
			</tr>
			<tr>
				<th class="table-info text-center">수입/지출</th>
				<td><%=c.getKind()%></td>
			</tr>
			<tr>
				<th class="table-info text-center">비용</th>
				<td><%=c.getCash()%></td>
			</tr>
			<tr>
				<th class="table-info text-center">메모</th>
				<td><%=c.getMemo()%></td>
			</tr>
			<tr>
				<th class="table-info text-center">등록일</th>
				<td><%=c.getCreateDate()%></td>
			</tr>
			<tr>
				<th class="table-info text-center">수정일</th>
				<td><%=c.getUpdateDate()%></td>
			</tr>
		</table>
	<a class="btn btn-outline-secondary" role="button" href="<%=request.getContextPath()%>/CashBookListByMonthController">뒤로가기</a>
	<a href="<%=request.getContextPath()%>/DeleteCashBookController?cashbookNo=<%=cashbookNo%>" class="btn btn-danger float-right">삭제</a>
	<a href="<%=request.getContextPath()%>/UpdateCashbookController?cashbookNo=<%=cashbookNo%>" class="btn btn-success float-right">수정</a>
	</div>
</body>
</html>