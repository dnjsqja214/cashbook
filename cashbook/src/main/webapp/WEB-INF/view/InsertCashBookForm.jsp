<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertCashBookForm</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	.bottom {margin-bottom:60px;}
	.top {margin-top:50px;}
</style>
<jsp:include page="/WEB-INF/view/upMenu.jsp"></jsp:include>
</head>
<body>
	<div class = "container">
		<h1 class = "bottom top text-center">가계부 입력하기</h1>
		<form id="insert" action="<%=request.getContextPath()%>/InsertCashBookController" method="post">
			<table class = "table table-bordered">
				<colgroup>
					<col width = "20%">
					<col width = "*">
				</colgroup>
				<tr>
					<th  class="table-info text-center">날짜</th>
					<td>
						<input type="text" name="cashDate" value="<%=(String)request.getAttribute("cashDate")%>" readonly="readonly" class = "form-control">
					</td>
				</tr>
				<tr>
					<th class="table-info text-center">수입 / 지출</th>
					<td>
						<input id="radio1" type="radio" name="kind" value="수입">수입
						<input id="radio2" type="radio" name="kind" value="지출">지출
						<div id="helpRadio"></div>
					</td>
				</tr>
				<tr>
					<th  class="table-info text-center">금액</th>
					<td>
						<input type="number" id="cash" name="cash" class = "form-control">
						<div id="helpCash"></div>
					<td>
				</tr>
				<tr>
					<th class="table-info text-center">메모</th>
					<td>
						<textarea rows="4" cols="50" id="memo" name="memo" class = "form-control" placeholder = "#해쉬태그를 추가해서 메모 해보세요!"></textarea>
						<div id="helpMemo"></div>
					<td>
				</tr>
			</table>
			<a href="<%=request.getContextPath()%>/CashBookListByMonthController" class = "btn btn-secondary">이전</a>
			<button id="btn" type="button" class="btn btn-outline-success float-right">입력</button>
		</form>
	</div>
<script>
$('#btn').click(function(){
	if($('#cash').val() == ''){
		$('#helpCash').text('금액을 입력해주세요').css("color","red");
	}else {
		$('#helpCash').text('');
	}
	if($('#memo').val() == ''){
		$('#helpMemo').text('메모를 입력을 해주세요').css("color","red");
	} else {
		$('#helpMemo').text('');
	}
	if($(':radio[name="kind"]:checked').length < 1){
		$('#helpRadio').text('수입 또는 지출 버튼을 체크해주세요').css("color","red");
	} else {
		$('#helpRaido').text('');
	}
	if($('#cash').val() != '' && $('#memo').val() != '' && $(':radio[name="kind"]:checked').length == 1) {
		$("#insert").submit();
	}
});
</script>
</body>
</html>