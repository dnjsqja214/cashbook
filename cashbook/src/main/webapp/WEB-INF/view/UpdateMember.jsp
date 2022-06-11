<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/view/upMenu.jsp"></jsp:include>
<body>
	<div class="container">
	<h2 class = "text-center bottom top">비밀번호 수정</h2>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
		<form method="post" action="UpdateMemberController">
			<table class="table table-bordered">
				<tr>
					<th width="150">아이디</th>
					<td width="550"><%=session.getAttribute("sessionMemberId")%></td>
					<input type="hidden" name="memberId" value=<%=session.getAttribute("sessionMemberId")%> readonly="readonly">
				</tr>
s				<tr>
				<th>성별</th>
				<td>
					<div>
						<input type = "radio" name = "memberGender" value="여자">여자
		         		<input type = "radio" name = "memberGender" value="남자">남자
		         	</div>
				</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="memberName" value="<%=request.getParameter("memberName")%>">
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