<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


<meta charset="EUC-KR">
<title>admin index</title>

<style>
ul li{list-style: none;}
*{margin:0;padding:0;}
a{text-decoration: none; color: black;}
h3{text-align: center;padding: 20px;}
p{margin: 50px 0;}
.row{margin-top: 50px}
.wrap{width:960px;margin:0 auto;}
        #main_header{position:relative;height:80px;margin-top:20px; }
        #main_header .logo h1{font-family:Oswald;}
        #main_header #main_lnb {position:absolute;right:0;top:20px;}
        #main_header #main_lnb li{display:inline-block;}
        #main_header #main_lnb li a{color:#000;padding:10px;font-weight:700;}
        #main_header #main_lnb li a:hover{color:red;}
.add_btn{margin-left:20px; border-radius: 3px; padding: 5px 10px;}
.col-sm-6{max-width: 270px;}
.card{border: 1px solid black; background-color: black;}
.card-title{color: #fff;}
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
<div>
		
		<div id="main_header" class="wrap">
			<div id="logo">
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
		<hr>


	<div class="row">
		<div class="col-sm-3"></div>
	  <div class="col-sm-6">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">회원관리</h5>
	        <p class="card-text"></p>
	        <a href="member/list" class="btn btn-light">Click Here >></a>
	      </div>
	    </div>
	  </div>
	  <div class="col-sm-6">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">게시물관리</h5>
	        <p class="card-text"></p>
	        <a href="post/list" class="btn btn-light">Click Here >></a>
	      </div>
	    </div>
	  </div>
	   <div class="col-sm-6">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">댓글관리</h5>
	        <p class="card-text"></p>
	        <a href="reply/list" class="btn btn-light">Click Here >></a>
	      </div>
	    </div>
	  </div>
	</div>


	
	
	

</div>
</body>
</html>