<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="kr.ac.kopo.ctc.kopo00.service.*,kr.ac.kopo.ctc.kopo00.dto.*"%>
<%@ page import="kr.ac.kopo.ctc.kopo00.dao.*"%>
<%@ page import="kr.ac.kopo.ctc.kopo00.domain.VoteItem"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));

	VoteItemDao voteItemDao = new VoteItemDaoImpl();
	int checkerror = voteItemDao.delHubo(id);
	int del = voteItemDao.deltupyo(id);
	if (checkerror == 0) {
	%>
	<script>
		location.href = "A_04.jsp";
	</script>
	<%
	} else {
	%>
	<h1>삭제 실패</h1>
	<%
	}
	%>
</body>
</html>