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
*{margin: 0 auto;}
h2{text-align: center;}
ul li{list-style: none;}
*{margin:0;padding:0;}
a{text-decoration: none; color: black;}
h3{text-align: center;padding: 20px;}
table{margin: 20px 20px; }
.wrap{width:960px;margin:0 auto;}
        #main_header{position:relative;height:80px;margin-top:20px; }
        #main_header .logo h1{font-family:Oswald;}
        #main_header #main_lnb {position:absolute;right:0;top:20px;}
        #main_header #main_lnb li{display:inline-block;}
        #main_header #main_lnb li a{color:#000;padding:10px;font-weight:700;}
        #main_header #main_lnb li a:hover{color:red;}
#con{ 
	width: 40%;
	margin-left: 560px;
	}
@font-face {
    font-family: 'twaysky';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#logo{
	margin-top: 30px;
	font-family: 'twaysky';
}
#logo h1{font-size: 35px;}
footer {
    padding: 30px 0;
    text-align: center;
    background: #ccc;
    color: #fff;
    margin-top: 250px;
}
</style>

</head>
<body>
	<div>
		<div id="main_header" class="wrap">
			<div id="logo">
				<h1><a href="/admin/index">WDYS</a></h1>
			</div>
			<c:if test="${sessionScope.member != null }">
					<nav id="main_lnb">
						<ul>
							<li>${sessionScope.member.name} 님</li>	
						 	<li><a href="../../logout">로그아웃</a></li>
						 </ul>
					</nav>
			</c:if>
		</div>
		
		<hr>
	
		<h2>What do you see?</h2>
		
			
			<form method="post" enctype="multipart/form-data"  class="form-horizontal">
				<div class="col-sm-2"></div>
				<div>
					<input value="<%= sf.format(nowTime) %>" type="text" name="boardDate" class="date" style="margin-left: 260px; margin-bottom: 10px; border: none;" > 
				</div>
				<div class="form-group form-group-sm">
				<div class="col-sm-2"></div>
					<label  class="col-sm-2 control-label">전시명</label>
					<div class="col-sm-4">
					<input type="text" name="title" class="form-control" value="${item.title}">
					</div>
				</div>
				<div class="form-group form-group-sm">
				<div class="col-sm-2"></div>
					<label class="col-sm-2 control-label">URL</label>
					<div class="col-sm-4">
					<input type="text" name="url" class="form-control" value="${item.url}">
					</div>
				</div>
				
				<div class="form-group form-group-sm" id="con">
				<div class="col-sm-2"></div>
					<label class="col-sm-2 control-label">내용</label>
					<textarea name="context" cols="60" rows="30" id="summernote">${item.context}</textarea>
				</div>
				<div id="thumbnail">
					<input type="hidden" name="thumbnail" value="">
				</div>
				
					<div class="form-group form-group-sm">
				<div class="col-sm-8"></div>
				<button id="submit" style="padding: 3px 5px; margin: 10px auto">변경</button>
				
			</div>
			</form>
			
			
	</div>
			
		
	<footer>Copyright(c) 2021 WDYS All rights reserved</footer>
	
	
</body>
</html>