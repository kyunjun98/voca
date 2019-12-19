<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page errorPage="vocabulary_error.jsp" %>

<!-- 자바 클래스 Import  -->
<%@ page import= "vocabulary.*" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>단어장 조회</title>

	<link rel="stylesheet" href="vocabulary.css" type="text/css" />
	<script type="text/javascript">
		function retrivalcheck() {
			
			// get방식
			// document.location.href="addr_control.jsp?action=list";
			
			// post방식 디펄트가 list
			document.form1.action.value="list";
			document.form1.submit();
	
			
		}
	
		function editcheck(id) {
		
			// get방식
			// document.location.href="addr_control.jsp?action=edit&id="+id;
			
			// post방식
			document.form1.action.value="edit";
			document.form1.id.value=id;
			document.form1.submit();
	
			
		}
	</script>

</head>
<!--  scope=request 내장객체 공유 -->
<jsp:useBean id="vocabularyList" scope="request" class="java.util.ArrayList" />

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
                #topMenu {            // topMenu의 ID를 가진 태그의 스타일 지정
                        height: 30px; // topMenu의 높이를 30px로 설정(제대로 설정 안하면 아래 내용이 깨짐)
                        width: 850px; // topMenu의 넓이를 850px로 설정(제대로 설정 안하면 브라우져 넓이가 좁아지면 깨짐)
                }
                #topMenu ul li {                       // topMenu의 ID를 가진 태그 안에 <ul> 태그 안에 <li> 태그의 스타일을 지정
                        list-style: none;           // <li> 태그는 위의 이미지처럼 목록을 나타내는 점을 없앤다 
                        color: white;               // 글씨 색을 흰색으로 설정
                        background-color: #2d2d2d;  // 배경색을 진한 회색(RGB(2D,2D,2D)으로 설정
                        float: left;                // <li>태그들이 왼쪽에 흐르게 설정(그러면 아래있는 내용은 오른쪽으로 옴)
                        line-height: 30px;          // 글씨가 가운데로 오도록 설정하기 위해 한줄의 높이를 30px로 설정
                        vertical-align: middle;     // 세로 정렬을 가운데로 설정(위의 line-height와 같이 설정 필요함)
                        text-align: center;         // 글씨 정렬을 가운데로 설정
                }
                #topMenu .menuLink {                               // topMenu 아이디를 가진 태그 안에 있는 menuLink 클래스 태그들의 스타일 설정
                        text-decoration:none;                      // 링크(<a> 태그)가 가지는 기본 꾸밈 효과(밑줄 등)을 없앰
                        color: white;                              // 폰트색을 흰색으로 설정
                        display: block;                            // 링크를 글씨가 있는 부분 뿐만아니라 전체 영역을 클릭해도 링크가 걸리게 설정
                        width: 150px;                              // 메뉴링크의 넓이 설정
                        font-size: 12px;                           // 폰트 사이즈 12px로 설정
                        font-weight: bold;                         // 폰트를 굵게
                        font-family: "Trebuchet MS", Dotum, Arial; // 기본 폰트 적용, 시스템 폰트를 종류별로 순서대로
                }
                #topMenu .menuLink:hover {            //topMenu 아이디를 가진 태그 안에 menuLink클래스를 가진 태그에 마우스가 over되면 스타일 설정
                        color: red;                   // 글씨 색을 붉은색으로 설정
                        background-color: #4d4d4d;    // 배경색을 조금 더 밝은 회색으로 설정
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
	<div align=center>
	<H2>단어장 조회</H2>
	<HR>
	<!-- 단어 목록 조회폼 -->
	<form name="form1" method="post" action="vocabulary_control.jsp">
		<input type="hidden" name="action" value="list">
		<input type="hidden" name="id" value=0>
	
			
				<div class="wrapper">
  <a href="vocaword.zip"><span>단어 테스트 프로그램 다운</span></a>
</div>
		<table border=1>
  		<div ontouchstart="">
  <div class="button2">
    <a href="vocabulary_control.jsp?action=add">단어장 등록</a>
  </div>
</div>
  <br>
			<tr>
				<td colspan=2 align=right width="200">
    				<a href="vocabulary_control.jsp?action=list"><input type="button" value="조회"></a>
				</td>
			</tr>
			<tr>
				<th>단어</th>
				<th>단어설명</th>
			</tr>
			<%
				if(vocabularyList != null) {
					
						for(VocabularyDTO vocabularyDTO : (ArrayList<VocabularyDTO>) vocabularyList) {
			%>
						<tr>
							<td><a href="javascript:editcheck(<%=vocabularyDTO.getId() %>)"><%=vocabularyDTO.getWord() %></a></td>
							<td><%=vocabularyDTO.getDescription() %></td>
						</tr>
			<%	
					}
				}
			%>
			</table>
		</form>
	</div>
	
	<!-- ========== 푸터 ========== -->

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