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
<style>
.target {
    display: inline-block;
    width: 350px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

div.pagination a {
	display: inline-block;
	margin: 0 5px;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background-color: #f1f1f1;
	color: #000;
	text-decoration: none;
}

div.pagination a:hover {
	background-color: #ccc;
}

div.pagination .current {
	background-color: #4CAF50;
	color: #fff;
}

</style>
</head>
<body>
	<%
	int currentpage = 1;
	int countPerPage = 13;
	try {
		currentpage = Integer.parseInt(request.getParameter("page"));
		countPerPage = Integer.parseInt(request.getParameter("cnt"));
	} catch (Exception e) {
		currentpage = 1;
		countPerPage = 13;
	}
	int total_cnt = 0;
	int id = 0;

	BoardCItemDao boardCItemDao = new BoardCItemDaoImpl();
	BoardCItemService boardCItemService = new BoardCItemServiceImpl();
	List<BoardCItem> boardCItemList = new ArrayList<BoardCItem>();
	boardCItemList = boardCItemDao.selectAll();
	Pagination pagination = boardCItemService.getPagination(currentpage, countPerPage);
	total_cnt = boardCItemDao.count();
	%>
	<table border="1" style="text-align: center">
		<tr>
			<td width="50px">번호</td>
			<td width="400px">제목</td>
			<td width="50px">조회수</td>
			<td width="100px">등록일</td>
		</tr>
	</table>

	<%
	try {
		int startNumber;
		int startPage;
		int cPage = pagination.getC();
		startNumber = (cPage - 1) * countPerPage;

		total_cnt = boardCItemDao.count();

		for (int i = startNumber; i < startNumber + countPerPage; i++) {
			if (i > total_cnt - 1)
		break;
	%>
	<%
	BoardCItemDao boardItemDao = new BoardCItemDaoImpl();
	List<BoardCItem> boardItemList = boardItemDao.selectAll();
	%>
	<table border="1" style="text-align: center" >
		<%
		BoardCItemDao boardItemDao2 = new BoardCItemDaoImpl();
		BoardCItem boardCItem2 = boardItemDao2.date();
		int viewcnt = boardItemDao2.getCount(boardItemList.get(i).getId());
		
		if (boardItemList.get(i).getRelevel() == 0) {		
		%>

		<tr>
			<td width="50px"><%=boardItemList.get(i).getListNum()%></td>
			<%
			if (boardCItem2.getDate().equals(boardItemList.get(i).getDate())) {
			%>
			<td width="400px" style="text-align: left" ><a class="target"
				href="gongji_view.jsp?id=<%=boardItemList.get(i).getId()%>"><%=boardItemList.get(i).getTitle()%></a>[NEW]</td>
			<%
			} else {
			%>
			<td width="400px" style="text-align: left" ><a class="target"
				href="gongji_view.jsp?id=<%=boardItemList.get(i).getId()%>"><%=boardItemList.get(i).getTitle()%></a></td>
			<%
			}
			%>
			<td width="50px"><%=viewcnt%></td>

			<td width="100px"><%=boardItemList.get(i).getDate()%></td>

		</tr>
		<%
		} else {
		int recnt = boardItemList.get(i).getRelevel();
		String str = "-";
		String space = "&nbsp";
		%>
		<tr>
			<td width="50px"></td>
			<%
			if (boardCItem2.getDate().equals(boardItemList.get(i).getDate())) {
			%>
			<td width="400px" style="text-align: left"><a class="target"
				href="gongji_view.jsp?id=<%=boardItemList.get(i).getId()%>"><%=space.repeat(recnt*3)+"ㄴ"+str.repeat(recnt) + ">[re]"%><%=boardItemList.get(i).getTitle()%></a>[NEW]</td>
			<%
			} else {
			%>
			<td width="400px" style="text-align: left"><a class="target"
				href="gongji_view.jsp?id=<%=boardItemList.get(i).getId()%>"><%=space.repeat(recnt*3)+"ㄴ"+str.repeat(recnt) + ">[re]"%><%=boardItemList.get(i).getTitle()%></a></td>
			<%
			}
			%>
			<td width="50px"><%=viewcnt%></td>
			<td width="100px"><%=boardItemList.get(i).getDate()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>
	<div class="pagination" style="text-align: center; width: 600px">

		<%
		if (pagination.getPp() != -1) {
		%>
		<a
			href="gongji_list.jsp?page=<%=pagination.getPp()%>&cnt=<%=countPerPage%>">&lt;&lt;</a>
		<a
			href="gongji_list.jsp?page=<%=pagination.getP()%>&cnt=<%=countPerPage%>">&lt;</a>
		<%
		}
		%>
		<%
		for (int i = pagination.getS(); i < pagination.getS() + 10; i++) {
			if (((i - 1) * countPerPage) >= total_cnt) {
				break;
			}
		%>
		<a href="gongji_list.jsp?page=<%=(i)%>&cnt=<%=countPerPage%>"
			<%=pagination.getC() == i ? "class=\"current\"" : ""%>><%=i%></a>
		<%
		}
		%>
		<%
		if (pagination.getNn() != -1) {
		%>
		<a
			href="gongji_list.jsp?page=<%=(pagination.getN())%>&cnt=<%=countPerPage%>">&gt;</a>
		<a
			href="gongji_list.jsp?page=<%=pagination.getNn()%>&cnt=<%=countPerPage%>">&gt;&gt;</a>
		<%
		}
		%>
	</div>
	<%
	} catch (Exception e) {
	%>

	<%
	}
	%>
	<button type="button" onclick="location.href='gongji_insert.jsp'">신규</button>
</body>
</html>