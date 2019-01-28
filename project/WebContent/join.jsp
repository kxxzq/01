<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- 반응형에 사용되는 것을 설정 -->

<link rel="stylesheet" href="css/bootstrap.css">
<!-- CSS 폴더 안에 있는 bootstrap.css를 사용하겠다는 의미-->
<link rel="stylesheet" href="css/custom.css">

<title>rive your dream</title>
</head>
<body>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- 기본적인 설정 -->
	
	<nav class="navbar navbar-default">
	
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<!-- 총 세 개의 작대기 모양을 나오게 함 --> 
			</button>
			
			<a class="navbar-brand" href="main.jsp"> rive your dream  </a>
			<!-- 네비게이션에 뜨는 이름 -->
			<!-- 큰 화면일 때에는 바가 나오지 않고, 작은 화면에서는 매뉴바가 나옴 -->
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		
			<ul class="nav navbar-nav">
				<li class ="active"><a href="main.jsp">in place</a></li>
				<li><a href="bbs.jsp">daily record</a></li>
				
				<!-- 메인 게시판으로 가는 메뉴 하나, 게시판으로 사용할 메뉴 한 개를 생성하고 이름 붙임 -->
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					 data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">접속하기<span class="caret"></span></a>
					 <!-- 눌렀을 때 나오는 메뉴가 나오도록 생성  -->
					 
					 <ul class="dropdown-menu">
					 	<li><a href="login.jsp">로그인</a></li>
					 	<li class="active"><a href="join.jsp">회원가입</a></li>
					 	<!-- class="active"는 현재 눌린 페이지를 의미한다 -->
					 </ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="joinAction.jsp">
					<h4 style="text-align:center;">회원가입</h4>
					
						<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
						</div>
						
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
						</div>
						
						<div class="form-group" style="text-align: center;">
						<!-- 성별을 선택할 수 있는 버튼 형식으로 만듦, 오디오 버튼을 사용하고 누르기 전에는
						 남자라는 성별이 선택이 돼 있도록 설정함 -->
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
									<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="userGender" autocomplete="off" value="여자">여자
								</label>
								</div>
							</div>
							
							<div class="form-group">
								<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
							</div>
								<input type="submit" class="btn btn-primary form-control" value="회원가입">
						</form>	
					</div>
				</div>
				<div class="col-lg-4"></div>
			</div>



</body>
</html>