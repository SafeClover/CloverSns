<%@page import="content.ContentDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean class="content.ContentDao" id="dao"></jsp:useBean>
<jsp:useBean class="content.ContentDto" id="dto"></jsp:useBean>
<jsp:useBean id="dao1" class="login_reg.MemberDao"></jsp:useBean>
<jsp:useBean id="dto1" class="login_reg.MemberDto"></jsp:useBean>
<jsp:useBean id="dto2" class="content.Mypage_replyDto"></jsp:useBean>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" />
<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet">
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<style>
	#b_hover:HOVER {
		background: skyblue;
	}
	
</style>
</head>

<body>

<% 
	Vector v = dao.getMypage((String)session.getAttribute("id"));
	
	dto1.setMem_id((String)session.getAttribute("id"));
	Vector v1 = dao1.getInfo(dto1);
	
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

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col" style="float:left">
				<div style="margin-right: 50px; float:left;">

				<%
					for(int i=0; i<v1.size(); i++){
						v1.get(i);
				%>
					<div style="margin-right: 50px;">
						<%
							if(dto1.getMem_img().equals("경로")){
						%>
							
							<img src="/CloverSns/style/img/noimage.jpg" style="width:200px; height: 200px; border-radius: 50px;" />
							<br/>
							<a href="/CloverSns/clover/infoedit/InfoEditImg.jsp" target="head" style="margin-left: 15px;">
							<b>클릭시 프로필 사진 변경</b></a>
							
						<%	
							}
							else{
						%>
							<img src="/CloverSns/img/<%= dto1.getMem_img() %>" style="width:200px; height: 200px; border-radius: 50px;" />
							<br/>
							<a href="/CloverSns/clover/infoedit/InfoEditImg.jsp" target="head" style="margin-left: 15px;">
							<b>클릭시 프로필 사진 변경</b></a>
						
						<%		
							}
						%>
						
					</div>
									
					</div>
					<div style="margin-top: 50px;">
						<span>
							<h4 style="font-family: 휴먼모음T">
								<span id="b_hover">아이디 : <%= dto1.getMem_id() %></span><br/>
								<span id="b_hover">이름 : <%= dto1.getMem_name() %></span><br/>
								<span id="b_hover">이메일 : <%= dto1.getMem_email() %></span><br/>
								<span id="b_hover">생일 : <%= dto1.getMem_birth() %></span>
							</h4>
						</span>
					</div>
				<%
					}
				%>
			</div>
			<div class="col" align="right">
				<a href="/CloverSns/clover/infoedit/InfoEdit.jsp" target="head">
					<img src="/CloverSns/style/img/Gear.png" style="width:40px; height:40px;"/><span id="b_hover">프로필수정</span>
				</a>
			</div>
		</div>
	</div>

	<br />
	<br />
	<hr />
	<br />
	<br />
	
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
            <p>작성자 : <%= dto.getName() %></p>
         </div> <!-- col4 끝 -->    
      <% } %>             
      </div> <!-- row 끝 -->
      
      <hr/>
      
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
      <div class="container" style="width: 70%;">
      <div class="row">
         <div class="modal fade contest<%= dto.getUpNo() %> aaa">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        X
                     </button>
                     <h3 class="modal-title"><span id="b_hover"><%= dto.getSubject() %></span></h3>
                     <h5>작성일 : <span id="b_hover"><%= dto.getRegdate() %></span></h5>
                  </div> <!-- 모달 헤더끝 -->
                  <div class="modal-body">
                     <img src="/CloverSns/img/<%= dto.getImg_route() %>" class="img-responsive center-block">
                     <div class="modal-body">
                        작성자 : <b id="b_hover"><%= dto.getName() %></b><br/>
                        내용 : <span id="b_hover"><%= dto.getContent() %><br/></span>
                     </div>
                  </div> <!-- 모달 바디 끝 -->
                  <div>
                  <%
          	  		dto2.setUpNo(dto.getUpNo());
          	  		Vector v2 = dao.selectReply(dto2);
          	  		
                  	if(v2.size() > 0){
                  	
                  %>
              	  	<h4 style="text-align: center;"><b><span id="b_hover">감상평</span></b></h4>
              	  	
              	  	<%	
                  	}
              	  		for(int j=0; j<v2.size(); j++){
              	  			v2.get(j);
              	  	%>
              	  			<span id="b_hover" style="margin-left: 10px;"><%= dto2.getName() %>  | <%= dto2.getRe() %> | <%= dto2.getRegdate() %></span>
              	  	<%
              	  		}
              	  	%>
                  </div>
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