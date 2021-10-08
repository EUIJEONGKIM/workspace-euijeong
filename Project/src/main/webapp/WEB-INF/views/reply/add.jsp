<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>

<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
	<div>
		<div class="mb-3">
			<div class="mb-3">	
				<form method="post">
			  		<label for="exampleFormControlTextarea1" class="form-label">댓글</label>
			  		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContext"></textarea>
				</form>
			</div>
			<button type="button" class="btn btn-dark">등록</button>
		</div>			
	</div>
</body>
</html>