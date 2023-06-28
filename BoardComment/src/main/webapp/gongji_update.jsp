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
BoardCItemDao boardItemDao = new BoardCItemDaoImpl();
BoardCItem boardItem = boardItemDao.selectOne(id);
BoardCItem boardCitem2 = boardItemDao.date();
%>
<body>
	<form method="post">
		<table border="1" style="text-align: center">
			<tr>
				<td width="100px">고유번호</td>
				<td width="500px"><input type="number" name="key" style="margin-right:325px"
					value="<%=boardItem.getId()%>" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=boardItem.getTitle()%>"
				style="margin-right:115px" size=50 maxlength=50 id="titleBox">
				</td>
			</tr>
			<tr>
				<td>일자</td>
				<td><%=boardCitem2.getDate()%></td>
			</tr>
			<tr>
				<td  height="350px">내용</td>
				<td><textarea maxlength="100000" rows="25" cols="68" name="content" style="border:0px" style="height:95%" id="content"><%=boardItem.getContent()%></textarea>
			</tr>
		</table>
		<button type="button" onclick="location.href='gongji_list.jsp'">취소</button>
		<button type="submit" formaction='gongji_write.jsp' onclick=spaceCheck();textCheck()>쓰기</button>
		<button type="submit" formaction='gongji_delete.jsp'>삭제</button>
	</form>
</body>
</html>