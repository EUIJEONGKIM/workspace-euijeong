<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<jsp:include page="include/head.jsp"></jsp:include>


<style>
*{margin: 0; padding: 0;}
a{text-decoration: none;color: black;}
#header {
    display: flex;
    position: relative;
    height: 80px;
    justify-content: space-between;
    align-items: center;
}
#logo{
	margin-top: 30px;
}
h2{text-align: center;}
.date{border: none;}
footer {
    padding: 30px 0;
    text-align: center;
    background: #ccc;
    color: #fff;
    margin-top: 420px;
}
#header {
    display: flex;
    position: relative;
    height: 80px;
    justify-content: space-between;
    align-items: center;
}
a {
    margin: 0;
    padding: 0;
    font-size: 100%;
    vertical-align: baseline;
    text-decoration: none;
    color: black;
}
#logo{
	margin-top: 30px;
}
#header .menu {
    display: block;
    width: auto;
    position: absolute;
    right: 0;
    top: 10px;
    background: #fff;
}
.menu li{
	display: inline-block; 
	margin-top: 35px;
}

</style>

</head>
<body>
	<div class="container">
	
		
		<div id="header">
			<div id="logo">
				<h1><a href="/display">WDYS</a> </h1>
			
			</div>
			
				<nav>
					<ul class="menu">
					 	<c:if test="${sessionScope.member == null }">
							<li><a href="/login">로그인  |</a></li>
							<li><a href="/signup">회원가입</a></li>
						</c:if>
					</ul>
					<ul class="menu">
						<c:if test="${sessionScope.member != null}">
							<li>${sessionScope.member.name} 님  | </li>	
						 	<li><a href="logout">로그아웃  | </a></li>
						 	<li><a href="/board/list">마이페이지</a></li>	 
						</c:if> 
					</ul>
				</nav>
				
		</div>
	<hr>
		
		
		<div id="section">
			<h2>${item.title}</h2>
			
			<div>${item.boardDate}</div>
			<div>작성자 ${item.id}</div>
			
			<br>
			<div>
				${item.context}	
			</div>
		
<!-- 댓글 -->			
			<hr>
			
			<div>
				<div class="mb-3">
					<div class="mb-3">	
						<form id="insertForm">
							<input type="hidden" name="boardNumber" value="${item.boardNumber}" id="boardNumber"> 
							<label for="exampleFormControlTextarea1" class="form-label">댓글</label>
							
							<c:if test="${sessionScope.member != null}">
							<input type="hidden" name="id" value="${sessionScope.member.id}" id="id"> 
					  		</c:if>
					  		
					  		<input type="text" id="replyContext" class="form-control" name="replyContext">
					  		<button type="button" class="btn btn-sm btn-dark" name="insertBtn" id="insertBtn" style="margin-top: 10px;">등록 </button>
						</form>
					</div>
					
				</div>	
			</div>
	
			<div>
				<div class="mb-3">
					<div class="mb-3">	
						<div class="replyList"></div>
					</div>
				</div>	
			</div>

	</div>
</div>	
	<footer>Copyright(c) 2021 WDYS All rights reserved</footer>	

</body>

<script>
const insertData = {
	id: $("#id").val(),
	replyContext: "",
	boardNumber: $("#boardNumber").val(),

};

$(document).ready(function(){
	replyList();
});

$("#insertBtn").click(function(){
	insertData.replyContext = $("#replyContext").val();
	
	if(insertData.id != null){
		replyInsert(insertData);
	} else {
		alert("로그인 후 이용바랍니다.");
		$("#replyContext").val('');
	}
	
});

function replyInsert(insertData) {
	$.ajax({
		url: "/select/add",
		type: "PUT",
		data: JSON.stringify(insertData),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			console.log(data);
			
			//if(data.replyNumber != 0){
				replyList(data);
				console.log(data);
				$("#replyContext").val('');
			//} 
		}
	});
}


function replyList(){
	$.ajax({
		url: "/select/list",
		method: "POST",
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			
			var a = '';
			
			for(let i=0; i < data.length ; i++){ 
	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div>'+'댓글번호 : '+data[i].replyNumber+' | 작성자 : '+data[i].id;
	                a += '<button onclick="replyDelete('+data[i].replyNumber+')" id="deleteBtn" style="margin: 8px;" class="btn btn-sm btn-outline-secondary"> 삭제 </button> </div>';
	                a += '<div class="commentContent"> <p> 내용 : '+data[i].replyContext +'</p>';
	                a += '</div></div>';
	            };	            
	            
	            $(".replyList").html(a);
	            console.log(a);
		}
	});
}

var boardNumber = '${item.boardNumber}';//게시글 번호

function replyDelete(replyNumber) {
	$.ajax({
		url: "/select/delete/" + replyNumber,
		type: "DELETE",
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			console.log(data);
			if( replyNumber === data){
				replyList();
			}
		}
		
	});
}


	
</script>
</html>