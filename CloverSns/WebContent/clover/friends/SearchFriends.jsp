
<%@page import="java.util.Vector"%>
<%@page import="login_reg.MemberDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="dto" class="login_reg.MemberDto"></jsp:useBean>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
	<title>Insert title here</title>
	<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" type="text/css">
	<script  type="text/javascript">
		function fnFriendRequest(name){
			var del=confirm(name+"님께 친구 요청을 보내시겠습니까?");
			document.friendRequest.submit();
			
		}
		
		function isNull(){
			if(document.keyword.value != null || document.keyword.value != ""){
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
</head>

<body>
	<form method="post" name="search" action="/CloverSns/friend.action">
		<div class="container">
			<div class="row">
				<h2>친구 찾기</h2>
				<div id="custom-search-input">
					<div class="input-group col-md-12">
						<input type="text" name="keyword" class="search-query form-control" placeholder="Search" title="r"/> 
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

 <!--    <hgroup class="mb20">
		<h1>Search Results</h1>
		<h2 class="lead"><strong class="text-danger">3</strong> results were found for the search for <strong class="text-danger">Lorem</strong></h2>								
	</hgroup>
 -->
    <section class="col-xs-12 col-sm-6 col-md-12">
    <%
    	Vector searchResult = (Vector)request.getAttribute("searchResult");
		if(searchResult == null){
		%>
			검색결과가 없습니다.
		<%	
		}else{
	    	for(int i =0; i< searchResult.size();i++){
	    		 dto = (MemberDto)searchResult.get(i);
	    %>
			<article class="search-result row">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<%if(dto.getMem_img() !=null){ %>
					<a href="#" title="Lorem ipsum" class="thumbnail"><img src="<%=dto.getMem_img() %>" alt="Lorem ipsum" /></a>
					<%}else{ %>
					<a href="#" title="Lorem ipsum" class="thumbnail"><img src="http://lorempixel.com/250/140/people" alt="Lorem ipsum" /></a>
					<%} %>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2">
					<ul class="meta-search">
						<li><i class="glyphicon glyphicon-calendar"></i> <span><%= dto.getMem_name()%><%=dto.getMem_id()%></span></li>
						<!-- <li><i class="glyphicon glyphicon-time"></i> <span>4:28 pm</span></li>
						<li><i class="glyphicon glyphicon-tags"></i> <span>People</span></li> -->
					</ul>
				</div>
				<form action="/CloverSns/friend.action" name="friendRequest" method="post">
					<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
						<!-- <h3><a href="#" title="">Voluptatem, exercitationem, suscipit, distinctio</a></h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, exercitationem, suscipit, distinctio, qui sapiente aspernatur molestiae non corporis magni sit sequi iusto debitis delectus doloremque.</p>						 -->
		                <span class="plus">친구추가
							<input type="button" onclick="fnFriendRequest('<%= dto.getMem_name()%>')"><i class="glyphicon glyphicon-plus"></i></input>
		                <!-- <a href="#" title="Lorem ipsum"></a> -->
		                </span>
					</div>
					<input type="hidden" name="command" value="friendRequest"/>
					<input type="hidden" name="id_get" value="<%= dto.getMem_id()%>" />
					<input type="hidden" name="id_req" value="kwonjy123" />
				</form>
				<span class="clearfix borda"></span>
			</article>
			<%
	    	}
		}
		%>
	</section>
</div>
</body>
</html>