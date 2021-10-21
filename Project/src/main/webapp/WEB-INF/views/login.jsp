<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="/resources/css/index.css" rel="stylesheet">

<style>
a{
	text-decoration: none;
	color: black;
}
#container{
	text-align: center;	
}
.title{
	padding: 150px 50px 30px 30px ;
	font-weight: 700;
	font-size: 40px;
}
.login_btn{
	border: 1px solid black;
	border-radius: 3px;
	background: black;
	color: #fff;
	padding: 10px 110px;
	margin-top: 20px;
}
.signup_btn{
	border: 1px solid black;
	border-radius: 3px;
	background: black;
	color: #fff;
	padding: 10px 118px;
	margin-top: 20px;
}
div{
	padding: 8px;
	text-align: center;
}
.form{

}

ul li{
	list-style: none;
	margin: 0 auto;

} 
input, a{
	width: 300px;
	height: 40px;
}
count{display: inline-block;}
</style>
</head>

<body>
	
	<div id="container">
		<div class="title_box">
			<h1 class="title">&nbsp&nbsp What do you see?</h1>
		</div>
		<div class="form">
			<form method="post">
				<c:if test="${sessionScope.member != null }">
					<nav>
						<ul>
							<li class="count">${sessionScope.member.name} 님</li>	
						 	<li class="count"><a href="logout">로그아웃</a></li>
						 </ul>
					</nav>
					</c:if>
				<c:if test="${sessionScope.member == null}">	
				<ul>
					<li>
						<div>
							<!--  <label>ID</label><br> -->
							<input type="text" name="id" placeholder="ID">
						</div>
					</li>
					<li>
						<div>
							<!--  <label>PASSWORD</label><br> -->
							<input type="password" name="passwd" placeholder="PASSWORD">
						</div>
					</li>
					<div>
						<input type="submit" value="로그인" class="login_btn">
					</div>
				</ul>
				</c:if>
			</form>
		</div>
		<div class="signup">
			<a href="signup" class="signup_btn">회원가입</a>
		</div>
	</div>
</body>
</html>