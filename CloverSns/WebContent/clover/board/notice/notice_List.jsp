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
			alert("�˻��� ����.");
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
<h2 align="center">��������</h2>
<%!public String getParam(HttpServletRequest req, String pName){
		if(req.getParameter("keyWord") != null){
			return req.getParameter("keyWord");
		}
		else{
			return "";
		}
			
	}

	// ����¡�� �ʿ��� ������ ����ο� ����
	int totalRecord = 0;		// ��ü ���� ����
	int numPerPage = 15;			// �� �������� ������ ���� ����
	int pagePerBlock = 5;		// �� ���� ������ ������ ��
	int totalPage = 0;			// ��ü ������ ��
	int totalBlock = 0;			// ��ü �� ��
	int nowPage = 0;			// ���� ������ ��ȣ
	int nowBlock = 0;			// ���� �� ��ȣ
	int beginPerPage = 0;		// �� �������� ���� ��ȣ (�������� ���� ��ȣ���� �����ؼ� ��� ���� �Ѹ������� ���� �� �ִ�.)%>

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
				<a href="list.notice?notice=POST">[�۾���]</a>
				<a href="javascript:list()">[ó������]</a>
			</td>
		</form>
	</tr>
	<tr>
		<td align=center colspan=2>
			<table class="table table-striped" border=0 width=100% cellpadding=2 cellspacing=0>
				<tr align=center height=120%>
					<td> ��ȣ </td>
					<td> ���� </td>
					<td> ��¥ </td>
					<td> ��ȸ�� </td>
				</tr>
	
		</td>
	</tr>
	
<%
	if(list.isEmpty()){
%>
	<b>��ϵ� ���� �����ϴ�.</b>
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
			����<%=pagePerBlock%>��</a>
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
				����<%=pagePerBlock%>��</a></td>
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
				<option value="title"> ���� </option>
				<option value="boardContent"> ���� </option>
			</select>

			<input type="text" size="16" name="keyWord" value='<%= getParam(request, "keyWord") %>'/>
			<input type="button" value="ã��" onClick="check()"/>
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