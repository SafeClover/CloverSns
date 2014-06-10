<%@page import="java.math.RoundingMode"%>
<%@page import="board.ServiceDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<HTML>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
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
<BODY>
<h2 align="center">문의 게시판</h2>
<br/><br/>
<jsp:useBean id="dao" class="board.ServiceDao" />
<%!public String getParam(HttpServletRequest req, String pName){
		if(req.getParameter("keyWord") != null){
			return req.getParameter("keyWord");
		}
		else
			return "";
	}
	// paging에 필요한 변수
	int totalRecord = 0; // 전체 글의 갯수
	int numPerPage = 5; // 한 페이지당 보여질 글의 갯수
	int pagePerBlock = 3; // 한 블럭당 페이지 수
	int totalPage = 0; // 전체 페이지 수
	int totalBlock = 0; // 전체 블럭 수
	int nowPage = 0; // 현재 페이지 번호
	int nowBlock = 0; // 현재 블럭 번호
	int beginPerPage = 0; // 페이지당 시작 번호%>

<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");

	if(keyField == null)
		keyField = "name";
	
	if(request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")){
	keyWord = "";
		}
	}

	Vector list = dao.getQuestionList(keyField, keyWord);
	
	totalRecord = list.size();
	totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));
	
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	if(request.getParameter("nowBlock") != null){
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	}
	
	beginPerPage = nowPage * numPerPage;
	totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
%>

<form method="post" action="deleteproc.question" name="select" />
<input type="hidden" name="question" value="DELETEPROC" />
<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align="right">
		<a href="post.question?question=POST">[글쓰기]</a>
		<a href="javascript:list()">[처음으로]</a>
	</td>
</tr>
<tr>
	<td align=center colspan=2>
		<table class="table table-striped" border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center height=120%>
				<td width="10%"> 번호 </td>
				<td widht="40%"> 제목 </td>
				<td width="20%"> 이름 </td>
				<td width="20%"> 날짜 </td>
				<td width="10%"> 조회수 </td>
			</tr>		
			
			<%
									if(list.isEmpty()){
								%>
					<b>등록된 글이 없습니다.</b>
			<%
				}
					else{
						for(int i=beginPerPage; i<beginPerPage+numPerPage; i++){
							if(i == totalRecord){
								break;
							}
							ServiceDto dto = (ServiceDto)list.get(i);
			%>
			
			<tr align="center">
				<td><%=dto.getBoardUpNo()%></td>
				<td align="left"><%=dao.useDepth(dto.getDepth())%>
				<% if(dto.getDepth() > 0){ %>
						<img alt="" src="../image/re.gif">
				<% } %><a href="javascript:read('<%= dto.getBoardUpNo() %>')"><%= dto.getTitle() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getRegDate()%></td>
				<td><%=dto.getCount()%></td>
			</tr>
			
			<%
					}
				}
			%>
			
		</table>
	</td>
</tr>
<tr><td></td></tr>
<tr>
		<td align="center">Go to Page&nbsp;
		<% if(nowBlock > 0){ %>
			<a href="list.question?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>&question=LIST">
			이전<%=pagePerBlock%>개</a>
			&nbsp;&nbsp;:::
		<% }
				for(int i=0; i<pagePerBlock; i++){
					if((nowBlock*pagePerBlock) + i == totalPage){
						break;
					}
			%>
					<a href="list.question?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock) + i%>&question=LIST">
					<%= (nowBlock*pagePerBlock) + i + 1 %></a>&nbsp;
			<%		 
				}
			%>
			<% if(totalBlock > nowBlock+1){ %>
				&nbsp;&nbsp;:::
				<a href="list.question?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>&question=LIST">
				다음<%=pagePerBlock%>개</a></td>
			<% } %>
	</tr>
</table>
</form>
<BR>
<form action="list.question" name="search" method="post">
<input type="hidden" name="question" value="LIST" />
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="id" /> 이름
				<option value="title" /> 제목
				<option value="boardContent" /> 내용
			</select>


			<input type="text" size="16" name="keyWord" value='<%= getParam(request, "keyWord") %>' />
			<input class="btn btn-default" type="button" value="찾기" onClick="check()" />
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
	 <input type="hidden" name="keyField" value="<%= keyField %>" />
	 <input type="hidden" name="keyWord" value="<%= keyWord %>" />
</form>	

</BODY>
</HTML>
