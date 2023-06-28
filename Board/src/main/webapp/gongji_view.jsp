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
<%


request.setCharacterEncoding("UTF-8");
int id = Integer.parseInt(request.getParameter("id"));
BoardItemDao boardItemDao = new BoardItemDaoImpl();
BoardItem boardItem = boardItemDao.selectOne(id);
%>
<body>
	<table border="1" style="text-align: center">
		<tr>
			<td>번호</td>
			<td><%=boardItem.getId()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=boardItem.getTitle()%></td>
		</tr>
		<tr>
			<td>일자</td>
			<td><%=boardItem.getDate()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=boardItem.getContent()%></td>
		</tr>

	</table>
	<button type="button" onclick="location.href='gongji_list.jsp'">목록</button>
	<button type="button" onclick="location.href='gongji_update.jsp?id=<%=boardItem.getId()%>'">수정</button>
</body>
</html>