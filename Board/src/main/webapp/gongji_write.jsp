<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="kr.ac.kopo.ctc.kopo00.dao.*"%>
<%@page import="kr.ac.kopo.ctc.kopo00.domain.*"%>
<%@page import="kr.ac.kopo.ctc.kopo00.dto.*"%>
<%@page import="kr.ac.kopo.ctc.kopo00.service.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
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
	if (id.equals("INSERT")) {

		try {
			BoardItemDao boardItemDao = new BoardItemDaoImpl();
			BoardItem boardItem = new BoardItem();
			boardItem = boardItemDao.date();
			int insertGongji = boardItemDao.addGongji(title, boardItem.getDate(), content);
	%>
	<script>
		location.href = "gongji_list.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	신규입력실패
	<%
	}

	} else {
	int idInt = Integer.parseInt(id);
	try {
	BoardItemDao boardItemDao = new BoardItemDaoImpl();
	BoardItem boardItem = new BoardItem();
	boardItem = boardItemDao.date();
	int insertGongji = boardItemDao.updateGongji(title, content, idInt);
	%>
	<script>
		location.href = "gongji_list.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	업데이트실패
	<%
	}
	}
	%>


</body>
</html>