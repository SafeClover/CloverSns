<%@page import="content.ContentDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="dao" class="content.ContentDao"></jsp:useBean>
<jsp:useBean id="dto" class="content.ContentDto"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
    
    <title>Contest</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet">
    
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script src="/CloverSns/style/js/carousel.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   $(document).ready(function() { // 페이지 로딩이 끝나면 처리합니다.
        $(".iframe", parent.document).height($(document).height());  // 부모창에있는 아이프레임(클래스가 ifrm인) 높이 조절
   });  
   
   $(document).ready(function(){
	      $("#vote input").one("click", function like_cnt(){
	         $(this).prev().html(parseInt($(this).prev().html()) + 1);            
	            if(typeof(Storage)!=="undefined"){
	                if (localStorage.clickcount){  //localStorage 객체는 데이터를 날짜 기한 없이 데이터를 저장한다. 
	                     localStorage.clickcount=Number(localStorage.clickcount)+1;
	                  }
	                else{
	                     localStorage.clickcount=1;
	                  }
	                   document.getElementById("result").innerHTML= localStorage.clickcount + " 명이 행복을 기부했습니다.";
	                   document.getElementById("like").disabled="disabled";
	             }
	              else{
	                document.getElementById("result").innerHTML="당신이 사용하고 있는 브라우저는 web storage를 지원하지 않습니다.";
	             }
	         return false;
	      });
	   });
</script>

</head>
<body style="overflow: scroll;">

	<% 
		Vector v = dao.getContest();
	
		int totalRecord = 0; // 전체 글의 갯수
		int numPerPage = 10; // 한 페이지당 보여질 글의 갯수
		int pagePerBlock = 5; // 한 블럭당 페이지 수
		int totalPage = 0; // 전체 페이지 수
		int totalBlock = 0; // 전체 블럭 수
		int nowPage = 0; // 현재 페이지 번호
		int nowBlock = 0; // 현재 블럭 번호
		int beginPerPage = 0; // 페이지당 시작 번호
		
		totalRecord = v.size();
		totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));

		
		if(request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));


		if(request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));


		beginPerPage = nowPage * numPerPage;


		totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
	%>

      <div class="row">
      
         <div class="title">
            <h1 class="page-header">콘테스트</h1>
            <h3>주제는 ㅁㅁㅁ 입니다.</h3>
         </div> <!-- title 끝 -->
         
      </div> <!-- row 끝 -->


   <!-- 제목 입니다. -->
   <div class="container">
      <div class="row">
         <h2>명예의 전당</h2>
      </div>
       
       <div class="row">
           <!-- carousel 부분입니다.(코드 걍 퍼옴) -->
           <div id="transition-timer-carousel" class="carousel slide transition-timer-carousel" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
            	<% 
            	for(int i=0; i<1; i++){
            		if(i == 0){
            	%>      <li class="active" data-target="#transition-timer-carousel" data-slide-to="<%= i %>" id="list"></li>
					<%}else{ %>
						<li data-target="#transition-timer-carousel" data-slide-to="<%= i %>" id="list"></li>
				<% 		}
            	} %>
            </ol>

			<!-- 카루셀 레이아웃 -->
			<div class="carousel-inner">
				<% 
					for(int i=0; i<1; i++){ 
						dto = (ContentDto)v.get(i);
						
						if(i == 0){
				 %>
							<div class="item active">
								<a href="#" data-toggle="modal"
									data-target=".contest<%= dto.getUpNo() %>"> <img
									class="image" src="/CloverSns/img/<%= dto.getImg_route() %>"
									style="width: 500px; height: 400px;" />
								</a>
								<div class="carousel-caption">
									<h1 class="carousel-caption-header"><%= dto.getSubject() %></h1>
									<p class="carousel-caption-text hidden-sm hidden-xs">
										<%= dto.getId() %>
									</p>
								</div>
							</div>
				<% }
						else{
				%>
							<div class="item">
								<a href="#" data-toggle="modal"
									data-target=".contest<%= dto.getUpNo() %>"> <img
									class="image" src="/CloverSns/img/<%= dto.getImg_route() %>"
									style="width: 500px; height: 400px;" />
								</a>
								<div class="carousel-caption">
									<h1 class="carousel-caption-header"><%= dto.getSubject() %></h1>
									<p class="carousel-caption-text hidden-sm hidden-xs">
										<%= dto.getId() %>
									</p>
								</div>
							</div>
							
				<%
						}
					} %>
				
			</div> 
			<!-- 카루셀 끝 -->
            <!-- Controls -->
            <a class="left carousel-control" href="#transition-timer-carousel" data-slide="prev">
               <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#transition-timer-carousel" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
               
               <!-- Timer "progress bar" -->
               <hr class="transition-timer-carousel-progress-bar animate" />
         </div>
       </div>
   </div>
   <!-- 윗 부분 레이아웃 끝 -->
   
   <hr/>
   
   <!-- 사진 리스트입니다!(for문 쓰면 될거에요) -->
   <div class="container">
   
      <div class="row">
   	  <% 
   		for(int i=beginPerPage; i<beginPerPage + numPerPage; i++){
   			if(i == totalRecord){
   				break;
   			}
   			
   			dto = (ContentDto)v.get(i); 	
   	  %>
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".contest<%= dto.getUpNo() %>">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/img/<%= dto.getImg_route() %>" style="width: 150px; height: 150px;">
               <h3><%= dto.getSubject() %></h3>
            </a>
            <p>작성자 : <%= dto.getId() %></p>
         </div> <!-- col4 끝 -->    
      <% } %>             
      </div> <!-- row 끝 -->
      
      <hr/>
      
      <!-- 페이징 입니다.!! -->
      <div class="row text-center">

            <div class="paging">
                <ul class="pagination">
                	<%
                		if(nowBlock==0){ //첫번째 블럭일때 클릭방지
                	%>
                   		<li class="disabled"><a>&laquo;</a></li>                			
                    <% 
                		}else{
                			%>
                   		<li><a href="ContestBoard.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>">&laquo;</a></li>                			
                		<% 
                		}
                		for(int i=0; i<pagePerBlock; i++){ //for문 돌면서 블럭 출력
	                    	if(i == 0){ %>
	                    		<script>document.getElementById("list2").class="active";</script>
	                    	<% } 
	                    	if((nowBlock*pagePerBlock) + i<totalPage){//필요한 페이지만 블럭에 나타나도록 
	                    		if(i == nowPage){
	                    	%>		<li class="active"><a href="ContestBoard.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock) + i%>" id="list2"><%=(nowBlock*pagePerBlock) + i + 1%></a></li>
		                    <%	}else{
	                    	%>		<li><a href="ContestBoard.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock) + i%>" id="list2"><%=(nowBlock*pagePerBlock) + i + 1%></a></li>		
		                    <%
		                    	}
	                    	} 
                    	} 
                    	if(nowBlock+1<totalBlock){
                    	%>
                    		<li><a href="ContestBoard.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>">&raquo;</a></li>
                		<%
                    	}else{ //마지막 블럭일 때 클릭 방지 
                		%>
                    		<li class="disabled"><a>&raquo;</a></li>                			
                		<% 
                		}%>
                </ul>	
            </div>
        </div>
   </div> <!-- container 끝 -->


   	<!-- 모달 (Popover) 창 -->
   	<% 
   	for(int i=0; i<v.size(); i++){
   		dto = (ContentDto)v.get(i);
   	%>
   	<div class="container">
      <div class="row">
         <div class="modal fade contest<%= dto.getUpNo() %> aaa">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                     	X
                     </button>
                     <h3 class="modal-title"><%= dto.getSubject() %></h3>
                     <h5>작성일 : <%= dto.getRegdate() %></h5>
                     <div id="vote" style="text-align: center">
                        <span>0</span>명                  
                        <input type="button" value="like" id="like" name="like" onclick="like_cnt()" />
                        <div id="result"></div>
                     </div>
                  </div> <!-- 모달 헤더끝 -->
                  <div class="modal-body">
                     <img src="/CloverSns/img/<%= dto.getImg_route() %>" class="img-responsive center-block">
                     <div class="modal-body">
                        작성자 : <%= dto.getId() %><br/>
                        내용 : <%= dto.getContent() %><br/>
                     </div>
                  </div> <!-- 모달 바디 끝 -->
                  <div class="modal-footer">
                     <button type="button" class="btn btn-primary close" data-dismiss="modal" >닫기</button>  
                  </div>
               </div> <!-- 모달 컨텐트 끝 -->
            </div> <!-- 모달 다이아로그 끝 -->
         </div> <!-- 모달 pop1 끝 -->
      </div> <!-- row 끝 -->
   </div> <!-- container 끝 -->
<% } %>

	<div style="text-align: center;">
		<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>

</body>