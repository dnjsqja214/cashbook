<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	input {
	  width:400px;
	  font-size:20px;
	}
</style>
</head>
<jsp:include page="/WEB-INF/view/upMenu.jsp"></jsp:include>
<body>
	<div class="container"><br>
	<h2 class = "text-center bottom top">비밀번호 수정</h2>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
		<%
			// 유효성 검사
			String error = request.getParameter("error");
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
			<table class="table table-bordered">
				<tr>
					<th class="table-info" width="150">아이디</th>
					<td width="550"><%=session.getAttribute("sessionMemberId")%></td>
					<input type="hidden" name="memberId" value=<%=session.getAttribute("sessionMemberId")%> readonly="readonly">
				</tr>
				<tr>
					<th class="table-info">현재 비밀번호</th>
					<td>
						<input type="password" name="currentPw" class = "form-control">
					</td>
				</tr>
				<tr>
					<th class="table-info">수정 비밀번호</th>
					<td>
						<input type="password" name="updatePw" class = "form-control">
					</td>
				</tr>
				<tr>
					<th class="table-info">수정 비밀번호 확인</th>
					<td>
						<input type="password" name="checkPw" class = "form-control">
					</td>
				</tr>
			</table>
				<div>
					<a class="btn btn-outline-secondary" role="button" href="<%=request.getContextPath()%>//SelectMemberOneController?MemberId=<%=session.getAttribute("sessionMemberId")%>">뒤로가기</a>
					<button class="btn btn-outline-success float-right" type="submit">수정</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>