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
	

			BoardItemDao boardItemDao = new BoardItemDaoImpl();
			List<BoardItem> boardItemList = new ArrayList<BoardItem>();
			BoardItem boardItem = new BoardItem();
			boardItem = boardItemDao.date();
	%>
	<form method="post">
		<table border="1" style="text-align: center">
			<tr>
				<td>번호</td>
				<td>신규(insert)</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value=""></td>
			</tr>
			<tr>
				<td>일자</td>
				<td><%=boardItem.getDate()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content" value=""></td>
			</tr>
		</table>
		<button type="button" onclick="location.href='gongji_list.jsp'">취소</button>
		<input type="submit" value="쓰기" formaction="gongji_write.jsp?id=INSERT">
	</form>
</body>
</html>