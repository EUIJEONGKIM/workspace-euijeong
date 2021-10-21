<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
h3{text-align: center;padding: 20px; border-top: 1px solid black;}
table{margin: 20px 20px; }
.wrap{width:960px;margin:0 auto;}
        #main_header{position:relative;height:80px;margin-top:20px; }
        #main_header .logo h1{font-family:Oswald;}
        #main_header #main_lnb {position:absolute;right:0;top:20px;}
        #main_header #main_lnb li{display:inline-block;}
        #main_header #main_lnb li a{color:#000;padding:10px;font-weight:700;}
        #main_header #main_lnb li a:hover{color:red;}
.add_btn{margin-left:20px; border-radius: 3px; padding: 5px 10px;}

</style>
<script>

</script>
</head>
<body>
	<div>
		
		<div id="main_header" class="wrap">
			<div class="logo">
				<h1><a href="../display">WDYS</a></h1>
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
		<div>
			<h3>Member List</h3>

<!-- 테이블 -->				
				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
						<table class="table table-hover">
							<thead class="table-dark">
								<tr>
									<th>글번호</th>
									<th>회원번호</th>
									<th>글제목</th>		
									<th>작성일</th>		
									<th>관리</th>		
								</tr>
							</thead>
							<tbody>
								<c:if test="${postList.size() < 1 }" >
									<tr>
										<td colspan="4">등록된 글이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="item" items="${postList}">
									<tr>
										<td>${item.boardNumber}</td>
										<td>${item.id}</td>
										<td>${item.title}</td>
										<td>${item.boardDate}</td>
										<td><a href="update?boardNumber=${item.boardNumber}" class="update_btn btn btn-outline-secondary">변경</a>
										<a href="delete?boardNumber=${item.boardNumber}" class="delete_btn btn btn-outline-danger">삭제</a></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="5">
										<div  class="pagination justify-content-center">
											<div class="page-item"><a href="?page=1&${pager.query}" class="page-link">처음</a></div>
											<div class="page-item"><a href="?page=${pager.prev}&${pager.query}" class="page-link">이전</a></div>
												
														<c:forEach var="page" items="${pager.list}">
															<div class="page-item ${pager.page == page ? 'active' : ''}"><a href="?page=${page}&${pager.query}" class="page-link">${page}</a></div>
														</c:forEach>
												
											<div class="page-item"><a href="?page=${pager.next}&${pager.query}" class="page-link">다음</a></div>	
											<div class="page-item"><a href="${pager.last}&${pager.query}" class="page-link">마지막</a></div>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
					<div>
						<a href="add" class="add_btn btn btn-secondary">등록</a>
					</div>
					
					
				</div>
				<div class="col-2"></div>
				
			</div>
		</div>
		
	</div>
	
	
</body>
</html>