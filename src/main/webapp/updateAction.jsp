<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="gst.GstDAO" %>
    <%@page import="gst.Gst" %>
    <%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <%
 request.setCharacterEncoding("UTF-8");
 String userID =null;
 if(session.getAttribute("userID") != null){
	 userID=(String) session.getAttribute("userID");
 }
 if(userID == null){
	 PrintWriter script = response.getWriter();
	 script.println("<script>");
	 script.println("alert('로그인을 하세요.')");
	 script.println("location.href='login.jsp'");
	 script.println("</script>");
	 }
 int bbsID=0;
 if (request.getParameter("bbsID") !=null){
	 bbsID= Integer.parseInt(request.getParameter("bbsID"));
 }
 if (bbsID==0){
	 PrintWriter script = response.getWriter();
	 script.println("<script>");
	 script.println("alert('유효하지 않는 글입니다.')");
	 script.println("location.href='gst.jsp'");
	 script.println("</script>");
 }
 Gst gst = new GstDAO().getGst(bbsID);
 if(!userID.equals(gst.getUserID())){
	 PrintWriter script = response.getWriter();
	 script.println("<script>");
	 script.println("alert('권한이 없습니다.')");
	 script.println("location.href='gst.jsp'");
	 script.println("</script>");
 }else{
	 if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null ||
			 request.getParameter("bbsTitle") == null ||request.getParameter("bbsContent") == null
			 ) {
				 PrintWriter script=response.getWriter();
				 script.println("<script>");
				 script.println("alert('제목과 내용은 필수 항목입니다.')");
				 script.println("history.back()");
				 script.println("</script>");
			 } else{
				 GstDAO gstDAO = new GstDAO();
				 int result = gstDAO.update(bbsID,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
				 if(result == -1){
					 PrintWriter script = response.getWriter();
					 script.println("<script>");
					 script.println("alert('글수정이 실패하였습니다')");
					 script.println("history.back()");
					 script.println("</script>");
				 }
				 else{
					 PrintWriter script = response.getWriter();
					 script.println("<script>");
					 script.println("location.href='gst.jsp'");
					 script.println("</script>");
				 }

 }
 }
 %>
</body>
</html>