<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="kr.ac.kopo.ctc.kopo00.service.*,kr.ac.kopo.ctc.kopo00.dto.*"%>
<%@ page import="kr.ac.kopo.ctc.kopo00.dao.*"%>
<%@ page import="kr.ac.kopo.ctc.kopo00.domain.VoteItem"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="javax.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
request.setCharacterEncoding("UTF-8");
String nameStr = request.getParameter("name");
%>
<body>
	<%
	try {
		VoteItemDao voteItemDao = new VoteItemDaoImpl();
		int insertId = voteItemDao.addHubo(nameStr);
	%>
	<script>
		location.href = "A_04.jsp";
	</script>
	<%
	} catch (Exception e) {
		
	%>
	실패
	<%
	}
	%>
</body>
</html>

