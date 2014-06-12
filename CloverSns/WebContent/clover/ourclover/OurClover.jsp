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
 
	css에 position2가 겹쳐질 두장의 사진중 위쪽에 배치시키는것.
	position1이 사진 밑에 배치시키는것.
	
	사진을 배열할때는 사진 리스트 <div style="position: absolute; top:50px; left:20px"> 부분에서 top과 left값으로 조정.
	for문에서 i=0부터 반복 돌릴때 top:(i*50)+50 px ; left:(i*20)+20; 식으로 돌리면 배열될듯??
	
	사진 클릭했을 때 뜨는 모달창은 사진리스트 부분의 data-target에서 .pic숫자와
	모달창 부분의 pic숫자에서 숫자를 통일시켜주는것으로 구분. (글번호로 하면 될듯?)

-->

<%
	String id = (String)session.getAttribute("id");

	ContentDao dao = new ContentDao();
	ContentDto dto = new ContentDto();

	Vector ourclover_vector = dao.getOurclover(id);

	int totalRecord = 0; // 전체 글의 갯수
	int numPerPage = 20; // 한 페이지당 보여질 글의 갯수
	int pagePerBlock = 5; // 한 블럭당 페이지 수
	int totalPage = 0; // 전체 페이지 수
	int totalBlock = 0; // 전체 블럭 수
	int nowPage = 0; // 현재 페이지 번호
	int nowBlock = 0; // 현재 블럭 번호
	int beginPerPage = 0; // 페이지당 시작 번호
	
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

<!-- 사진 리스트 (for문) -->

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

<!-- 페이징 입니다.!! -->
      <div class="row text-center" >

            <div class="paging">
                <ul class="pagination">
                	<%
                		if(nowBlock==0){ //첫번째 블럭일때 클릭방지
                	%>
                   		<li class="disabled"><a>&laquo;</a></li>                			
                    <% 
                		}else{
                			%>
                   		<li><a href="OurClover.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>">&laquo;</a></li>                			
                		<% 
                		}
                		for(int i=0; i<pagePerBlock; i++){ //for문 돌면서 블럭 출력
	                    	if(i == 0){ %>
	                    		<script>document.getElementById("list2").class="active";</script>
	                    	<% } 
	                    	if((nowBlock*pagePerBlock) + i<totalPage){//필요한 페이지만 블럭에 나타나도록 
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
                    	}else{ //마지막 블럭일 때 클릭 방지 
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
	위에 사진들을 position:absolute로 잡아서 footer도 absolute로 잡아줘야함
	footer의 top 속성값은 사진 갯수에 비례해서 증가하도록 해야할듯?
-->

	<div style="text-align: center">
		<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
	
	
	
<!-- 모달 -->
<jsp:include page="/clover/modal/impressionModal.jsp"></jsp:include>
<jsp:include page="/clover/modal/picModal.jsp"></jsp:include>

</body>
</html>