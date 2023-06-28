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
<%
int number = Integer.parseInt(request.getParameter("number"));
VoteItemDao voteItemDao = new VoteItemDaoImpl();
VoteItem voteItem = new VoteItem();
voteItem = voteItemDao.oneHubo(number);
%>
<style>
		.container {
			text-align: center;
			padding: 10px;
			border: 1px solid black;
			width: 440px;
			height:100%;
			
		}
		.button-container {
			margin-top: 20px;
			padding: 10px;
			border: 1px solid black;
			width: 440px;
			height: 100%;
		}
		.button-container a {
			margin-right: 10px;
			text-decoration: none;
			width: 100%;
			
			height: 100%;
			
		}
		.button-container input[type="button"] {
			width: 130px;
			height: 50px;
		}
		table {
			margin-top: 20px;
			border-collapse: collapse;
			width: 100%;
			height: 100%;
			
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
			href="./B_01.jsp"> <input type="button" value="투표"></a> <a
			href="./C_01.jsp"> <input type="button" value="개표결과"
			style="background-color: yellow"></a>
	</div>
	<%
	AgeRate ageRate = new AgeRate();
	ageRate = voteItemDao.rate(number);
	%>
	<div style="text-align: left" class="container">
		<table>
			<tr>
				<td><%=number + ". " + voteItem.getOneName()%> 후보 득표성향 분석</td>
			</tr>
			<tr>
				<td>10대 :<img src="bar.PNG"
					width=<%=ageRate.getVote10() * 300 / 100%> height=25px> <%=ageRate.getVote10()%>%(<%=ageRate.getCount10()%>표)	
			</tr>
			<tr>
				<td>20대 :<img src="bar.PNG"
					width=<%=ageRate.getVote20() * 300 / 100%> height=25px> <%=ageRate.getVote20()%>%(<%=ageRate.getCount20()%>표)		
			</tr>
			<tr>
				<td>30대 :<img src="bar.PNG"
					width=<%=ageRate.getVote30() * 300 / 100%> height=25px> <%=ageRate.getVote30()%>%(<%=ageRate.getCount30()%>표)	
			</tr>
			<tr>
				<td>40대 :<img src="bar.PNG"
					width=<%=ageRate.getVote40() * 300 / 100%> height=25px> <%=ageRate.getVote40()%>%(<%=ageRate.getCount40()%>표)		
			</tr>
			<tr>
				<td>50대 :<img src="bar.PNG"
					width=<%=ageRate.getVote50() * 300 / 100%> height=25px> <%=ageRate.getVote50()%>%(<%=ageRate.getCount50()%>표)			
			</tr>
			<tr>
				<td>60대 :<img src="bar.PNG"
					width=<%=ageRate.getVote60() * 300 / 100%> height=25px> <%=ageRate.getVote60()%>%(<%=ageRate.getCount60()%>표)				
			</tr>
			<tr>
				<td>70대 :<img src="bar.PNG"
					width=<%=ageRate.getVote70() * 300 / 100%> height=25px> <%=ageRate.getVote70()%>%(<%=ageRate.getCount70()%>표)				
			</tr>
			<tr>
				<td>80대 :<img src="bar.PNG"
					width=<%=ageRate.getVote80() * 300 / 100%> height=25px> <%=ageRate.getVote80()%>%(<%=ageRate.getCount80()%>표)				
			</tr>
			<tr>
				<td>90대 :<img src="bar.PNG"
					width=<%=ageRate.getVote90() * 300 / 100%> height=25px> <%=ageRate.getVote90()%>%(<%=ageRate.getCount90()%>표)						

			</tr>
			<tr><td><button type="button" onclick="location.href='C_01.jsp';">뒤로</button></td></tr>
		</table>
	</div>
</body>
</html>