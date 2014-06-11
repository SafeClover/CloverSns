<%@page import="java.util.Vector"%>
<%@page import="content.ContentDto"%>
<%@page import="content.ContentDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>OurClover</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<link href="/CloverSns/style/css/ourclover/ourclover.css" rel="stylesheet">
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>

<script>
/* 
	var now = new Date();
	var second = now.getSeconds();
	second = 0;
	
	function startCount(){
		var count = $("#count");
		
		if(second == 0) {
			second = 15 ;
		} else{
			second -= 1;
		}
		
		count.innerHTML = second;
		
		if(second != 0){
			setTimeout("startCount()", 1000);
		}
		else{
			$(".modal").modal("hide");
			$("#impression1").modal("show");
		}
	}
	 */
	 
	function pic_ModalClose(){
		$(".modal").modal("hide");
	}
	
	function impression_Submit(){
		$(".modal").modal("hide");
		document.impression_form.submit();
	}

</script>

</head>
<body>
<!--
 
	css�� position2�� ������ ������ ������ ���ʿ� ��ġ��Ű�°�.
	position1�� ���� �ؿ� ��ġ��Ű�°�.
	
	������ �迭�Ҷ��� ���� ����Ʈ <div style="position: absolute; top:50px; left:20px"> �κп��� top�� left������ ����.
	for������ i=0���� �ݺ� ������ top:(i*50)+50 px ; left:(i*20)+20; ������ ������ �迭�ɵ�??
	
	���� Ŭ������ �� �ߴ� ���â�� ��������Ʈ �κ��� data-target���� .pic���ڿ�
	���â �κ��� pic���ڿ��� ���ڸ� ���Ͻ����ִ°����� ����. (�۹�ȣ�� �ϸ� �ɵ�?)

-->

<%
	String id = (String)session.getAttribute("id");

	ContentDao dao = new ContentDao();
	ContentDto dto = new ContentDto();

	Vector ourclover_vector = dao.getOurclover(id);

	int totalRecord = 0; // ��ü ���� ����
	int numPerPage = 15; // �� �������� ������ ���� ����
	int pagePerBlock = 5; // �� ���� ������ ��
	int totalPage = 0; // ��ü ������ ��
	int totalBlock = 0; // ��ü �� ��
	int nowPage = 0; // ���� ������ ��ȣ
	int nowBlock = 0; // ���� �� ��ȣ
	int beginPerPage = 0; // �������� ���� ��ȣ
	
	totalRecord = ourclover_vector.size();
	totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));
	
	if(request.getParameter("nowPage") != null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock") != null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	beginPerPage = nowPage * numPerPage;
	
	totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
%>

<div class="container">
	<div class="row">
<%
	for(int i=beginPerPage; i<beginPerPage + numPerPage; i++){
		if(i == totalRecord){
			break;
		}
		
		dto = (ContentDto)ourclover_vector.get(i);
%>

<!-- ���� ����Ʈ (for��) -->

	<div style="position: absolute; top: <%=(Math.floor((double)i/5)*300)+50%>px; left: <%=((i%5)*300)+100%>px;">
		<div class="position2">
			<a href="#" data-toggle="modal" data-target=".ourclover<%=dto.getUpNo()%>" >
				<img class="picture" src="/CloverSns/style/img/clover.png">
			</a>
		</div>
		<div class="position1">
			<img class="picture" src="/CloverSns/img/<%= dto.getImg_route() %>">
		</div>
	</div>
	

<%		
	}
%>
</div>
	<hr/>

<!-- ����¡ �Դϴ�.!! -->
      <div class="row text-center" style="position: absolute; top:<%=Math.floor(((double)ourclover_vector.size()/5)*200)+250%>px; left:50%;">

            <div class="paging">
                <ul class="pagination">
                	<%
                		if(nowBlock==0){ //ù��° ���϶� Ŭ������
                	%>
                   		<li class="disabled"><a>&laquo;</a></li>                			
                    <% 
                		}else{
                			%>
                   		<li><a href="OurClover.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>">&laquo;</a></li>                			
                		<% 
                		}
                		for(int i=0; i<pagePerBlock; i++){ //for�� ���鼭 �� ���
	                    	if(i == 0){ %>
	                    		<script>document.getElementById("list2").class="active";</script>
	                    	<% } 
	                    	if((nowBlock*pagePerBlock) + i<totalPage){//�ʿ��� �������� ���� ��Ÿ������ 
	                    		if(i == nowPage){
	                    	%>		<li class="active"><a href="OurClover.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock) + i%>" id="list2"><%=(nowBlock*pagePerBlock) + i + 1%></a></li>
		                    <%	}else{
	                    	%>		<li><a href="OurClover.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock) + i%>" id="list2"><%=(nowBlock*pagePerBlock) + i + 1%></a></li>		
		                    <%
		                    	}
	                    	} 
                    	} 
                    	if(nowBlock+1<totalBlock){
                    	%>
                    		<li><a href="OurClover.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>">&raquo;</a></li>
                		<%
                    	}else{ //������ ���� �� Ŭ�� ���� 
                		%>
                    		<li class="disabled"><a>&raquo;</a></li>                			
                		<% 
                		}%>
                </ul>	
            </div>
        </div>
</div>


<!-- 
	footer
	���� �������� position:absolute�� ��Ƽ� footer�� absolute�� ��������
	footer�� top �Ӽ����� ���� ������ ����ؼ� �����ϵ��� �ؾ��ҵ�?
-->

	<div style="position: absolute; top:<%=Math.floor(((double)ourclover_vector.size()/5)*200)+300%>px; left:50%;">
		<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
	
	
	
<!-- ��� -->
<jsp:include page="/clover/modal/impressionModal.jsp"></jsp:include>
<jsp:include page="/clover/modal/picModal.jsp"></jsp:include>

</body>
</html>