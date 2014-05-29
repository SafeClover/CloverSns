<%@page import="board.ServiceDto"%>
<%@page import="board.ServiceDao"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html;charset=EUC-KR" %>
<HTML>
<head>
<jsp:useBean id="dao" class="board.ServiceDao" />
<script src="/CloverSns/style/js/bootstrap.js"></script>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어 없음.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
	
	function list(){
		document.list.action="list.notice?notice=LIST";
		document.list.submit();
	} 
	
	function read(param){
		document.read.boardUpNo.value=param;
		document.read.submit();
	}
	document.onkeydown = trapRefresh;
	function trapRefresh(){
		if(event.keyCode == 116){
			event.keyCode = 0;
			event.cancelBubble = true;
			event.returnValue = false;
			document.service.location.reload();
		}
	}
</script>
</head>
<BODY>
<h2 align="center">공지사항</h2>
<%!public String getParam(HttpServletRequest req, String pName){
		if(req.getParameter("keyWord") != null){
			return req.getParameter("keyWord");
		}
		else{
			return "";
		}
			
	}

	// 페이징에 필요한 변수를 선언부에 선언
	int totalRecord = 0;		// 전체 글의 갯수
	int numPerPage = 15;			// 한 페이지당 보여질 글의 갯수
	int pagePerBlock = 5;		// 한 블럭당 보여질 페이지 수
	int totalPage = 0;			// 전체 페이지 수
	int totalBlock = 0;			// 전체 블럭 수
	int nowPage = 0;			// 현재 페이지 번호
	int nowBlock = 0;			// 현재 블럭 번호
	int beginPerPage = 0;		// 한 페이지당 시작 번호 (페이지당 시작 번호부터 시작해서 몇개의 글을 뿌릴것인지 정할 수 있다.)%>

<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	if(keyField == null){
		keyField = "";
	}
	
	if(request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")){
			keyWord="";
		}
	}
	
	if(keyWord==null){
		keyWord="";
	}
	
	Vector list = dao.getNoticeList(keyField, keyWord);
	
	totalRecord = list.size();
	totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));

	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	if(request.getParameter("nowBlock") != null){
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	}
	
	beginPerPage = numPerPage * nowPage;
	
	totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
	
%>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
	<tr>
		<form method="post" action="list.notice" name="notice">
		<input type="hidden" name="notice" value="LIST" />
			<td align="right">
				<a href="list.notice?notice=POST">[글쓰기]</a>
				<a href="javascript:list()">[처음으로]</a>
			</td>
		</form>
	</tr>
	<tr>
		<td align=center colspan=2>
			<table class="table table-striped" border=0 width=100% cellpadding=2 cellspacing=0>
				<tr align=center height=120%>
					<td> 번호 </td>
					<td> 제목 </td>
					<td> 날짜 </td>
					<td> 조회수 </td>
				</tr>
	
		</td>
	</tr>
	
<%
	if(list.isEmpty()){
%>
	<b>등록된 글이 없습니다.</b>
<%		
	}
	else{
		for(int i=beginPerPage; i<(beginPerPage + numPerPage); i++){
			if(i == totalRecord){
				break;
			}
			
			ServiceDto dto = (ServiceDto)list.get(i);
			
%>

	<tr align="center">
		
		<td><%= dto.getBoardUpNo() %></td>
		<td><a href="javascript:read('<%=dto.getBoardUpNo()%>')"><%= dto.getTitle() %></a></td>
		<td><%= dto.getUploadDate() %></td>
		<td><%=dto.getCount() %></td>
	</tr>
	
<%
		}
	}
%>
	</table>
<tr>
	<td></td>
</tr>

	<tr>
		<td align="center">Go to Page&nbsp;
		<% if(nowBlock > 0){ %>
			<a href="list.notice?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>&notice=LIST">
			이전<%=pagePerBlock%>개</a>
			&nbsp;&nbsp;:::
		<% }
				for(int i=0; i<pagePerBlock; i++){
					if((nowBlock*pagePerBlock) + i == totalPage){
						break;
					}
			%>
					<a href="list.notice?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock) + i%>&notice=LIST">
					<%= (nowBlock*pagePerBlock) + i + 1 %></a>&nbsp;
			<%		 
				}
			%>
			<% if(totalBlock > nowBlock+1){ %>
				&nbsp;&nbsp;:::
				<a href="list.notice?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>&notice=LIST">
				다음<%=pagePerBlock%>개</a></td>
			<% } %>
	</tr>
	</table>
	
	<BR>
	<form action="list.notice" name="search" method="post">
	<input type="hidden" name="notice" value="LIST" />
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="title"> 제목 </option>
				<option value="boardContent"> 내용 </option>
			</select>

			<input type="text" size="16" name="keyWord" value='<%= getParam(request, "keyWord") %>'/>
			<input type="button" value="찾기" onClick="check()"/>
			<input type="hidden" name="page" value= "0"/>
		</td>
	</tr>
	</table>
</form>

<form name="list" method="post" >
	<input type="hidden" name="reload" value="true" />
</form>

<form name="read" method="post" action="read.notice">
	<input type="hidden" name="notice" value="READ" />
	<input type="hidden" name="boardUpNo" />
	<input type="hidden" name="keyField" value="<%= keyField %>" />
	<input type="hidden" name="keyWord" value="<%= keyWord %>" />
</form>

</BODY>
</HTML>