<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page errorPage="vocabulary_error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>단어장 등록</title>
	<link rel="stylesheet" href="vocabulary.css" type="text/css" media="screen" />
	<script type="text/javascript">

		// window.load는 페이지 로딩 후 실행
		window.onload = function() {
			var action = document.form1.action.value;

			if(action=="edit") {
				document.getElementById("insert").disabled=true;
				// document.getElementById("update").disabled=false;
				// document.getElementById("delete").disabled=false;
			} else if(action=="add") {
				// document.getElementById("insert").disabled=false;
				document.getElementById("update").disabled=true;
				document.getElementById("delete").disabled=true;
			}
		} 
	
		function insertcheck() {
			// post방식
			document.form1.action.value="insert";
			document.form1.submit();
		}
	
		function updatecheck() {
			// post방식
			document.form1.action.value="update";
			document.form1.submit();
		}
	
		function deletecheck() {
			result = confirm("정말로 삭제하시겠습니까 ?");
		
			if(result == true){
				
				// post방식
				document.form1.action.value="delete";
				document.form1.submit();
			}
			else
				return;
		}
	</script>

</head>

<%-- 자바빈즈 사용 --%>   
<jsp:useBean id="vocabularyDTO" scope="request" class="vocabulary.VocabularyDTO"></jsp:useBean>

<!-- 기본 버튼 css -->
<style> 
input[type=button] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 15px 30px 16px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  text-align: center;
  vertical-align: middle;
  font-weight: bold;
}
</style>

<!-- 기본 버튼 css 끝-->

<body>
<header>

	<div class="container header-container">
	
		<div>

			<h1 class="header-logo"><a href="vocabulary_mainpage.jsp"><img src="../images/logo.jpg"></a></h1>

 		</div>

	</div>
	
</header>
<div id="menu1">
	<ul>
	<li><a href="vocabulary_word1.jsp">고교 영어1</a></li>
	<li><a href="vocabulary_word2.jsp">고교 영어2</a></li>
	<li><a href="vocabulary_list.jsp">단어장</a></li>
	</ul>
</div>
	<div align="center">
	<H2>단어장 등록</H2>
	<HR>
	
  		<div ontouchstart="">
  <div class="button2">
    <a href="vocabulary_control.jsp?action=list">단어장 조회</a>
  </div>
</div>
<br>
	
	<!-- 단어장 등록용 -->
	<form name="form1" method="post" action=vocabulary_control.jsp>
	
		<%
			// action구분 등 파라메터(add 또는 edit)
			String action = request.getParameter("action");
			
			// action이 add이면 값 초기화
			if(action.equals("add")) {
				vocabularyDTO.setWord("");
				vocabularyDTO.setDescription("");
				
			}
			
		%>
		
		<input type="hidden" name="action" value="<%= action %>">
		<input type="hidden" name="id" value="<%= vocabularyDTO.getId() %>">
		
		<table>
			<tr>
				<th>단어</th>
				<td><input type=text size=20 name=word value="<%= vocabularyDTO.getWord() %>"></td>
			</tr>
			<tr>
				<th>단어설명</th>
				<td><input type=text size=20 name=description value="<%= vocabularyDTO.getDescription() %>"></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type="button" id="insert" value="입력" onClick="insertcheck()">
					<input type="button" id="update" value="수정" onClick="updatecheck()">
					<input type="button" id="delete" value="삭제" onClick="deletecheck()">
				</td>
			</tr>
		</table>
	</form>
	</div>
	
<div class="content">

</div>


<footer>


  <div class="container footer-container">

	<p class="footer-copyright">

		COPYRIGHT@WordBook INC. ALL RIGHTS RESERVED.

		</p>
		
</div>
</footer>

</body>
</html>