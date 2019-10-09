<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- 자바 클래스 Import  -->
<%@ page errorPage="vocabulary_error.jsp" %>
<%@ page import= "vocabulary.*" %>
<%@ page import = "java.util.ArrayList" %>

<%-- request 내장객체의 한글 인코딩 --%>    
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 자바빈즈 사용 --%>   
<jsp:useBean id="vocabularyDTO" class="vocabulary.VocabularyDTO" scope="request" ></jsp:useBean>

<%-- 자바빈즈에 폼정보 전달 --%> 
<jsp:setProperty property="*" name="vocabularyDTO"/>

<%-- 자바빈즈 사용, scope은 request --%>  
<jsp:useBean id="vocabularyDAO" class="vocabulary.VocabularyDAO" scope="request" ></jsp:useBean>

 
<%

   	// action구분 등 파라메터
	String action = request.getParameter("action");

	
	if(action.equals("add")) {
	
		// 단어장 입력화면 오픈
		pageContext.forward("vocabulary_view.jsp?action=add");
	
	} else if(action.equals("insert")) {
		
		// 단어장 입력
		if(vocabularyDAO.insertDB(vocabularyDTO)) {

			// 조회를 위하여 controll 호출
			pageContext.forward("vocabulary_control.jsp?action=list");
		} else {
			throw new Exception("DB 입력오류");
		}
		
	} else if(action.equals("list")) {
		
		// 단어장 조회결과
		ArrayList<VocabularyDTO> vocabularyList = vocabularyDAO.getDBList();
		
		// List를 setAttribute
		request.setAttribute("vocabularyList", vocabularyList);
		pageContext.forward("vocabulary_list.jsp");
	} 
	
	
%> 
 
