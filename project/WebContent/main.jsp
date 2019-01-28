<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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

	<%
	
	 String userID=null;
	
	 if(session.getAttribute("userID") != null){
		 
		 userID = (String) session.getAttribute("userID");
		 
	 }
	
	%>


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
			
			<a class="navbar-brand" href="main.jsp"> rive your dream </a>
			<!-- 네비게이션에 뜨는 이름 -->
			<!-- 큰 화면일 때에는 바가 나오지 않고, 작은 화면에서는 매뉴바가 나옴 -->
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		
			<ul class="nav navbar-nav">
				<li class ="active"><a href="main.jsp">in place</a></li>
				<li><a href="bbs.jsp">daily record</a></li>
				
				<!-- 메인 게시판으로 가는 메뉴 하나, 게시판으로 사용할 메뉴 한 개를 생성하고 이름 붙임 -->
			</ul>
			
		<%
		
			if(userID ==  null){
		
		%>
		
		<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					 data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">접속하기<span class="caret"></span></a>
					 <!-- 눌렀을 때 나오는 메뉴가 나오도록 생성  -->
					 
					 <ul class="dropdown-menu">
					 	<li><a href="login.jsp">로그인</a></li>
					 	<!-- class="active"는 현재 눌린 페이지를 의미한다 -->
					 	<li><a href="join.jsp">회원가입</a></li>
					 </ul>
				</li>
			</ul>
		
		<%
		 
		} else{
					
		
		%>
		
				<ul class="nav navbar-nav navbar-rjght">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					 data-toggle="dropdown" role="button" aria-haspop="true"
					 aria-expanded="false">회원관리<span class="caret"></span></a>
					 <!-- 눌렀을 때 나오는 메뉴가 나오도록 생성  -->
					 
					 <ul class="dropdown-menu">
					 	<li><a href="logoutAction.jsp">로그아웃</a></li>
					 	<!-- class="active"는 현재 눌린 페이지를 의미한다 -->
					 </ul>
				</li>
			</ul>
			
			
		<%
		
		}
		
		%>
			
		</div>
	</nav>

	<div class="container">
	 <div class="jumbotron" style="background-color:#FFFFFF">
	 	<div class="container">
	 		 <center>
	 		 <img src="images/112211.png">
	 		 <p style="font-size : 11px">
	 		 <br>
	 		 new york is 3 hours ahead of california,<br> 
	 		 but that doesn`t make california slow.<br> 
	 		 someone graduated at the age of 22,<br> 
	 		 but waited 5 years before securing a good job.<br>
	 		 someone became a CEO at 25, and died at 50.<br>
	 		 while another became a CEO at 50, and lived to 90 years.<br>
	 		 someone is still single, while someone else got married.<br>
	 		 obama retired at 55, and trump started at 70.<br><br>
	 		 <b><i>everyone in this world works based on their time zone.</i></b><br><br>
	 		 people around you might seem to be ahead of you,<br> and some might seem to be behind you.<br>
	 		 but everyone is running their own race, in their own time.<br>
	 		 do not envy them and do on mock them.<br>
	 		 they are in their time zone, and you are in yours.<br>
	 		 life is about waiting for the right moment to act.<br><br>
	 		 <b>so, relax.</b><br>
	 		 </p>
	 		 </center>
	 	</div>
	 </div>
	</div>


</body>
</html>