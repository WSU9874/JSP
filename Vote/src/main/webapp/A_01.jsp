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
<style>
.container {
	text-align: center;
	padding: 10px;
	border: 1px solid black;
	width: 470px;
}

.button-container {
	margin-top: 20px;
	padding: 10px;
	border: 1px solid black;
	width: 470px;
}

.button-container a {
	margin-right: 10px;
	text-decoration: none;
	width: 450px;
	height: 100px;
}

.button-container input[type="button"] {
	width: 130px;
	height: 50px;
}

table {
	margin-top: 20px;
	border-collapse: collapse;
	width: 450px;
}

table td {
	padding: 5px;
	border: 1px solid black;
}

table input[type="number"], table input[type="text"] {
	width: 80px;
}
</style>
<script>
	function check(obj) {
		//정규식으로 특수문자 판별
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;

		//배열에서 하나씩 값을 비교
		if (regExp.test(obj.value)) {
			//값이 일치하면 문자를 삭제
			obj.value = obj.value.replace(regExp, '');
		}
	}
</script>
</head>

<body>
	<div class="button-container">
		<a href="./A_01.jsp"> <input type="button" value="후보등록"
			style="background-color: yellow"></a> <a href="./B_01.jsp"> <input
			type="button" value="투표"></a> <a href="./C_01.jsp"> <input
			type="button" value="개표결과"></a>
	</div>

	<div style="text-align: center" class="container">
		<form method="post" action="A_03.jsp">
			<table>
				<%
				VoteItemDao voteItemDao = new VoteItemDaoImpl();
				List<VoteItem> voteItemList = voteItemDao.huboAll();
				for (VoteItem hb : voteItemList) {
				%>
				<tr>
					<td>기호번호 : <%=hb.getId()%></td>
					<td>후보명 : <%=hb.getName()%></td>
					<td>
						<button type="button"
							onclick="location.href='A_02.jsp?id=<%=hb.getId()%>';">삭제</button>
					</td>
				</tr>
				<%
				}
				VoteItemDao voteItemDao2 = new VoteItemDaoImpl();
				List<VoteItem> voteItemList2 = voteItemDao.huboAll();
				%>
				<tr>
					<td>기호번호 : *자동입력</td>
					<td>후보명 : <input type="text" name="name" value=""
						onkeydown="check(this)" onkeyup="check(this)" pattern="^[가-힣]+$"
						required title="한글만 입력하세요"></td>
					<td><input type="submit" value="추가"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>