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
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.box-container {
	display: inline-block;
	border: 2px solid #09c;
	margin: 5px 15px;
	width: 800px;
	height: 600px;
}

.box-container div {
	width: 120px;
	height: 80px;
	background-color: #fde6ff;
	border: 2px solid #90C;
	font-size: 15px;
}

#box4 {
	margin: 100px;
	padding: 100px 200px;
}
</style>
</head>
<body>
	<%
	try {
		String path = "/upload";//저장하는 폴더 위치
		String savePath = request.getServletContext().getRealPath(path);//컴퓨터 저장 위치
		int maxSize = 1024 * 1024 * 1024; //1기가 넘으면 예외발생
		String encodingType = "utf-8";
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encodingType,
		new DefaultFileRenamePolicy());

		request.setCharacterEncoding("UTF-8");
		long id = Long.parseLong(multi.getParameter("id"));
		String name = multi.getParameter("name");
		long jego = Long.parseLong(multi.getParameter("jego"));
		String content = multi.getParameter("content");
		String picture = multi.getOriginalFileName("fileName");

		JegoItemDao jegoItemDao = new JegoItemDaoImpl();
		JegoItem jegoItem = new JegoItem();
		jegoItem = jegoItemDao.date();
		String date = jegoItem.getNewDate();
		int checkerror = jegoItemDao.addJego(name, jego, date, content, picture, id);
		if (checkerror == 0) {
	%>
	<h1 style="text-align: center; width: 800px">㈜트와이스 재고 현황-등록완료</h1>
	<div class="box-container" style="text-align: center">
		<h1 id="box4">
			[<%=name%>] 등록 완료 되었습니다.
		</h1>
		<button type="button" onclick="location.href='Jego_list.jsp'">재고
			현황</button>
	</div>
	<%
	} else {

	out.print("중복된 id입니다.");
	%>
	<br>
	<button type="button" onclick="location.href='Jego_list.jsp'">재고
		현황</button>
	<%
	}
	} catch (Exception e) {

	}
	%>

</body>
</html>