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
<BODY>
<h2 align="center">���� �Խ���</h2>
<br/><br/>
<jsp:useBean id="dao" class="board.ServiceDao" />
<%!public String getParam(HttpServletRequest req, String pName){
		if(req.getParameter("keyWord") != null){
			return req.getParameter("keyWord");
		}
		else
			return "";
	}
	// paging�� �ʿ��� ����
	int totalRecord = 0; // ��ü ���� ����
	int numPerPage = 5; // �� �������� ������ ���� ����
	int pagePerBlock = 3; // �� ���� ������ ��
	int totalPage = 0; // ��ü ������ ��
	int totalBlock = 0; // ��ü �� ��
	int nowPage = 0; // ���� ������ ��ȣ
	int nowBlock = 0; // ���� �� ��ȣ
	int beginPerPage = 0; // �������� ���� ��ȣ%>

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
			
			<%
									if(list.isEmpty()){
								%>
					<b>��ϵ� ���� �����ϴ�.</b>
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
			����<%=pagePerBlock%>��</a>
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
				����<%=pagePerBlock%>��</a></td>
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
				<option value="id" /> �̸�
				<option value="title" /> ����
				<option value="boardContent" /> ����
			</select>


			<input type="text" size="16" name="keyWord" value='<%= getParam(request, "keyWord") %>' />
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
	 <input type="hidden" name="keyField" value="<%= keyField %>" />
	 <input type="hidden" name="keyWord" value="<%= keyWord %>" />
</form>	

</BODY>
</HTML>
