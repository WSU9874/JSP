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
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int rootid = Integer.parseInt(request.getParameter("rootid"));
	int relevel = Integer.parseInt(request.getParameter("relevel"));
	int recnt = Integer.parseInt(request.getParameter("recnt"));

	try {
		BoardCItemDao boardItemDao = new BoardCItemDaoImpl();
		BoardCItem boardItem = new BoardCItem();
		boardItem = boardItemDao.date();
		int insertGongji = boardItemDao.addComment(title, boardItem.getDate(), content, rootid, relevel, recnt, 0, true);
	%>
	<script>
		location.href = "gongji_list.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	댓글입력실패
	<%
	}
	%>
</body>
</html>