<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<style>
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
.add_btn{margin-left:20px; border-radius: 3px; padding: 5px 10px;}
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
    margin-top: 200px;
}
</style>
<script>
  
</script>
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
		<div>
			<h3>Reply List</h3>

<!-- 테이블 -->				
				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
						<table class="table table-hover">
							<thead class="table-dark">
								<tr>
									<th>댓글번호</th>
									<th>글번호</th>
									<th>작성자</th>
									<th>댓글내용</th>		
									<th>작성일</th>		
									<th>관리</th>										
								</tr>
							</thead>
							<tbody>
								<c:if test="${replyList.size() < 1 }" >
									<tr>
										<td colspan="5">등록된 회원이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="item" items="${replyList}">
									<tr>
										<td>${item.replyNumber}</td>
										<td>${item.boardNumber}</td>
										<td>${item.id}</td>
										<td>${item.replyContext}</td>
										<td><fmt:formatDate value="${item.replyDate}" pattern="yyyy년 MM월 dd일"/></td>
										<td><a href="update?replyNumber=${item.replyNumber}" class="update_btn btn btn-outline-secondary">변경</a>
										<a href="delete?replyNumber=${item.replyNumber}" class="delete_btn btn btn-outline-danger">삭제</a></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								
							</tfoot>
						</table>
					
					
				</div>
				<div class="col-2"></div>
				
			</div>
		</div>
		
	</div>
	<footer>Copyright(c) 2021 WDYS All rights reserved</footer>
	
</body>
</html>