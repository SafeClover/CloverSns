<%@page import="content.ContentDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean class="content.ContentDao" id="dao"></jsp:useBean>
<jsp:useBean class="content.ContentDto" id="dto"></jsp:useBean>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" />
<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet">
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>

</head>

<body>

<% 
	Vector v = dao.getMypage((String)session.getAttribute("id"));
	
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
   
	<!-- 프로필 -->

	<div class="container">
		<div class="row">
			<div align="right">
				<a href="/CloverSns/clover/infoedit/InfoEdit.jsp" target="head">
					<img src="/CloverSns/style/img/Gear.png" style="width:40px; height:40px;"/>프로필수정
				</a>
			</div>
		</div>
	</div>

	<br />
	<br />
	<hr />
	<br />
	<br />
	
	
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
                   		<li><a href="MyPage.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>">&laquo;</a></li>                			
                		<% 
                		}
                		for(int i=0; i<pagePerBlock; i++){ //for문 돌면서 블럭 출력
	                    	if(i == 0){ %>
	                    		<script>document.getElementById("list2").class="active";</script>
	                    	<% } 
	                    	if((nowBlock*pagePerBlock) + i<totalPage){//필요한 페이지만 블럭에 나타나도록 
	                    		if(i == nowPage){
	                    	%>		<li class="active"><a href="MyPage.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock) + i%>" id="list2"><%=(nowBlock*pagePerBlock) + i + 1%></a></li>
		                    <%	}else{
	                    	%>		<li><a href="MyPage.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock) + i%>" id="list2"><%=(nowBlock*pagePerBlock) + i + 1%></a></li>		
		                    <%
		                    	}
	                    	} 
                    	} 
                    	if(nowBlock+1<totalBlock){
                    	%>
                    		<li><a href="MyPage.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>">&raquo;</a></li>
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
</html>