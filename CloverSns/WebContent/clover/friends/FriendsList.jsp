<%@page import="javax.naming.directory.SearchResult"%>
<%@page import="login_reg.MemberDto"%>
<%@page import="java.util.Vector"%> 
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<jsp:useBean id="dao" class="login_reg.MemberDao"></jsp:useBean>
<jsp:useBean id="dto" class="login_reg.MemberDto"></jsp:useBean>
<jsp:useBean id="dao2" class="content.ContentDao"></jsp:useBean>
<jsp:useBean id="dto2" class="content.ContentDto"></jsp:useBean>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" />
<link href="/CloverSns/style/css/friends/bootstrap.min.css" rel="stylesheet" />
<link href="/CloverSns/style/css/friends/feature-carousel.css" rel="stylesheet" />
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/jquery.waterwheelCarousel.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>
 <script  type="text/javascript">
 		
		function fnFriendRequest(name, id){
			
			var del=confirm(name+"님께 친구 요청을 보내시겠습니까?");
			if(del==true){
				document.getElementById("keywordfor").value = document.getElementById("keyword").value;
				document.getElementById("id_get").value=id;
				document.friendRequest.submit();	
				
			}
			
		}
		
		function isNull(){
			if(document.getElementById("keyword").value != null || document.getElementById("keyword").value != ""){
				document.search.submit();
			}
		}
	</script>
	<style>
	
	#custom-search-input {
	        margin:0;
	        margin-top: 10px;
	        padding: 0;
	    }
	 
	    #custom-search-input .search-query {
	        padding-right: 3px;
	        padding-right: 4px \9;
	        padding-left: 3px;
	        padding-left: 4px \9;
	        /* IE7-8 doesn't have border-radius, so don't indent the padding */
	 
	        margin-bottom: 0;
	        -webkit-border-radius: 3px;
	        -moz-border-radius: 3px;
	        border-radius: 3px;
	    }
	 
	    #custom-search-input button {
	        border: 0;
	        background: none;
	        /** belows styles are working good */
	        padding: 2px 5px;
	        margin-top: 2px;
	        position: relative;
	        left: -28px;
	        /* IE7-8 doesn't have border-radius, so don't indent the padding */
	        margin-bottom: 0;
	        -webkit-border-radius: 3px;
	        -moz-border-radius: 3px;
	        border-radius: 3px;
	        color:#D9230F;
	    }
	 
	    .search-query:focus + button {
	        z-index: 3;   
	    }
		
	.container-result { margin-top: 20px; }
	.mb20 { margin-bottom: 20px; } 
	
	/* hgroup { padding-left: 15px; border-bottom: 1px solid #ccc; }
	hgroup h1 { font: 500 normal 1.625em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin-top: 0; line-height: 1.15; }
	hgroup h2.lead { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin: 0; padding-bottom: 10px; }
	 */
	.search-result .thumbnail { border-radius: 0 !important; }
	.search-result:first-child { margin-top: 0 !important; }
	.search-result { margin-top: 20px; }
	.search-result .col-md-2 { border-right: 1px dotted #ccc; min-height: 140px; }
	.search-result ul { padding-left: 0 !important; list-style: none;  }
	.search-result ul li { font: 400 normal .85em "Roboto",Arial,Verdana,sans-serif;  line-height: 30px; }
	.search-result ul li i { padding-right: 5px; }
	.search-result .col-md-7 { position: relative; }
	.search-result h3 { font: 500 normal 1.375em "Roboto",Arial,Verdana,sans-serif; margin-top: 0 !important; margin-bottom: 10px !important; }
	.search-result h3 > a, .search-result i { color: #248dc1 !important; }
	.search-result p { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; } 
	.search-result span.plus { position: absolute; right: 0; top: 126px; }
	.search-result span.plus a { background-color: #248dc1; padding: 5px 5px 3px 5px; }
	.search-result span.plus a:hover { background-color: #414141; }
	.search-result span.plus a i { color: #fff !important; }
	.search-result span.border { display: block; width: 97%; margin: 0 15px; border-bottom: 1px dotted #ccc; }
	</style> 
	
<script type="text/javascript">
      $(document).ready(function () {
        var carousel = $("#carousel").waterwheelCarousel({
          flankingItems: 3,
          movingToCenter: function ($item) {
            $('#callback-output').prepend('movingToCenter: ' + $item.attr('id') + '<br/>');
          },
          movedToCenter: function ($item) {
            $('#callback-output').prepend('movedToCenter: ' + $item.attr('id') + '<br/>');
          },
          movingFromCenter: function ($item) {
            $('#callback-output').prepend('movingFromCenter: ' + $item.attr('id') + '<br/>');
          },
          movedFromCenter: function ($item) {
            $('#callback-output').prepend('movedFromCenter: ' + $item.attr('id') + '<br/>');
          },
          clickedCenter: function ($item) {
            $('#callback-output').prepend('clickedCenter: ' + $item.attr('id') + '<br/>');
          }
        }
        );

        $('#prev').bind('click', function () {
          carousel.prev();
          return false
        });

        $('#next').bind('click', function () {
          carousel.next();
          return false;
        });

        $('#reload').bind('click', function () {
          newOptions = eval("(" + $('#newoptions').val() + ")");
          carousel.reload(newOptions);
          return false;
        });
      }
   
      ); 

    </script>
    
</head>
<body>

<%
	dto2.setId((String)session.getAttribute("id"));
 	Vector myfriends = dao.getMyfriends((String)session.getAttribute("id"));
   	Vector searchResult = (Vector)request.getAttribute("searchResult");
%>
   <div class="container1" style="margin-top: 50px;">
      <div class="row">
         <h1 style="text-align: center">돌아가는 내친구</h1>
            <div id="carousel" style="background-color: black;">
            <%  if(myfriends != null){
                  for(int i= 0; i<myfriends.size();i++){
                  dto = (MemberDto)myfriends.get(i);
                  if(dto.getMem_img().equals("경로")){
            %>
                  <a href="#"><img src="/CloverSns/style/img/Logo.png" id="item-<%=i %>" style="width: 250px; height: 300px"/></a>
            <%
                  }
                  
                  if(!dto.getMem_img().equals("경로")){
            %>
                  <a href="#"><img src="/CloverSns/img/<%= dto.getMem_img() %>" id="item-<%=i %>" style="width: 250px; height: 300px"/></a>            
            <%
                  }
               }
            }%>
            </div>
               <a href="#" id="prev">후진</a> | <a href="#" id="next">전진</a>
            <br/>
      </div>
   </div>
	
	<!-- 내친구/아이디 검색 탭 -->
	<ul class="nav nav-tabs">
	<%if(request.getAttribute("tab")!="search"){%>
  		 <li class="active"><a href="#home" data-toggle="tab">내 친구</a></li>
 		 <li><a href="#searchID" data-toggle="tab">아이디 검색</a></li>
 	<%}else{ %>	
  		 <li><a href="#home" data-toggle="tab">내 친구</a></li>
 		 <li class="active"><a href="#searchID" data-toggle="tab">아이디 검색</a></li>
 	<%} %>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
	<!-- 내친구 부분 -->
	<%if(request.getAttribute("tab")!="search"){%>
	  <div class="tab-pane active" id="home">
	<%}else{ %>
	  <div class="tab-pane" id="home">
	 <%} 
	 %>
	  	<!-- 이부분 for문 이용 하여 친구목록 불러온다 -->
		<div class="container1">
			<div class="row">
		<%  if(myfriends != null){
				for(int i= 0; i<myfriends.size();i++){
				dto = (MemberDto)myfriends.get(i);
			%>
				<div class="span2">
					<a href="#" class="thumbnail">
					<%if(dto.getMem_img()==null){ %>
						<img src="/CloverSns/style/img/hero.jpg">
					<%}else{ %> 
						<img src="/CloverSns/img/<%= dto.getMem_img() %>">
					<%}%> 
						<i><%=dto.getMem_name()%></i><br/>
						<i><%=dto.getMem_birth()%></i>
					</a>
				</div>
				<%}
			} %>
			</div>
		</div>
	</div>
	  
	  <!-- 아이디 검색 부분 -->
	  <%if(request.getAttribute("tab")!="search"){%>
	  <div class="tab-pane" id="searchID">
	  <%}else{ %>
	  <div class="tab-pane active" id="searchID">
	  <%} %>
<%-- 	  <jsp:include page="/clover/friends/SearchFriends.jsp"></jsp:include> --%>
	  	 <form method="post" name="search" action="/CloverSns/friend.action">
			<div class="container">
				<div class="row">
					<h2>친구 찾기</h2>
					<div id="custom-search-input">
						<div class="input-group col-md-12">
						<%if(request.getAttribute("keyword")==null){ %>
							<input type="text" name="keyword" class="search-query form-control" placeholder="Search" title="r"/> 
						<%}else{ %> <!-- 검색어 유지 -->
							<input type="text" id="keyword" name="keyword" value="<%=request.getAttribute("keyword")%>" class="search-query form-control" placeholder="Search" title="r"/> 
						<%} %>
							<span class="input-group-btn">
								<button class="btn btn-danger" type="button" onclick="isNull()">
									<span class=" glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="command" value="search" />
		</form> 
		
		<div class="container container-result">
		
	    <section class="col-xs-12 col-sm-6 col-md-12">
	    <%
	    	
			if(searchResult == null){
			%>
				검색결과가 없습니다.
			<%	
			}else{
				%>
				<form action="/CloverSns/friend.action" name="friendRequest" method="post">
				<%
		    	for(int i =0; i< searchResult.size();i++){
		    		Vector list = (Vector)searchResult.get(i);
		    		String getMem_id = (String)list.get(0);
		    		String getMem_name = (String)list.get(1);
		    		String isFriendorAlarm = (String)list.get(2);
		    		String getMem_img = (String)list.get(3);
		    %>
				<article class="search-result row">


					<div class="col-xs-12 col-sm-12 col-md-3">
						<a href="#" title="Lorem ipsum" class="thumbnail">
							<img src="/CloverSns/img/<%= getMem_img %>" alt="Lorem ipsum" />
						</a>
					</div>

					<div class="col-xs-12 col-sm-12 col-md-2">
						<ul class="meta-search">
							<li><i class="glyphicon glyphicon-calendar"></i> <span><%=getMem_name%><%=getMem_id %></span></li>
						</ul>
					</div>
					
					
					<!-- 친구 추가 버튼 -->
					
						<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
						<%if(isFriendorAlarm.equals("1")){%>
							<span class="plus">친구추가
								<input type="button" onclick="fnFriendRequest('<%= getMem_name%>','<%=getMem_id%>')"><i class="glyphicon glyphicon-plus"></i></input>
			               	<!-- <a href="#" title="Lorem ipsum"></a> -->
			                </span>
			             <%}else if(isFriendorAlarm.equals("2")){%>
			             	친구 신청 대기중
			             <%}else{ %>
			             	우린 이미 친구!
			             <%} %>
						</div>
						 <input type="hidden" name="command" value="friendRequest"/>
			             <input type="hidden" id="keywordfor" name="keywordfor" />
						<input type="hidden" name="id_get" id="id_get"/> 
					
					<span class="clearfix borda"></span>
				</article>
				<%
		    	}
				%>
			</form>
		
		<%
			}
			%>
		</section>
	</div> 
	  </div>
	</div>

	
	<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	
</body>

</html>

