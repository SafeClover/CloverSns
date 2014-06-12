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
	
	function fnSelect(){
        var params = "params="+0;
        sendRequest("/CloverSns/clover/ourclover/OurClover_XML.jsp", params, callback, "POST");
     }
     
     function callback(){
         if(httpRequest.readyState == 4){
               if(httpRequest.status == 200){
	              var xmlDoc = httpRequest.responseXML;
	              var friends = xmlDoc.getElementsByTagName("friends");
		        /* 
	              for(var i=0; i<friends.length; i++){
		              var upNo = xmlDoc.getElementsByTagName("friends")[i].firstChild.firstChild.nodeValue;
		              alert(upNo[i]);
	              }
	            */
               }
               else{
                  alert(httpRequest.status);
               }
         }
     }

     window.onload = function(){ fnSelect(); };

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

	int already = Integer.parseInt(xml.getXmldata(id));

	for(int i=beginPerPage; i<beginPerPage + numPerPage; i++){
		int top = i;
		
		if(i>=20){
			top = i%20;
		}
		
		if(i == totalRecord){
			break;
		}
		
		dto = (ContentDto)ourclover_vector.get(i);
		 if(dto.getUpNo()==already){
			continue;
		} 
		
		dto = (ContentDto)ourclover_vector.get(i);
%>

<!-- ���� ����Ʈ (for��) -->

	<div style="position: absolute; top: <%=(Math.floor((double)top/5)*250)%>px; left: <%=((i%5)*293)+80%>px;">
		<a href="#" data-toggle="modal" data-target=".ourclover<%=dto.getUpNo()%>" >
			<img class="pictureCover" src="/CloverSns/style/img/clover.png">
		</a>
	</div>

	 
		<img class="picture" src="/CloverSns/img/<%= dto.getImg_route() %>">
	

<%		
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
<jsp:include page="/clover/modal/impressionModal.jsp"></jsp:include>
<jsp:include page="/clover/modal/picModal.jsp"></jsp:include>

</body>
</html>