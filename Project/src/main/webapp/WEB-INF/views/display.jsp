<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<title></title>

<style>

.carousel-item,
.carousel-inner,
.carousel-inner img {
  height: 100%;
  width: 100%;
}
.carousel-item {
  text-align: center;
}
.carousel {
  height: 600px;
}
.card{
	max-width: 300px;
}
#thumimg{
	height: 290px;
	width: 100%; 
}
ul li{
	list-style: none;
	margin: 0 auto;
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
footer {
    padding: 30px 0;
    text-align: center;
    background: #ccc;
    color: #fff;
    margin-top: 200px;
}
.row{
	margin-top: 20px;
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

</style>

</head>
<body>
	<div class="container">
		
		<div id="header">
			<div id="logo">
				<h1>WDYS</h1>
			
			</div>
			
				<nav>
					<ul class="menu">
					 	<c:if test="${sessionScope.member == null }">
							<li><a href="login">로그인  |</a></li>
							<li><a href="signup">회원가입</a></li>
						</c:if>
					</ul>
					<ul class="menu">
						<c:if test="${sessionScope.member != null}">
							<li>${sessionScope.member.name} 님  | </li>	
						 	<li><a href="logout">로그아웃  | </a></li>
						 	<li><a href="board/list">마이페이지</a></li>	 
						</c:if> 
					</ul>
				</nav>
				
		</div>
	<hr>
			
<!-- 캐러셀 -->
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			   		<img src="resources/img/display_img1.png" class="d-block w-100" alt="전시포스터1">
			    </div>
			    <div class="carousel-item">
			      <img src="resources/img/display_img2.png" class="d-block w-100" alt="전시포스터2">
			    </div>
			    <div class="carousel-item">
			      <img src="resources/img/display_img3.png" class="d-block w-100" alt="전시포스터3">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
		</div>
		
		<nav class="navbar navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand"></a>
		    <form class="d-flex">
		      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
		      type="text" name="keyword" value="${pager.keyword}">
		      <button class="btn btn-outline-secondary" type="submit">Search</button>
		    </form>
		  </div>
		</nav>
		 	
			<%-- <div>
				<form>
					<div>
						<select>
							<option value="0">전체 검색</option>
						</select>
					</div>
					<div>
						<input type="text" name="keyword" value="${pager.keyword}">
					</div>
					<div>
						<button>검색</button>
					</div>
				</form>
			</div> --%>
			
			
<!-- 카드형식  -->
<div class="row row-cols-1 row-cols-md-4 row-cols-2 g-4">
  <c:forEach var="item" items="${list}">
  <div class="col">
    <div class="card h-100">
      <a href="select/${item.boardNumber}"><img src="${item.thumbnail}" class="card-img-top" alt="썸네일" id="thumimg"></a>
      <div class="card-body">
        <h5 class="card-title">${item.title}</h5>
        <p class="card-text">작성자: ${item.id}</p>
      </div>
      <div class="card-footer">
        <small class="text-muted">${item.boardDate}</small>
      </div>
    </div>
  </div>
  </c:forEach>
  
 
</div>

<!-- 페이지네이션  -->
			<div class="row">
				<div class="col-4"></div>
				<table class="col-4">
					<tr>
						<td colspan="5">
							
							<div  class="pagination justify-content-center">
								<div class="page-item"><a href="?page=${pager.prev}&${pager.query}" class="page-link" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></div>
									
											<c:forEach var="page" items="${pager.list}">
												<div class="page-item ${pager.page == page ? 'active' : ''}"><a href="?page=${page}&${pager.query}" class="page-link">${page}</a></div>
											</c:forEach>
									
								<div class="page-item"><a href="?page=${pager.next}&${pager.query}" class="page-link" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></div>			
							</div>
							
						</td>
					</tr>
				</table>
				<div class="col-4"></div>
			</div>
	</div>
	
		<footer>Copyright(c) 2021 WDYS All rights reserved</footer>
		
	
</body>
</html>