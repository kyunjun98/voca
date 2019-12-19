<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 오류 페이지 정의  -->
<%@ page errorPage="vocabulary_error.jsp"%>

<!-- 자바 클래스 Import  -->
<%@ page import="java.sql.*"%>
<%@ page import="vocabulary.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="vocabulary.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단어장 - 고교 영어1</title>
<script type="text/javascript">
	
</script>
</head>

<%
	//action구분 등 파라메터
	String action = request.getParameter("action");

	ArrayList<VocabularyDTO> vocabularyList = new ArrayList<VocabularyDTO>();

	//데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	//데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/voca?useSSL=true&verifyServerCertificate=false&serverTimezone=UTC";

	try {
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url,"voca","1234");

		String sql = "select word_1, description_1 from vocabulary_english1";

		pstmt = conn.prepareStatement(sql);

		//SQL문 실행
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			// DO 객체 생성
			VocabularyDTO vocabularyDTO = new VocabularyDTO();

			// DB Select결과를 DO 객체에 저장
			vocabularyDTO.setWord_1(rs.getString("word_1"));
			vocabularyDTO.setDescription_1(rs.getString("description_1"));

			vocabularyList.add(vocabularyDTO);
		}

		// 사용한 자원의 반납.
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		System.out.println(e);
	}
%>


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
	<H2>고교 영어1</H2>
		<HR>
			<table border=1>
				<tr>
					<td colspan=7 align=center></td>
				</tr>
				<tr>
					<th>단어</th>
					<th>단어설명</th>
				</tr>
				<%
					if (vocabularyList != null) {
						for (VocabularyDTO vocabularyDTO : (ArrayList<VocabularyDTO>) vocabularyList) {
				%>
				<tr>
					<td><%=vocabularyDTO.getWord_1()%></td>
					<td><%=vocabularyDTO.getDescription_1()%></td>
					</tr>
				<%
					}
					}
				%>
			</table>
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