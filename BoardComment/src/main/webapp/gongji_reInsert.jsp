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
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>		
		function spaceCheck(){
			 var titleBox = document.getElementById("titleBox").value.trim();
			 document.getElementById("titleBox").value = titleBox;
		}		
		function textCheck(){
			var textareaStr = document.getElementById("content").value;
			var titleBoxStr =  document.getElementById("titleBox").value;
			document.getElementById("content").value = textareaStr.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;").replaceAll("\\", "&#39;");
			document.getElementById("titleBox").value = titleBoxStr.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;").replaceAll("\\", "&#39;");			
		}
	</script>
</head>
<%
request.setCharacterEncoding("UTF-8");
int id = Integer.parseInt(request.getParameter("id"));
int rootid = Integer.parseInt(request.getParameter("rootid"));
int relevel = Integer.parseInt(request.getParameter("relevel"))+1;
int recnt = Integer.parseInt(request.getParameter("recnt"));
BoardCItemDao boardItemDao = new BoardCItemDaoImpl();
BoardCItem boardItem = boardItemDao.selectOne(id);
int updatecnt = boardItemDao.updateCount(id);
int recntPlus = boardItemDao.recntPlus(rootid,recnt);
recnt= recnt+1;
%>
<body>
	<form method="post">

	<table border="1" style="text-align: center">
		<tr>
			<td width=100px>번호</td>
			<td width=500px>댓글<input value="INSERT" style="margin-right:285px" readonly></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text"  style="margin-right:115px" size=50 maxlength=50 name="title" pattern=".{1,100}" id="titleBox" value=""  required></td>
		</tr>
		<tr>
			<td>일자</td>
			<td><%=boardItem.getDate()%></td>
		</tr>
		<tr>
			<td height=350px>내용</td>
			<td><textarea maxlength="155000" rows="25" cols="68" name="content" style="border:0px"></textarea></td>
		</tr>
		<tr>
			<td>원글</td>
			<td><input value="<%=rootid%>" style="margin-right:315px" name="rootid" readonly></td>
		</tr>
		<tr>
			<td>댓글수준</td>
			<td><input value="<%= relevel %>" name="relevel" style="text-align:left;margin-right:50px" readonly>댓글내 순서<input value="<%= recnt%>" name="recnt" readonly></td>
		</tr>
	</table>
	<button type="button" onclick="location.href='gongji_list.jsp'">취소</button>
	<input type="submit" value="쓰기" onclick=spaceCheck();textCheck() formaction="gongji_writeC.jsp?id=<%=boardItem.getId()%>">
</form>
</body>
</html>