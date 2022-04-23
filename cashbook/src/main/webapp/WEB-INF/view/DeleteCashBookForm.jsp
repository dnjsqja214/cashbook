<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteCashBook</h1>
	<form method="post" action="<%=request.getContextPath()%>/DeleteCashBookController">
		<table border="1">
			<tr>
				<td>cashNo</td>
				<td>
					<input type="text" name="cashbookNo" value="<%=(String)request.getAttribute("cashbookNo")%>" readonly="readonly">
				</td>
			</tr>
		</table>
		<button type="submit">삭제</button>
	</form>
</body>
</html>