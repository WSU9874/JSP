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
	</style>
</head>

<body>
	<div class="button-container">
		<input type="button" value="후보등록" >
		<input type="button" value="투표" style="background-color: yellow"> <input type="button"
			value="개표결과"> <br> 투표 결과 : 투표하였습니다.
		<button type="button" onclick="location.href='B_01.jsp';">뒤로</button>
	</div>

</body>

</html>