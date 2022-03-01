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
 
<section class="container">
  <form action="./sin.jsp" class="form-inline mt-3">
  <select name="lectureDivide" class="form-control mx-1 mt-2">
     <option value="전체">전체</option>
     <option value="아이디">아이디</option>
     <option value="제목">제목</option>
     
  </select>
   <input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
  <button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
  <a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#registerModal">신고등록하기</a>
  </form>
</section>
 <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
   <div class="moal-dialog">
      <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="modal">신고하기</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <div class="modal-body">
           <form action="sendMail.jsp" method="post">
             <div class="from-group">
                 <label>보낸사람</label>
                 <input type="text" name="from" class="form-control" maxlength="30">
             </div>
             <div class="from-group">
                 <label>받는사람</label>
                 <input type="text" name="to" class="form-control" maxlength="50">
             </div>
             <div class="from-group">
                 <label>제목</label>
                 <input type="text" name="subject" class="form-control" maxlength="50">
             </div>
             <div class="from-group">
                 <label>내용</label>
                 <textarea name="content" class="form-control" maxlength="2048"></textarea>
             </div>
             <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-danger">신고하기</button>
             </div>
           </form>
         </div>
         
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