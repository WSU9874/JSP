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
</body>
<div class="button-container">
	<input type="button" value="후보등록" style="background-color: yellow">
	<input type="button" value="투표"> <input type="button"
		value="개표결과"> <br> 후보등록 결과 : 후보가 추가(삭제 되었습니다.)
	<button type="button" onclick="location.href='A_01.jsp';">뒤로</button>
</div>

</html>