<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<title>단어장</title>
<link rel="stylesheet" href="vocabulary.css" type="text/css" media="screen" />

</head>
<script type="text/javascript"></script>
<body>


<!-- ========== 헤더  ========== -->

<header>

	<div class="container header-container">
	
		<div>

			<h1 class="header-logo"><a href="vocabulary_mainpage.jsp"><img src="../images/logo.jpg"></a></h1>
		
 		</div>
		
	</div>
	
</header>


<!-- ========== 메인 ========== -->

<section class="main">

	<div class="container">

		<main>

			<p class="home-mainc">나만을 위한<br>

				<span class="home-color1"></span><strong> W o r d B o o k</strong>
				
			</p>


			<ul class="home-course">

				<li>

					<a href="vocabulary_word1.jsp"><figure>
					<img src="../images/1.png">
					</figure></a>

				</li>

				<li>

					<a href="vocabulary_word2.jsp"><figure>
					<img src="../images/2.png">
					</figure></a>

				</li>
				
				<li>

					<a href="vocabulary_list.jsp"><figure>
					<img src="../images/3.png">
					</figure></a>

				</li>
				
			</ul>
			<video src="voca.mp4" width="500px" height="400px" controls loop muted autoplay>브라우저가 지원되지 않아 동영상 재생에 실패했습니다.</video>

</main>
<br><br><br><br><br><br><br><br>

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