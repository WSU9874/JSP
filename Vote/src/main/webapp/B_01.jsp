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
			height:300px;
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
		table input[type="number"],
		table input[type="text"] {
			width: 80px;
		}
	</style>
</head>

<body>
	<div class="button-container">
		<a href="./A_01.jsp"> <input type="button" value="후보등록"></a> <a
			href="./B_01.jsp"> <input type="button" value="투표"
			style="background-color: yellow"></a> <a href="./C_01.jsp"> <input
			type="button" value="개표결과"></a>
	</div>

	<div style="text-align: center" class="container">
		<form method="post" action="B_03.jsp">

			<table>
				<%
				VoteItemDao voteItemDao = new VoteItemDaoImpl();
				List<VoteItem> voteItemList = voteItemDao.huboAll();
				%>

				<tr>
					<td><select name="id">
							<option value="" selected disabled><%=""%></option>
							<%
							for (VoteItem hb : voteItemList) {
								String a = String.format("%d %s", hb.getId(), hb.getName());
								String id = String.valueOf(hb.getId());
								String b = String.format("%s",id);
							%>
							<option value="<%=b%>"><%=a%></option>
							<%
							}
							%>
					</select></td>
					<td><select name="age">
							<option value="" selected disabled><%=""%></option>
							
							<option value="10" >10대</option>
							<option value="20" >20대</option>
							<option value="30" >30대</option>
							<option value="40" >40대</option>
							<option value="50" >50대</option>
							<option value="60" >60대</option>
							<option value="70" >70대</option>
							<option value="80" >80대</option>
							<option value="90" >90대</option>
						
					</select></td>
					<td><input type="submit" value="투표하기" onclick="location.href='B_03.jsp';"></td>
				</tr>
			</table>


		</form>
	</div>

</body>


</html>