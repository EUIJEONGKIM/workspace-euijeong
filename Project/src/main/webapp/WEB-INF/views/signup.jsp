<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
	let check_id = false;	

	function checkId_Async() {
		const form = document.signupForm;

		const xhr = new XMLHttpRequest();

		xhr.open("GET","checkId?id=" + form.id.value, true);

		xhr.onreadystatechange = function () {
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					if(xhr.responseText == 'OK'){
						check_id = true;
						alert("사용 가능한 회원번호입니다.");
					} else {
						alert("이미 중복된 회원번호입니다.");
					}
				}
			}
		};

		xhr.send();

		console.log("결과1: "+xhr.responseText);
	}

	function signup() {
		const form = document.signupForm;
		
		console.log("시작")
		if(form.id.value == ''){
			alert("아이디를 입력해주세요");
			form.id.focus();
			return;
		}
		if(!check_id){
			alert("아이디 중복 검사를 해주세요");
			return;
		}
		
		if(form.passwd.value == ''){
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();
			return;
		}
		if (form.passwd.value != form.passwd_check.value) {
			alert("비밀번호가 일치하지 않습니다")
			form.passwd_check.focus();
			return;
		}
		if (form.name.value == '') {
			alert("성명을 입력해주세요");
			form.name.focus();
			return;
		}
		if(form.tel.value == ''){
			alert("전화번호를 입력해주세요");
			form.tel.focus();
			return;
		}
		console.log("submit  전")
		
		form.submit();
		
		console.log("submit  후")
	}
	
	function changeId() {
		check_id = false;
	}
	
</script>

<style>
#wrap{padding:40px 250px;}
h3{text-align: center; padding: 30px 0;}

.signup_btn{margin: 10px 0;}

.form-control, .form-group{
	width:800px;
}
.form{
	margin: 0 auto;
	display: inline-block;
}
</style>

</head>
<body>
	<div id="wrap">
	<div class="container row" >
		<h3>회원가입</h3>
		<div class="col-2"></div>
		<div class="col-8">
		<form method="post" name="signupForm" >
			<div class="form-group">
				<label>아이디</label> 
				<input type="text" name="id" onchange="changeId()" class="form-control">
				<div onclick="checkId_Async()" class="btn btn-sm btn-outline-secondary" style="margin-top: 3px;">중복확인</div>
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="passwd" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호 확인</label>
				<input type="password" name="passwd_check" class="form-control">
			</div>
			<div class="form-group">
				<label>성명</label>
				<input type="text" name="name" class="form-control">
			</div>
			<div class="form-group">
				<label>전화번호</label>
				<input type="text" name="tel" class="form-control">
			</div>
		</form>
		<div class="signup_btn">
			<button onclick="signup()" class="btn btn-dark">가입하기</button>
		</div>
		</div>
		<div class="col-2"></div>
	</div>
	</div>
</body>
</html>