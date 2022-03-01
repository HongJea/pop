<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="gst.Gst" %>
    <%@ page import="gst.GstDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">

</script>
<link rel="stylesheet" href="css/custom.css">
<title>게시판 목록</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String userID = null;
 if(session.getAttribute("userID") != null){
	 userID = (String) session.getAttribute("userID");
 }
%>
 <nav class="navbar navbar-default">
  <div class="navbar-header">
  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
  aria-expanded="false">
  <span class="icon-bar"></span>
  <span class="icon-bar"></span>
  <span class="icon-bar"></span>
  </button>
  <a class="navbar-brand" href="main.jsp">커피를 찾는 사람들</a>
  </div>
  <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
  <ul class="nav navbar-nav">
  <li class="active"><a href="main.jsp">메인</a></li>
  <li><a href="gst.jsp">게시판</a></li>
  <li><a href="sin.jsp">불편신고</a></li>
  </ul>
  <%
  if(userID == null){
  %>
    <ul class="nav navbar-nav navbar-right">
  <li class="dropdown">
  <a href="#" class="dropdown-toggle"
  data-toggle="dropdown" role="button" aria-haspopup="true"
  aria-expanded="false">접속하기<span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a href="login.jsp">로그인</a></li>
    <li ><a href="join.jsp">회원가입</a></li>
  </ul>
  </li>
  </ul>
  <%
  } else{
  %>
     <ul class="nav navbar-nav navbar-right">
  <li class="dropdown">
  <a href="#" class="dropdown-toggle"
  data-toggle="dropdown" role="button" aria-haspopup="true"
  aria-expanded="false">회원관리<span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a href="logoutAction.jsp">로그아웃</a></li>
    <li><a href="update-user.jsp">회원 정보 변경</a></li>
    
  </ul>
  </li>
  </ul>
  <%
  }
  %>
  </div>
 </nav>
 <div>
   <div class="row">
   <form action="writeAction.jsp" method="post">
     <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
       <thead>
          <tr>
             <th colspan="2" style="background-color: #eeeeee; text-align: center;">글쓰기</th>
          </tr>
       </thead>
       <tbody>
       <tr>
       <td>
       <input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50">
       </td>
       </tr>
       <tr>
           <td>
           <textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea>
           </td>
       </tr>
       </tbody>
     </table>
      <input type="submit" class="btn btn-primary pull right" value="글쓰기" style="text-align: center;">
     </form>
   </div>
 </div>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script type="text/javascript" src="js/bootstrap.js">
</script>
</body>
</html>