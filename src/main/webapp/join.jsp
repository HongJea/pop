<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
</script>
<link rel="stylesheet" href="css/custom.css">
<title>JSP 회원가입</title>
</head>
<body>
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
  <li><a href="main.jsp">메인</a></li>
  <li><a href="gst.jsp">게시판</a></li>
  <li><a href="sin.jsp">불편신고</a></li>
  </ul>
  <ul class="nav navbar-nav navbar-right">
  <li class="dropdown">
  <a href="#" class="dropdown-toggle"
  data-toggle="dropdown" role="button" aria-haspopup="true"
  aria-expanded="false">접속하기<span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li class="active"><a href="login.jsp">로그인</a></li>
    <li ><a href="join.jsp">회원가입</a></li>
  </ul>
  </li>
  </ul>
  </div>
 </nav>
 <div class="container" style="border:1px solid; height: 40%; width: 35%;" >
 <div class="col-la-4"></div>
    <div class="col-la-4">
        <div class="jumboron" style="padding-top:20px;">
        <form action="joinAction.jsp" method="post" name="form">
         <h3 style="text-align: center;">회원가입</h3>
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
          <div class="bin-group" data-toggle="buttons">
          <label class="bin bin-primary active">
            <input type="radio" name="userGender" autocomplete="off" value="남자" checked="checked">남자
          </label>
          <label class="bin bin-primary">
            <input type="radio" name="userGender" autocomplete="off" value="여자">여자
          </label>
          </div>
            <div class="form-group">
            <input type="text" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
          </div>
          </div>
          <input type="submit" class="btn btn-primary form-control" value="회원가입" onclick="javascript:ok()">
        </form>
        </div>
 </div>
 <br> <br> <br> <br>
 </div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script type="text/javascript" src="js/bootstrap.js">
</script>
</body>
</html>