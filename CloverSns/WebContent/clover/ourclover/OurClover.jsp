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

<jsp:useBean id="xml" class="ourclover.XMLController"></jsp:useBean>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<link href="/CloverSns/style/css/ourclover/ourclover.css" rel="stylesheet">
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/ajax.js"></script>

<script>
	 
	function UpNoInsert(upno){
		 document.getElementById("upno").value = upno;
		 document.getElementById("id").value = id;
	}
	
	function pic_ModalClose(){
		$(".modal").modal("hide");
	}
	
	function impression_Submit(){
		$(".modal").modal("hide");
		document.impression_form.submit();
	}

     
    function PicDelete(upNo){
 		var params = "upNo="+upNo;
 		var url = "/CloverSns/xml.action";
 		sendRequest(url, params, callback, null);
 	}
 	
 	function callback(){
 		 if (httpRequest.readyState == 4) {
 	         if (httpRequest.status == 200) {
 	         }
 		}
 	}
 	
 // ��ī��Ʈ
 	function fnTimer(upno){
		var sec = 6;
		var timer = setInterval(function(){
	 		$("#counter span").text(--sec + "sec");
	 		if(sec == 0){
	 			$(".modal").modal("hide");
	 			document.getElementById("upno").value = upno;
	 			$(".impression").modal("show");
	 			clearInterval(timer);
	 		}
	 	}, 1000);
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
	int numPerPage = 20; // �� �������� ������ ���� ����
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

<div class="container" style="width: 100%;">
	<div class="row" style="width: 100%;">
<%
	Vector alreadyContents = new Vector();
	alreadyContents = xml.getXmldata(id);
	

	int x =beginPerPage;
	for(int i=beginPerPage; i<beginPerPage + numPerPage; i++){
		
		int top = x%20;
		
		/* if(i>=20){
			top = i%20;
		} */
		
		if(i == totalRecord){
			break;
		}
		
		dto = (ContentDto)ourclover_vector.get(i);
		
		boolean check = false;
		
		for(int j=0; j<alreadyContents.size(); j++){
			if(dto.getUpNo() == Integer.parseInt((String)alreadyContents.get(j))){
				/* System.out.println("dto.getupno ���Ͷ� : "+dto.getUpNo());
				System.out.println("Integer ���Ͷ� : "+Integer.parseInt((String)alreadyContents.get(j))); */
				check = true;
				break;
			}
		}
		
		if(check == true){
			continue;
		}
		
		/* if(dto.getUpNo() == already){
			continue;
		} */
		
%>

<!-- ���� ����Ʈ (for��) -->

	<div class="img_click" style="position: absolute; top: <%=(Math.floor((double)top/5)*380)+100%>px; left: <%=((x%5)*293)+80%>px;">
		<a href="#" data-toggle="modal" data-target=".ourclover<%=dto.getUpNo()%>" onclick="PicDelete('<%=dto.getUpNo()%>'); fnTimer('<%=dto.getUpNo()%>')">
			<h4><b style="margin-left: 20px"><%= dto.getUpNo() %>&nbsp;&nbsp;&nbsp;<%= dto.getSubject() %></b></h4> 
			<img class="pictureCover" src="/CloverSns/style/img/clover.png">
		</a>
	</div>
	
	<img class="picture" src="/CloverSns/img/<%= dto.getImg_route() %>" style="margin-top: 140px;">

<%		x++;
	}
		
%>
</div>
	<hr/>

<!-- ����¡ �Դϴ�.!! -->
      <div class="row text-center" >

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

	<div style="text-align: center">
		<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
	
	
	
<!-- ��� -->
<p id="impression"></p>
<jsp:include page="/clover/modal/impressionModal.jsp"></jsp:include>
<jsp:include page="/clover/modal/picModal.jsp"></jsp:include>

</body>
</html>