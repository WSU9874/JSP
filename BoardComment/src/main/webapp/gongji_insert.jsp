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
<body>
	<%
	BoardCItemDao boardItemDao = new BoardCItemDaoImpl();
	List<BoardCItem> boardItemList = new ArrayList<BoardCItem>();
	BoardCItem boardItem = new BoardCItem();
	boardItem = boardItemDao.date();
	int rootid = boardItem.getId();
	%>
	<form method="post">
		<table border="1" style="text-align: center">
			<tr>
				<td width="100px">고유번호</td>
				<td width="500px"> 신규(insert)</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input style="margin-right:115px" size=50 maxlength=50 type="text" name="title" pattern=".{1,100}" id="titleBox" value=""  required></td>
			</tr>
			<tr>
				<td>일자</td>
				<td><%=boardItem.getDate()%></td>
			</tr>
			<tr>
				<td height="350px">내용</td>
				<td><textarea maxlength="100000" rows="25" cols="68" name="content" style="border:0px" id="content" style="width:100%;height:100%"></textarea></td>
			</tr>
		</table>
		<button type="button" onclick="location.href='gongji_list.jsp'">취소</button>
		<input type="submit" value="쓰기" onclick=spaceCheck();textCheck()
			formaction="gongji_write.jsp?key=INSERT"
			>
	</form>
</body>
</html>