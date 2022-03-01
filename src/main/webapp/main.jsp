<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script type="text/javascript">
function ok(){
	if(document.form.userID.value==""){
		alert("ID를 입력해 주세요.");
		document.form.userID.focus();
	}

	else{
		document.form.submit();
	}
	}
</script>
<title>커피를 위한 휴식</title>
</head>
<body>
<%
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
 
 <div class="container">
   <div id="Cf" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#Cf" data-slide-to="0" class="active"></li>
        <li data-target="#Cf" data-slide-to="1"></li>
        <li data-target="#Cf" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
         <div class="item active">
            <img  src="img/20170807_170719_6.jpg" style="height: 300px; width: 100%;">
         </div>
         <div class="item">
            <img  src="img/havana.jpg" style="height: 300px; width: 100%;">
         </div>
         <div class="item">
            <img  src="img/hed.jpg" style="height: 300px; width: 100%;">
         </div>
      </div>
          <a class="left carousel-control" href="#Cf" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#Cf" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
      </div>
   </div>
   
   <br><br>
   
 <div class="container" style="width: 50%;height: 100%;  float: left;">
 <div class="container">
    <div class="jumbotron" style="height: 25%; width: 45%;" align="left">
      <div class="container">
         <b>기장 홍홍커피</b>
         <p>주소:부산광역시 기장군 소정안길 68</p>
         <a class="bit btn-primary btn-pull" href="#" role="button" style="">지도보기</a>
      </div>
    </div>
    
        <div class="jumbotron" style="height: 25%; width: 45%;" align="left">
      <div class="container">
         <b>기장 홍홍커피</b>
         <p>주소:부산광역시 기장군 소정안길 68</p>
         <a class="bit btn-primary btn-pull" href="#" role="button">지도보기</a>
      </div>
    </div>
 </div>
</div>
<div class="container" style="width: 50%;height: 100%;  float: right;">
 <div class="container" style="width: 100%; height: 100%;">
   <div id="Rf" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#Rf" data-slide-to="0" class="active"></li>
        <li data-target="#Rf" data-slide-to="1"></li>
      </ol>
      <div class="carousel-inner">
         <div class="item active">
            <img  src="img/4.jpg" style="height: 500px; width: 100%;">
         </div>
         <div class="item">
            <img  src="img/5.jpg" style="height: 500px; width: 100%;">
         </div>
      </div>
          <a class="left carousel-control" href="#Rf" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#Rf" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
      </div>
   </div>
 </div>
 
 <footer>
 <h1>footer</h1>
 간단한 블로그 소개 글을 명시 할수 있습니다.
 </footer>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script type="text/javascript" src="js/bootstrap.js">
</script>
</body>
</html>