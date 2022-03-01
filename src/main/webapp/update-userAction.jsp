<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="dbconn.jsp" %>

<%PreparedStatement pstmt=null;
request.setCharacterEncoding("UTF-8");
String userID=request.getParameter("userID");
String userPassword=request.getParameter("userPassword");
String userName=request.getParameter("userName");
String userGender=request.getParameter("userGender");
String userEmail=request.getParameter("userEmail");





try{
	String sql=
			 "update log0108 set UserPassword=?,UserName=?,UserGender=?,UserEmail=? where UserID=?";
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(5, userID);
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userName);
			pstmt.setString(3, userGender);
			pstmt.setString(4, userEmail);

			pstmt.executeUpdate();

			System.out.println("수정성공");
			}
			catch(SQLException e){
				System.out.print("수정실패");
				e.printStackTrace();
				
			}finally{
				if (pstmt !=null)
					pstmt.close();
				if (conn !=null)
					conn.close();
			}
			%><script>

			alert("수정이 완료되었습니다.");
			history.back();

			</script>
}


</body>
</html>