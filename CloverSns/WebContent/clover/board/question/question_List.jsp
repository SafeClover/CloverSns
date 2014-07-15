<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<HTML>
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

	function check(){
		if(document.search.keyWord.value == ""){
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}

	function list(){
		document.list.action="list.question?question=LIST";
		document.list.submit();
	}
	
	function read(param){
		document.read.boardUpNo.value=param;
		document.read.submit();
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
						<img src="/CloverSns/style/img/BoardImg/client.jpg" /><h3>������</h3>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="#">
					<form action="list.notice" name="notice" method="post">
						<img src="/CloverSns/style/img/BoardImg/notice.jpg" onclick="fnNoticeSubmit()"/><h3>��������</h3>
						<input type="hidden" name="notice" value="LIST" />
					</form>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="#">
					<form action="list.question" name="question" method="post">
						<img src="/CloverSns/style/img/BoardImg/question.jpg" onclick="fnQuestionSubmit()"/><h3>���� �Խ���</h3>
						<input type="hidden" name="question" value="LIST" />
					</form>
					</a>
				</td>
				
				<td  valign="top" align="center" width="100px">
					<a href="/CloverSns/clover/board/qna/Q&A_List.jsp">
						<img src="/CloverSns/style/img/BoardImg/QnA.jpg" /><h3>���� ã�� ����</h3>
					</a>
				</td>
			</tr>
		</tbody>
		
		<tbody>
			<tr >
				<td colspan="4" valign="top">
					
					<h2 align="center">���� �Խ���</h2>
					<br/><br/>
					<jsp:useBean id="dao" class="board.ServiceDao" />
					
					
					<!-- <form method="post" action="deleteproc.question" name="select" />
					<input type="hidden" name="question" value="DELETEPROC" /> -->
					<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
					<tr>
						<td align="right">
							<a href="post.question?question=POST">[�۾���]</a>
							<a href="javascript:list()">[ó������]</a>
						</td>
					</tr>
					<tr>
						<td align=center colspan=2>
							<table class="table table-striped" border=0 width=100% cellpadding=2 cellspacing=0>
								<tr align=center height=120%>
									<td width="10%"> ��ȣ </td>
									<td widht="40%"> ���� </td>
									<td width="20%"> �̸� </td>
									<td width="20%"> ��¥ </td>
									<td width="10%"> ��ȸ�� </td>
								</tr>		
								<c:choose>
								<c:when test="${list == null}">
											<b>��ϵ� ���� �����ϴ�.</b><br/>
								</c:when>
								<c:otherwise>
									<c:forEach begin="${beginPerPage}" end="${beginPerPage + numPerPage}" step="1" items="${list}" var="n_list" >
										<c:if test="${beginPerPage eq totalRecord}">
										</c:if>
										<tr align="center">
											<%-- <td>${n_list.boardUpNo}</td>
											<td><a href="javascript:read('${n_list.boardUpNo}')">${n_list.title}</a></td>
											<td>${n_list.regDate}</td>
											<td>${n_list.count}</td> --%>
										
											<td>${n_list.boardUpNo}</td>
											<td align="left">
											${usedepth}
											 <c:if test="${n_list.depth>0}">
													<img alt="" src="/CloverSns/style/img/re.png" style="width: 30px; height: 20px;">
											</c:if> <a href="javascript:read('${n_list.boardUpNo}')">${n_list.title}</td>
											<td>${n_list.id}</td>
											<td>${n_list.regDate }</td>
											<td>${n_list.count}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
								</c:choose>

							</table>
						</td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td align="center">Go to Page&nbsp;
						<c:if test="${nowBlock > 0}">
							<a href="list.question?nowBlock=${nowBlock-1}&nowPage=${pagePerBlock*(nowBlock-1)}&question=LIST">
												����${pagePerBlock}��</a>
												&nbsp;&nbsp;:::
						</c:if>
						<c:forEach begin="0" end="${pagePerBlock}" step="1" var="i">
							<c:if test="${(nowBlock*pagePerBlock) + i == totalPage}">
							</c:if>
									<a href="list.question?nowBlock=${nowBlock}&nowPage=${(nowBlock*pagePerBlock) + i}&question=LIST">
									${(nowBlock*pagePerBlock) + i + 1}</a>&nbsp;
							</c:forEach>
								&nbsp;&nbsp;:::
							<c:if test="${totalBlock > nowBlock + 1}">
								<a href="list.question?nowBlock=${nowBlock + 1}&nowPage=${pagePerBlock*(nowBlock + 1)}&question=LIST">
								����${pagePerBlock}��</a></td>
							</c:if>
					</tr>
					</table>
					
					<BR>
					<form action="list.question" name="search" method="post">
					<input type="hidden" name="question" value="LIST" />
						<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
						<tr>
							<td align=center valign=bottom>
								<select name="keyField" size="1">
									<option value="id" /> �̸�
									<option value="title" /> ����
									<option value="boardContent" /> ����
								</select>
								<input type="text" size="16" name="keyWord" value='${keyState}' />
								<input class="btn btn-default" type="button" value="ã��" onClick="check()" />
								<input type="hidden" name="page" value= "0" />
							</td>
						</tr>
						</table>
					</form>
					<form name="list" method="post">
						<input type="hidden" name="reload" value="true" />
						<input type="hidden" name="question" value="LIST" />
					</form>
					
					<form name="read" method="post" action="read.question">
						 <input type="hidden" name="question" value="READ" />
						 <input type="hidden" name="boardUpNo" />
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
