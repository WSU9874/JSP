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
<script>

/* 이미지 미리보기 */
function setThumbnail(event) {
	const fileInput = event.target;
	const file = event.target.files[0];
	if(!file.type.match('image/jpeg') && !file.type.match('image/png')) {
		alert("JPEG 또는 PNG 이미지만 업로드해주세요.");
		fileInput.value = "";	//파일 입력 초기화
		
	} else {
	
   var reader = new FileReader();

   reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("width", "400");
      img.setAttribute("height", "300");
      
      var container = document.querySelector("div#image_container");
      // 기존 이미지 삭제
      while (container.firstChild) {
         container.firstChild.remove();
      }
      
      container.appendChild(img);
   };

   reader.readAsDataURL(event.target.files[0]);
}
}

	function spaceCheck(){
		 var titleBox = document.getElementById("name").value.trim();
		 var contentBox = document.getElementById("content").value.trim();
		 document.getElementById("name").value = titleBox;
		 document.getElementById("content").value = contentBox;
	}
	
	function textCheck(){
		var textareaStr = document.getElementById("content").value;
		var titleBoxStr =  document.getElementById("name").value;
		document.getElementById("content").value = textareaStr.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;").replaceAll("\\", "&#39;");
		document.getElementById("name").value = titleBoxStr.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;").replaceAll("\\", "&#39;");
		
	}

    function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%
	JegoItemDao jegoItemDao = new JegoItemDaoImpl();
	JegoItem jegoItem = new JegoItem();
	jegoItem = jegoItemDao.date();
	List<String> a = jegoItemDao.SearchId();
	%>

	<script>
	  function printId()  {
    	  const goodsCode = document.getElementById("id").value;
    	  const goodsCode1 = document.getElementById("id");
    	  
    	  <%=a%>.forEach(i => {
    		if(i == goodsCode){
    			document.getElementById("id").value = null;
    			alert("중복된 코드입니다.");
    			return false;
    		} 
    	  });
    	  
    	  }
	</script>

	<form method="post" action="jego_write.jsp"
		enctype="multipart/form-data">
		<table border="1" style="text-align: center">
			<tr>
				<td width="150px">상품 번호</td>
				<td><input type="number" name="id" required min="0" id="id"
					maxlength="13" oninput="numberMaxLength(this);"
					onchange="printId()"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input style="width: 90%;" type="text" name="name" value=""
					id="name" pattern="[A-Za-z0-9\uAC00-\uD7A3\s]+" required
					maxlength="30" required></td>
			</tr>
			<tr>
				<td>재고 현황</td>
				<td><input style="width: 40%;" type="number" name="jego"
					value="" min="0" maxlength="13" oninput="numberMaxLength(this);"
					required></td>
			</tr>
			<tr>
				<td>재고 일자</td>
				<td><%=jegoItem.getNewDate()%></td>
			</tr>
			<tr>
				<td>등록 일자</td>
				<td><%=jegoItem.getNewDate()%></td>
			</tr>
			<tr>
				<td>상품 설명</td>
				<td><textarea style="width: 98%; height: 100px;" required
						maxlength="155000" name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td style="text-align: center">상품 사진</td>
				<td>
					<div id="image_container" style="width: 400px; height: 300px;"></div>
					첨부파일: <input type="file" name="fileName" id="image"
					accept="image/*" onchange="setThumbnail(event)">
				</td>
			</tr>
		</table>
		<button type="button" onclick="location.href='Jego_list.jsp'">취소</button>
		<input type="submit" value="완료" onclick=spaceCheck();textCheck()>
	</form>
</body>
</html>