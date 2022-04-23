<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CashbookOne</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<%
	Cashbook c = (Cashbook)request.getAttribute("cashbook");
	int cashbookNo = Integer.parseInt(request.getParameter("cashbookNo"));
%>
	<div class="container">
	<h2 class="text-center">상세보기</h2>
	<a href="<%=request.getContextPath()%>/CashbookListByMonthController">가계부</a>
		<table >
				<tr>
					<th>날짜</th>
					<td><%=c.getCashDate()%></td>
				</tr>
				<tr>
					<th>수입/지출</th>
					<td><%=c.getKind()%></td>
				</tr>
				<tr>
					<th>수입/지출</th>
					<td><%=c.getCash()%></td>
				</tr>
				<tr>
					<th>메모</th>
					<td><%=c.getMemo()%></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><%=c.getCreateDate()%></td>
				</tr>
				<tr>
					<th>수정일</th>
					<td><%=c.getUpdateDate()%></td>
				</tr>
		</table>
	<a href="<%=request.getContextPath()%>/UpdateCashbookController?cashbookNo=<%=cashbookNo%>" class="btn btn-outline-info">수정</a>
	<a href="<%=request.getContextPath()%>/DeleteCashBookController?cashbookNo=<%=cashbookNo%>" class="btn btn-outline-info">삭제</a>
	</div>
</body>
</html>