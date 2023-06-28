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
			width: 550px;
			height:100%;
		}
		.button-container {
			margin-top: 20px;
			padding: 10px;
			border: 1px solid black;
			width: 550px;
			height:100%;
		}
		.button-container a {
			margin-right: 10px;
			text-decoration: none;
			width: 100%;
			height:100%;
			
		}
		.button-container input[type="button"] {
			width: 130px;
			height: 50px;
		}
		table {
			margin-top: 20px;
			border-collapse: collapse;
			width: 100%;
			height:100%;
			
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

	<div style="text-align: left" class="container">

		<table>
			<%
			VoteItemDao voteItemDao = new VoteItemDaoImpl();
			List<VoteItem> tupyoItemList = voteItemDao.tupyoAll();
			List<VoteItem> huboItemList = voteItemDao.huboAll();
			

			for (VoteItem tp : tupyoItemList) {
				int a = tp.getHuboId();
				VoteItem voteItem = new VoteItem();
				voteItem =voteItemDao.oneHubo(a);		
				int oneName = tp.getRate();				
			%>
			<tr>
				<td><a href = "./C_02.jsp?number=<%=tp.getHuboId()%>"><%=tp.getHuboId() + " : " + voteItem.getOneName()%></a></td>
				<td><img src="bar.PNG" width=<%=tp.getRate() * 300 / 100%>
					height=25px><%=tp.getRate()%>%(<%=tp.getCount()%>표)</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>