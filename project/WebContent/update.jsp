<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>

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
		 
	 } if(userID==null){
		 
		 PrintWriter script =response.getWriter();
		 script.println("<script>");
		 script.println("alert('로그인을 하세요')");
		 script.println("location.href='login.jsp'");
		 script.println("</script>");
		 
	 }
	 
	 int bbsID=0;
	 
	 	if(request.getParameter("bbsID") != null){
	 		
	 		bbsID=Integer.parseInt(request.getParameter("bbsID"));
	 			
	 		}if(bbsID == 0){
	 			
	 			PrintWriter script =response.getWriter();
	 			script.println("<script>");
	 			script.println("alert('유효하지 않은 글입니다.')");
	 			script.println("location.href='bbs.jsp'");
	 			script.println("</script>");
	 			
	 	}
	 		Bbs bbs = new BbsDAO().getBbs(bbsID);
	 		if(!userID.equals(bbs.getUserID())){
	 			
	 			PrintWriter script =response.getWriter();
	 			script.println("<script>");
	 			script.println("alert('권한이 없습니다')");
	 			script.println("location.href='bbs.jsp'");
	 			script.println("</script>");
	 			
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
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<!-- 눌렀을 때 나오는 메뉴가 나오도록 생성  -->
					
			<ul class="dropdown-menu">
				<li><a href="logoutAction.jsp">로그아웃</a></li>
				<!-- class="active"는 현재 눌린 페이지를 의미한다 -->
			</ul>
				</li>
			</ul>
		</div>
	</nav>

<div class="container">
	<div class="row">
	 <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
		<table class="table table-striped" style="text-align:center; borded:1px solid #dddddd">
		<!-- 홀수와 짝수가 번갈아가면서 색상이 변경이 되도록 하여 눈에 더 잘 들어오게 하는 역할 -->
		
			<thead>
				<tr>
					<th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
				</tr>
				<tr>
					<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%= bbs.getBbsContent() %></textarea></td>											
				</tr>
			</tbody>
		 </table>
		 
		 <input type="submit" class="btn btn-primary pull-right" style="background-color:#eeeeee; border-radius:0px; padding: 10px 10px 10px 10px;
		 color:#000000; border:solid #ffffff 0px; text-decoration:none; box-shadow:#ffffff" value="글 수정">
		 
		</form>
	</div>
</div>
</body>
</html>