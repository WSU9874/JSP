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
<title>재고</title>
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
	int countPerPage = 10;
	try {
		currentpage = Integer.parseInt(request.getParameter("page"));
		countPerPage = Integer.parseInt(request.getParameter("cnt"));
	} catch (Exception e) {
		currentpage = 1;
		countPerPage = 10;
	}
	int total_cnt = 0;
	int id = 0;

	JegoItemDao jegoItemDao = new JegoItemDaoImpl();
	JegoItemService jegoItemService = new JegoItemServiceImpl();
	List<JegoItem> jegoItemList = new ArrayList<JegoItem>();
	jegoItemList = jegoItemDao.selectAll();
	Pagination pagination = jegoItemService.getPagination(currentpage, countPerPage);
	total_cnt = jegoItemDao.count();
	%>
	<table border="1" style="text-align: center">
		<tr>
			<td width="200px">상품번호</td>
			<td width="200px">상품명</td>
			<td width="200px">현재 재고수</td>
			<td width="200px">재고등록일</td>
			<td width="200px">상품등록일</td>
		</tr>
	</table>
	<%
	try {
		int startNumber;
		int startPage;
		int cPage = pagination.getC();
		startNumber = (cPage - 1) * countPerPage;

		total_cnt = jegoItemDao.count();
		JegoItemDao JegoItemDao = new JegoItemDaoImpl();
		List<JegoItem> JegoItemList = JegoItemDao.selectAll();
		JegoItemList.get(0);
	%>
	<table border="1" style="text-align: center">
		<%
		for (int i = startNumber; i < startNumber + countPerPage; i++) {
			if (i > total_cnt - 1)
				break;
		%>
		<tr>
			<td width="200px"><%=JegoItemList.get(i).getId()%></td>
			<td width="200px"><a
				href="jego_view.jsp?id=<%=JegoItemList.get(i).getId()%>"><%=JegoItemList.get(i).getName()%></a></td>
			<td width="200px"><%=JegoItemList.get(i).getJego()%></td>
			<td width="200px"><%=JegoItemList.get(i).getJegoDate()%></td>
			<td width="200px"><%=JegoItemList.get(i).getNewDate()%></td>
		</tr>
		<%
		}
		%>

	</table>
	<div class="pagination" style="text-align: center; width: 900px">
		<%
		if (pagination.getPp() != -1) {
		%>
		<a
			href="Jego_list.jsp?page=<%=pagination.getPp()%>&cnt=<%=countPerPage%>">&lt;&lt;</a>
		<a
			href="Jego_list.jsp?page=<%=pagination.getP()%>&cnt=<%=countPerPage%>">&lt;</a>
		<%
		}
		%>
		<%
		for (int i = pagination.getS(); i < pagination.getS() + 10; i++) {
			if (((i - 1) * countPerPage) >= total_cnt) {
				break;
			}
		%>
		<a href="Jego_list.jsp?page=<%=(i)%>&cnt=<%=countPerPage%>"
			<%=pagination.getC() == i ? "class=\"current\"" : ""%>><%=i%></a>
		<%
		}
		%>
		<%
		if (pagination.getNn() != -1) {
		%>
		<a
			href="Jego_list.jsp?page=<%=(pagination.getN())%>&cnt=<%=countPerPage%>">&gt;</a>
		<a
			href="Jego_list.jsp?page=<%=pagination.getNn()%>&cnt=<%=countPerPage%>">&gt;&gt;</a>
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

	<button type="button" onclick="location.href='jego_insert.jsp'">신규</button>

</body>

</html>