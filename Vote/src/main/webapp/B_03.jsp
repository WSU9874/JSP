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
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		int age = Integer.parseInt(request.getParameter("age"));

		VoteItemDao voteItemDao = new VoteItemDaoImpl();
		int checkerror = voteItemDao.addTupyo(id, age);
	%>
	<script>
		location.href = "B_02.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	<script type="text/javascript">
		alert("투표실패");
		location.href="B_01.jsp";
	</script>
	<%
	}
	%>
</body>
</html>