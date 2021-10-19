<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
	$(function () {
		$("#summernote").summernote();
		
		$("#submit").click(function(){
			let item = $(".note-editing-area img").filter(":first").attr("src");
			
			$("#thumbnail input").val(item);
		});
	});
	
	
	
</script>

<style>

h2{text-align: center;}
.date{border: none;}
#con{
	width: 80%;
	margin-left: 230px;
}
</style>

</head>
<body>
	<div>
	
		<h2>What do you see?</h2>
		
			
			<form method="post" enctype="multipart/form-data"  class="form-horizontal">
				<div>
					<input value="<%= sf.format(nowTime) %>" type="text" name="boardDate" class="date" style="margin-left: 260px; margin-bottom: 10px" > 
				</div>
				<div class="form-group form-group-sm">
					<label  class="col-sm-2 control-label">전시명</label>
					<div class="col-sm-9">
					<input type="text" name="title" class="form-control" value="${item.title}">
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label">URL</label>
					<div class="col-sm-9">
					<input type="text" name="url" class="form-control" value="${item.url}">
					</div>
				</div>
				
				<div class="form-group form-group-sm" id="con">
					<label class="col-sm-2 control-label">내용</label>
					<textarea name="context" cols="60" rows="30" id="summernote">${item.context}</textarea>
				</div>
				<div id="thumbnail">
					<input type="hidden" name="thumbnail" value="">
				</div>
				
				<button id="submit" style="margin-left: 230px;">변경</button>
			</form>
			
			<div style="margin-left: 230px;">
				<a href="list">목록</a>
			</div>
			</div>
			
		
	</div>
	
	
</body>
</html>