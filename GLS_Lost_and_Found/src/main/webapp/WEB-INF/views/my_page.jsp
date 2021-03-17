<!-- 코드가 위 그리고 그것을 설명하는 주석이 아래 식으로 배치하겠다.  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"	
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<!--  두번째 게시판에서 참조하는 style인데 이걸 써? 말아? -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script> <!-- 삭제하기 누를 때 알럿 창이 뜨게끔 하는 함수 -->
  function delete_ok(id) {
    var a = confirm("정말로 삭제하겠습니까?");
    if (a)
      location.href = 'deleteok/' + id;
  }
</script>

<title>my_page</title>

</head>
<body>

<span id="name"> </span>
	<%
		//out.write("<h1> hi there </h1>");
		if(session.getAttribute("userid") == null){
			out.write("<location.href ='../login/login'>");
			/* out.write("<h1> hi there </h1>"); */	
		}else {
			String userid = (String)session.getAttribute("userid");
			out.write("<span> welcome" + "<strong> " + userid + "</strong> </span>");
		}
	%>
	
    <%@include file="./modules/header.jsp"%>
    <%@include file="./modules/navbar.jsp"%>
    <!-- 모듈화  -->
    
    

				<h3 class="w3-center">ID 변경</h3>
			</div>
			<div>
<!-- id 수정하기 란.. -->
				<form id="pwForm" action="../member/update_pw.do" method="post">
				<!--action 은 이 위치의 파일에서 해당 정보를 가지고 온다는 것 같다. . -->
					<input type="hidden" name="id" value="${ member.id }">

					<p>
						<label class="w3-center">새로운 ID</label> <input class="w3-input" id="New_ID"
							name="New_ID" type="text" required>
					</p>
					<p>
						<label class="w3-center">ID 재입력  </label> <input class="w3-input"
							id="Confirm_ID" name="Confirm_ID" type="text" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-round">ID
							변경하기</button> 
					</p>
					
				</form>
<!-- 게시판 보기  란.. -->
				<form>
				<div class="w3-center w3-large w3-margin-top">
				<h3>작성한 게시판 목록 </h3>
				</div>

				<!-- 
				<%
			    String userID = null; 
				// 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
				//나중에 써 먹을 수 있지 않을까 싶어 일단 지우지는 않는다. 
			    if (session.getAttribute("userID") != null)
			    {
			        userID = (String)session.getAttribute("userID");
			    }
				%> 
				-->
	
				<div class="w3-center">
					<div class="row">
						<table class="table table-striped" width="90%"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th style="background-color: #eeeeee; text-align: center;">제목</th>
									<th style="background-color: #eeeeee; text-align: center;">상품명 </th>
									<th style="background-color: #eeeeee; text-align: center;">ID</th>
									<th style="background-color: #eeeeee; text-align: center;">글 </th>
									<th style="background-color: #eeeeee; text-align: center;">작성일자 </th>
									<th style="background-color: #eeeeee; text-align: center;">설정</th>
								</tr>
							</thead>
							<tbody>
									<c:forEach items="${list}" var="u">
									<tr>
									<td class="seq">${u.seq}</td>
									<td class="title">${u.title}</td>
									<td class="name">${u.category}</td>
									<td class="price">${u.writer}</td>
									<td class="other">${u.content}</td>
									<td class="regdate">${u.regdate}</td>
									<td>
										<div id="buttonArea">
											<div id="editButton">
												<a id="fontcolor" href="editform/${u.seq}" class="btn w3-blue">수정하기</a>
											</div>
											<div id="deleteButton">
												<a id="fontcolor" href="javascript:delete_ok('${u.seq}')" class="btn w3-red btn-danger">삭제하기
												</a>
											</div>
										</div> 
									</td>
									</tr>
									</c:forEach>
							</tbody>
						</table>
						</div>		    
					</div>
				</div>
				<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src="js/bootstrap.js"></script>
			    </form>
 				
</body>

</html>
   <%@include file="./modules/footer.jsp"%>