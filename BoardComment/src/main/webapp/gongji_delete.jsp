<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="kr.ac.kopo.ctc.kopo00.dao.*"%>
<%@page import="kr.ac.kopo.ctc.kopo00.domain.*"%>
<%@page import="kr.ac.kopo.ctc.kopo00.dto.*"%>
<%@page import="kr.ac.kopo.ctc.kopo00.service.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int relevel = Integer.parseInt(request.getParameter("relevel"));

			int idInt = Integer.parseInt(id);
			try {
		BoardCItemDao boardItemDao = new BoardCItemDaoImpl();
		
		if(relevel==0){
			int insertGongji = boardItemDao.deleteGonji(idInt);
		}else{
			int deleteComment = boardItemDao.deleteComment(idInt);
		}
	%>
	<script>
		location.href = "gongji_list.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	삭제실패
	<%
	}
	%>
</body>
</html>