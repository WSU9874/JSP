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
<title>공지사항</title>
</head>
<body>
	<table border="1" style="text-align: center">
		<tr>
			<td>번호</td>
			<td width="400px">제목</td>
			<td>등록일</td>
		</tr>
		<tr>
			<%
			BoardItemDao boardItemDao = new BoardItemDaoImpl();
			List<BoardItem> boardItemList = boardItemDao.selectAll();
			for (BoardItem bo : boardItemList) {
			%>
		
		<tr>
			<td><%=bo.getId()%></td>
			<td><a href="gongji_view.jsp?id=<%=bo.getId()%>"><%=bo.getTitle()%></a></td>
			<td><%=bo.getDate()%></td>
		</tr>
		<%
		}
		%>

	</table>
	<button type="button" onclick="location.href='gongji_insert.jsp'">신규</button>
</body>
</html>