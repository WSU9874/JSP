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
Long id = Long.parseLong(request.getParameter("id"));
JegoItemDao jegoItemDao = new JegoItemDaoImpl();
JegoItem jegoItem = jegoItemDao.selectOne(id);
JegoItem jegoItem2 = jegoItemDao.jegodate();
String path = "/upload";//저장하는 폴더 위치
%>
<body>
	<form method="post">
		<table border="1" style="text-align: center">
			<tr>
				<td width=150px;>상품 번호</td>
				<td width=400px;><%=jegoItem.getId()%></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><%=jegoItem.getName()%></td>
			</tr>
			<tr>
				<td>재고 현황</td>
				<td><input type="number" name="jego" min="0" max="100000" required required
					value="<%=jegoItem.getJego()%>"></td>
			</tr>
			<tr>
				<td>재고등록일</td>
				<td><%=jegoItem2.getJegoDate()%></td>
			</tr>
			<tr>
				<td>상품등록일</td>
				<td><%=jegoItem.getNewDate()%></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea style="width: 98%; height: 100px;" readonly><%=jegoItem.getContent()%></textarea></td>
			</tr>
			<tr>
				<td>상품사진</td>
				<td><img  src="<%="/Jego" + path + "/" + jegoItem.getPicture()%>" width="400px" height="300px" onError="this.style.visibility='hidden'" ></td>
			</tr>

		</table>
		<button type="button" onclick="location.href='Jego_list.jsp'">취소</button>
		<button type="submit" formaction='jego_updatewrite.jsp?id=<%=id%>&name=<%=jegoItem.getName()%>'>제고수정</button>
	</form>
</body>
</html>