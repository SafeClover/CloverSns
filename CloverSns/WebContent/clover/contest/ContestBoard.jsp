<%@page import="content.HappyDto"%>
<%@ page import="content.ContentDto"%>
<%@ page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="dao" class="content.ContentDao"></jsp:useBean>
<jsp:useBean id="dto" class="content.ContentDto"></jsp:useBean>
<jsp:useBean id="dao1" class="content.HappyDao"></jsp:useBean>
<jsp:useBean id="dto1" class="content.HappyDto"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<%
		String id = (String)session.getAttribute("id");
		Vector v = dao.getContest();
		Vector happy = dao1.selectSmile();
	%>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
     
    <title>Contest</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" />
<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet" />
    
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script src="/CloverSns/style/js/carousel.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() { // ������ �ε��� ������ ó���մϴ�.
	     $(".iframe", parent.document).height($(document).height());  // �θ�â���ִ� ����������(Ŭ������ ifrm��) ���� ����
	});  
</script>
</head>
<body style="overflow: scroll;">
<% 		
		int num=0;

		int totalRecord = 0; // ��ü ���� ����
		int numPerPage = 10; // �� �������� ������ ���� ����
		int pagePerBlock = 5; // �� ���� ������ ��
		int totalPage = 0; // ��ü ������ ��
		int totalBlock = 0; // ��ü �� ��
		int nowPage = 0; // ���� ������ ��ȣ
		int nowBlock = 0; // ���� �� ��ȣ
		int beginPerPage = 0; // �������� ���� ��ȣ
		
		totalRecord = v.size();
		totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));

		
		if(request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));


		if(request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));


		beginPerPage = nowPage * numPerPage;


		totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
%>
<span id="aa" value="<%=num%>"></span>	

      <div class="row">
      
         <div class="title">
            <h1 class="page-header">���׽�Ʈ</h1>
            <h3>������ ������ �Դϴ�.</h3>
         </div> <!-- title �� -->
         
      </div> <!-- row �� -->


   <!-- ���� �Դϴ�. -->
   <div class="container">
      <div class="row">
         <h2>���� ����</h2>
      </div>
       
       <div class="row">
           <!-- carousel �κ��Դϴ�.(�ڵ� �� �ۿ�) -->
           <div id="transition-timer-carousel" class="carousel slide transition-timer-carousel" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
            	<% 
            	for(int i=0; i<happy.size(); i++){
            		if(i == 0){
            	%>      <li class="active" data-target="#transition-timer-carousel" data-slide-to="<%= i %>" id="list"></li>
				<%
					}
            		else{ 
            	%>
						<li data-target="#transition-timer-carousel" data-slide-to="<%= i %>" id="list"></li>
				<% 		
					}
            	} 
            	%>
            </ol>

			<!-- ī�缿 ���̾ƿ� -->
			<div class="carousel-inner">
				<% 
					for(int i=0; i<happy.size(); i++){
						dto = (ContentDto)happy.get(i);
						
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
										<%= dto.getName() %>
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
										<%= dto.getName() %>
									</p>
								</div>
							</div>
							
				<%
						}
					} %>
				
			</div> 
			<!-- ī�缿 �� -->
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
   <!-- �� �κ� ���̾ƿ� �� -->
   
   <hr/>
   
   <!-- ���� ����Ʈ�Դϴ�!(for�� ���� �ɰſ���) -->
   <div class="container">
   
      <div class="row">
   	  <% 
   		for(int i=beginPerPage; i<beginPerPage + numPerPage; i++){
   			if(i == totalRecord){
   				break;
   			}
   			dto = (ContentDto)v.get(i);
   	  %>
         <div class="col portfolio-item" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 150;">
            <a href="#" data-toggle="modal" data-target=".contest<%= dto.getUpNo() %>">
	           	<span style="text-align: center"><%= dto.getUpNo() %></span><br/>
               <img class="img img-responsive img-thumbnail" src="/CloverSns/img/<%= dto.getImg_route() %>" style="width: 150px; height: 150px;">
               <h3 alt="<%= dto.getSubject() %>"><%= dto.getSubject() %></h3>
            </a>
            <p>�ۼ��� : <%= dto.getName() %></p>
         </div> <!-- div �� -->    
      <% } %>             
      </div> <!-- row �� -->
      
      <hr/>
      
      <!-- ����¡ �Դϴ�.!! -->
      <div class="row text-center">

            <div class="paging">
                <ul class="pagination">
                	<%
                		if(nowBlock==0){ //ù��° ���϶� Ŭ������
                	%>
                   		<li class="disabled"><a>&laquo;</a></li>                			
                    <% 
                		}else{
                			%>
                   		<li><a href="ContestBoard.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>">&laquo;</a></li>                			
                		<% 
                		}
                		for(int i=0; i<pagePerBlock; i++){ //for�� ���鼭 �� ���
	                    	if(i == 0){ %>
	                    		<script>document.getElementById("list2").class="active";</script>
	                    	<% } 
	                    	if((nowBlock*pagePerBlock) + i<totalPage){//�ʿ��� �������� ���� ��Ÿ������ 
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
                    	}else{ //������ ���� �� Ŭ�� ���� 
                		%>
                    		<li class="disabled"><a>&raquo;</a></li>                			
                		<% 
                		}%>
                </ul>	
            </div>
        </div>
   </div> <!-- container �� -->
   
	<jsp:include page="/clover/modal/ContestModal.jsp"></jsp:include>
	<jsp:include page="/clover/bar/footer.jsp"></jsp:include>

</body>
</html>