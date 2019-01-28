<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>rive your dream</title>

</head>
<body>

<% 
	String userID=null;

	if(session.getAttribute("userID") != null){

	userID=(String) session.getAttribute("userID");
	
	} 
	if(userID == null){
	
	  PrintWriter script = response.getWriter();
	  script.println("<script>");
	  script.println("alert('로그인을 하세요')");
	  script.println("location.href='login.jsp'");
	  //로그인 페이지로
	   
	   script.println("</script>");

	}
	
	 int bbsID=0;
	 
	 	if(request.getParameter("bbsID") != null){
	 		
	 		bbsID=Integer.parseInt(request.getParameter("bbsID"));
	 			
	 		}
	 	if(bbsID == 0){
	 			
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
	 			
	 		} else{
		
		if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
			|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")){
					
			PrintWriter script = response.getWriter();
			script.println("<script>");  
			script.println("alert('입력이 안 된 사항이 있습니다')");
			//입력을 하는 공간이 null 값일 때 출력될 메시지 출력
					 
			script.println("history.back()");
			//하나라도 입력이 안 됐을 때에는 이전 페이지로 사용자를 이동시킴
					 
			script.println("</script>");
					
			} else{
					
			BbsDAO bbsDAO =new BbsDAO();
					
			int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
					   
						
		if(result == -1){
						   
			PrintWriter script = response.getWriter();
			script.println("<script>");  
			script.println("alert('글 수정에 실패했습니다')");
			//데이터베이스 오류가 나는 경우는 프라이머 키로 설정한 아이디가 존재할 때이므로 해당 메시지를 출력하도록 함
						   
			script.println("history.back()");
			//이전 페이지로 사용자를 이동시킴(로그인 페이지로)
						   
			script.println("</script>");
						   
			} else{
						   
			PrintWriter script = response.getWriter();
			script.println("<script>");  
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
						   
				}
			}	
		
	}

	%>

	
</body>
</html>