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
BoardCItemDao boardItemDao = new BoardCItemDaoImpl();
BoardCItem boardItem = boardItemDao.selectOne(id);
int updatecnt = boardItemDao.updateCount(id);
boolean redelete = boardItem.isRedelete();
%>
<body>
	<table border="1" style="text-align: left">
		<tr>
			<td style="text-align: center" width=100px>고유번호</td>
			<td width=500px><%=boardItem.getId()%></td>
		</tr>
		<tr>
			<td style="text-align: center">제목</td>
			<td><%=boardItem.getTitle()%></td>
		</tr>
		<tr>
			<td style="text-align: center">일자</td>
			<td><%=boardItem.getDate()%></td>
		</tr>
		<tr>
			<td style="text-align: center">조회수</td>
			<td><%=updatecnt%></td>
		</tr>
		<tr>
			<td style="text-align: center">내용</td>
			<td><textarea rows="25" cols="68" name="content" style="border:0px" readonly><%=boardItem.getContent()%></textarea></td>
		</tr>
		<tr>
			<td style="text-align: center">원글고유번호</td>
			<td><%=boardItem.getRootid()%></td>
		</tr>
		<tr>
			<td style="text-align: center">댓글수준</td>
			<td><div  style="width:100px; float:left;margin-right:80px;"><%=boardItem.getRelevel()%></div><div style=" float:left;">댓글내 순서<input value="<%=boardItem.getRecnt()%>" name="recnt" readonly ></div></td>
		</tr>
	</table>
	<%
	if(redelete==true){
	%>
	<button type="button" onclick="location.href='gongji_list.jsp'">목록</button>
	<button type="button"
		onclick="location.href='gongji_update.jsp?id=<%=boardItem.getId()%>'">수정</button>
	<button type="button"
		onclick="location.href='gongji_delete.jsp?id=<%=boardItem.getId()%>&relevel=<%=boardItem.getRelevel()%>'">삭제</button>
	<button type="button"
		onclick="location.href='gongji_reInsert.jsp?id=<%=boardItem.getId()%>&rootid=<%=boardItem.getRootid()%>&relevel=<%=boardItem.getRelevel()%>&recnt=<%=boardItem.getRecnt()%>'">댓글</button>
<%
	}else{
	%>
	<button type="button" onclick="location.href='gongji_list.jsp'">목록</button>	
	<%	
	}
%>
</body>
</html>