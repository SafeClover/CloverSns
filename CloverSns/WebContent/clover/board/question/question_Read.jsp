<%@page import="board.ServiceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
	<script src="/CloverSns/style/js/bootstrap.js"></script>
	<style>	
		img{
			width:100px; height:100px;
		}
	</style>
	<script>
		function LockF5() { 
		    if (event.keyCode == 116) { 
		        event.keyCode = 0; 
		        return false; 
		    } 
		}
		document.onkeydown = LockF5;
		
		function fnNoticeSubmit() {
			document.notice.submit();
		}
		
		function fnQuestionSubmit() {
			document.question.submit();
		}
	</script>
</head>

<body style="margin-top: 20px; height: 0px;">
	<table  style="width: 100%;">

		<tbody>
			<tr>
				<td colspan="4" height="60px"></td>
			</tr>
			<tr>
				<td  valign="top" align="center" width="100px">
					<a href="/CloverSns/clover/board/service_index.jsp" >
						<img src="/CloverSns/style/img/BoardImg/client.jpg" /><h3>고객센터</h3>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="#">
					<form action="list.notice" name="notice" method="post">
						<img src="/CloverSns/style/img/BoardImg/notice.jpg" onclick="fnNoticeSubmit()"/><h3>공지사항</h3>
						<input type="hidden" name="notice" value="LIST" />
					</form>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="#">
					<form action="list.question" name="question" method="post">
						<img src="/CloverSns/style/img/BoardImg/question.jpg" onclick="fnQuestionSubmit()"/><h3>문의 게시판</h3>
						<input type="hidden" name="question" value="LIST" />
					</form>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="/CloverSns/clover/board/qna/Q&A_List.jsp">
						<img src="/CloverSns/style/img/BoardImg/QnA.jpg" /><h3>자주 찾는 질문</h3>
					</a>
				</td>
			</tr>
		</tbody>
		
		<tbody>
			<tr>
				<td colspan="4" valign="top">
					<br><br>
					<table class="table" align=center width=70% border=0 cellspacing=3 cellpadding=0>
					 <tr>
					  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
					 </tr>
					 <tr>
					  <td colspan=2>
					   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
					    <tr style="border-bottom: 1px solid #ddd; height: 50px;"> 
						 <td align=center width=10% style="border-right: 1px solid #ddd"> 작 성 자 </td>
						 <td style="padding-left: 20px;">${id}</td>
						 <td align=center width=10% style="border-right: 1px solid #ddd"> 작 성 일 </td>
						 <td style="padding-left:20px;">${regDate}</td>
					    <td colspan=4 align=right>
					     조회수 : ${count }
					    </td>
						</tr>
					    <tr style="height: 50px; border-bottom: 1px solid #ddd"> 
					     <td align=center style="border-right: 1px solid #ddd"> 글 제 목 </td>
					     <td colspan=3 style="padding-left: 20px;">${title}</td>
					   </tr>
					   <tr> 
					   	<td align=center style="border-right: 1px solid #ddd"> 글 내 용 </td>
					    <td colspan=4 style="height: 150px; padding-left: 20px;">${boardContent}</td>
					   </tr>
					   </table>
					  </td>
					 </tr>
					 <tr>
					  <td align=center colspan=2> 
						[ <a href="javascript:document.list.submit()">목 록</a>
						
						<c:if test="${sessionScope.id == 'admin'}">
						|
						<a href="update.question?boardUpNo=${boardUpNo}&question=UPDATE">수 정</a> |
						<a href="reply.question?boardUpNo=${boardUpNo}&question=REPLY">답 변</a> |
						<a href="delete.question?boardUpNo=${boardUpNo}&question=DELETE">삭 제</a> </c:if>]<br>
					  </td>
					 </tr>
					</table>
						<form name="list" method="post" action="list.question">
							<input type="hidden" name="question" value="LIST" />
							<input type="hidden" name="keyField" value="${keyField}" />
						 	<input type="hidden" name="keyWord" value="${keyWord}" />
						</form>
				</td>
			</tr>
		</tbody>	
		
	</table>
	
<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>

<jsp:include page="/clover/bar/header.jsp"></jsp:include>

</body>
</html>
