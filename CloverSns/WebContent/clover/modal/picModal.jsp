<%@page import="content.ContentDao"%>
<%@page import="java.util.Vector"%>
<%@page import="content.ContentDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
	function Reload(){
		history.go(0);
	}
	
    //esc키 막기
     $(document).keyup(function (e) { 
         if (e.keyCode == 27) { e.returnValue = false; }
     });
</script>

</head>
<body>

<c:forEach items="${ourclover_vector}" var="ourclover_vector">

<!-- 사진 팝업 모달창 (for문) -->
<div class="container">
      <div class="row">
         <div class="modal fade ourclover${ourclover_vector.upNo}">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="Reload()">
                     	X
                     </button>
                     <h3 class="modal-title">${ourclover_vector.subject}</h3>
                     <h5>작성일 : ${ourclover_vector.regdate}</h5>
                  </div> <!-- 모달 헤더끝 -->
                  <div class="modal-body">
                     <img src="/CloverSns/img/${ourclover_vector.img_route}" class="img-responsive center-block">
                     <div class="modal-body">
						작성자 : ${ourclover_vector.id}<br/>
						내용 : ${ourclover_vector.content}<br/>
                     </div>
                  </div> <!-- 모달 바디 끝 -->
                  <div class="modal-footer">
                  	<!-- <p style="font-size: 20px; font-weight:bold ; color: red;"></p>	15초 카운트 -->
                  	<div id="counter"><span style="font-size: 15pt; color:red;"></span></div>
                  	<input type="button" value="감상평" class="btn btn-primary" data-toggle="modal" data-target=".impression" data-dismiss="modal" aria-hidden="true" onclick="UpNoInsert('${ourclover_vector.upNo}','${ourclover_vector.id}')"/>
                    <button type="button" class="btn btn-primary close" id="close" data-dismiss="modal" aria-hidden="true" onclick="Reload()">닫기</button>
                  </div>
               </div> <!-- 모달 컨텐트 끝 -->
            </div> <!-- 모달 다이아로그 끝 -->
         </div> <!-- 모달 pop1 끝 -->
      </div> <!-- row 끝 -->
</div> <!-- container 끝 -->

</c:forEach>

</body>
</html>