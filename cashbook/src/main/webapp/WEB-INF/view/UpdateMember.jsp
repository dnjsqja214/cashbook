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
</style>
</head>
<jsp:include page="/WEB-INF/view/upMenu.jsp"></jsp:include>
<body>
	<div class="container"><br>
	<h2 class = "text-center bottom top">비밀번호 수정</h2>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
		<form method="post" action="UpdateMemberController">
			<table class="table table-bordered">
				<tr>
					<th class="table-info" width="150">아이디</th>
					<td width="550"><%=session.getAttribute("sessionMemberId")%></td>
					<input type="hidden" name="memberId" value=<%=session.getAttribute("sessionMemberId")%> readonly="readonly">
				</tr>
				<tr>
				<th class="table-info">성별</th>
				<td>
					<div>
						<input type = "radio" name = "memberGender" value="여자">여자
		         		<input type = "radio" name = "memberGender" value="남자">남자
		         	</div>
				</td>
				</tr>
				<tr>
					<th class="table-info">닉네임</th>
					<td>
						<input type="text" name="memberName" class = "form-control" value="<%=request.getParameter("memberName")%>">
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