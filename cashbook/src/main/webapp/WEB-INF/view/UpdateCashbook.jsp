<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
   .bottom {margin-bottom:80px;}
   .top {margin-top:30px;}
</style>
<jsp:include page="/WEB-INF/view/upMenu.jsp"></jsp:include>
</head>
<body>
<%
	Cashbook c = (Cashbook)request.getAttribute("cashbook");
	String cash = c.getCashDate();
%>
	<div class="container"><br>
	<h2 class = "text-center bottom top">상세보기</h2>
	<form method="post" action="<%=request.getContextPath()%>/UpdateCashbookController">
		<table class="table table-bordered">
			<colgroup>
				<col width = "20%">
				<col width = "*">
			</colgroup>
			<tr>
				<th class="table-info text-center" width="100">가계부 넘버</th>
				<td width="500"><%=c.getCashbookNo()%>
					<input name="cashbookNo" type="hidden" value="<%=c.getCashbookNo()%>"> 
				</td>
			</tr>
			<tr>
				<th class="table-info text-center">날짜</th>
				<td>
					<input type="text" name="cashDate" value="<%=c.getCashDate()%>" readonly="readonly" class = "form-control">
				</td>
			</tr>
			<tr>
				<th class="table-info text-center">수입/지출</th>
				<td>
					<% 
						if(cash == "수입") {
					%>
							<input type="radio" name="kind" value="수입" checked="checked">수입
							<input type="radio" name="kind" value="지출">지출
					<%
						} else {
					%>
							<input type="radio" name="kind" value="수입">수입
							<input type="radio" name="kind" value="지출" checked="checked">지출
					<%
						}
					%>
				</td>
			</tr>
			<tr>
				<th class="table-info text-center">금액</th>
				<td>
					<input type="number" name="cash" class = "form-control" value="<%=c.getCash()%>">
				</td>
			</tr>
			<tr>
				<th class="table-info text-center">메모</th>
				<td>
					<textarea rows="4" cols="50" name="memo" class = "form-control"><%=c.getMemo()%></textarea>
				</td>
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
		<a class="btn btn-outline-secondary" role="button" href="<%=request.getContextPath()%>/CashBookOneController?cashbookNo=<%=c.getCashbookNo()%>">뒤로가기</a>
		<button class="btn btn-outline-success float-right" type="submit">수정</button>
	</form>
	</div>
</body>
</html>
</body>
</html>