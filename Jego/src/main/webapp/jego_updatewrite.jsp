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
<style>
	.box-container{
		display: inline-block;
		border: 2px solid #09c;
		margin: 5px 15px;
		width: 800px;
		height: 600px;
	}
	.box-container div{
		width: 120px;
		height: 80px;
		background-color: #fde6ff;
		border: 2px solid #90C;
		font-size: 15px;
	}
	#box4{ margin: 100px; padding: 100px 200px; }

</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	JegoItemDao jegoItemDao2 = new JegoItemDaoImpl();
	JegoItem jegoItem = new JegoItem();
	Long id = Long.parseLong(request.getParameter("id"));
	String name = request.getParameter("name");
	Long jego = Long.parseLong(request.getParameter("jego"));
	jegoItem = jegoItemDao2.jegodate();

	try {
		JegoItemDao jegoItemDao = new JegoItemDaoImpl();
		int updateJego = jegoItemDao.updateJego(jego,jegoItem.getJegoDate(),id);
	%>
	<h1 style="text-align: center; width: 800px" >㈜트와이스 재고 현황-재고수정완료</h1>
	<div  class="box-container" style=" text-align: center">
	<h1 id="box4">[<%=name %>] 재고 수정 되었습니다.</h1>
	<button type="button" onclick="location.href='Jego_list.jsp'" >재고 현황</button>
	</div>
	<%
	} catch (Exception e) {
	%>
	업데이트실패
	<%
	}
	%>

</body>
</html>