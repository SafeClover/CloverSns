<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet" />
<script src="/CloverSns/style/js/carousel.js"></script>
</head>

<script>
	var upNo = null;

	function reply_show(upNo){
		this.upNo = upNo;
		var params = "upNo=" + upNo;
		var url = "/CloverSns/contest.contest_ajax";
		sendRequest(url, params, callback_reply_show, null);
	}
	
	function callback_reply_show(){
		if (httpRequest.readyState == 4) {
	         if (httpRequest.status == 200) {
				var xmlDoc = httpRequest.responseXML;

				// 좋아요
				var count = xmlDoc.getElementsByTagName("count").item(0).textContent;
				var clicked = xmlDoc.getElementsByTagName("clicked").item(0).textContent;
				var p = document.getElementById("count" + upNo);
				
				p.innerHTML = count;
				
				if(clicked > 0){
					document.getElementById("like" + upNo).disabled="disabled";
				}
				
	         	   
				// 댓글
				var reply = document.getElementById("reply"+upNo);
						
				var list = xmlDoc.getElementsByTagName("reply");
				
				for(var i=0; i<list.length; i++){
					var name = xmlDoc.getElementsByTagName("name").item(i).textContent;
					var re = xmlDoc.getElementsByTagName("re").item(i).textContent;
					
					var reply_name = document.createElement("a");
					var reply_re = document.createElement("span");
					
					reply_name.setAttribute("href", "#");
					reply_name.setAttribute("id", "reply_name");
					reply_re.setAttribute("id", "reply_re");
					
					reply_name.innerHTML = name + "<br/>";
					reply_re.innerHTML = re + "<br/><hr/>";
					
					reply.appendChild(reply_name);
					reply.appendChild(reply_re);
				}
	         }
	         
		}
	}

	
	function fnTopic(){
		var topic = escape(encodeURIComponent(document.getElementById("topic").value));
		alert(topic);
		
		var params = "topic=" +topic+"&command=changeTopic";
		var url = "/CloverSns/contest.contest_ajax";
		sendRequest(url, params, callback_topic, "POST");
	}
	
	function callback_topic(){
		history.go(0);
	}
	
</script>

<body style="overflow: scroll; margin-top: 80px; height: 0px; overflow-x:hidden">

      <div class="row">
      
         <div class="title">
            <h1 class="page-header">콘테스트</h1>
            <h3>주제는 ${topic} 입니다.</h3>
         </div> <!-- title 끝 -->
         
         <c:if test="${sessionScope.id=='admin'}">
      		<div>
      			<input type="text" id="topic"/>
      			<input type="button" value="주제 변경" onclick="fnTopic()"/>
      		</div>
      	</c:if>
         
      </div> <!-- row 끝 -->


<!-- 명예의전당은 좋아요 갯수가 0이상이면 보이게... 좋아요 없으면 아무것도 안보임 -->
<c:if test="${smile > 0 }">
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
            	<c:forEach var="i" begin="1" end="${smile}" step="1" varStatus="f">
            		<c:choose>
	            		<c:when test="${f.first==true}">
	            			<li class="active" data-target="#transition-timer-carousel" data-slide-to="${i}" id="list"></li>
	            		</c:when>
	            		<c:otherwise>
	            			<c:if test="${f.first!=true}">
								<li data-target="#transition-timer-carousel" data-slide-to="${i}" id="list"></li>
	            			</c:if>
	            		</c:otherwise>
            		</c:choose>
	            </c:forEach>
            </ol>

			<!-- 카루셀 레이아웃 -->
			<div class="carousel-inner">
				<c:forEach var="i" end="${smile}" items="${happy}" varStatus="p">
					<c:choose>
						<c:when test="${p.first==true}">
							<div class="item active">
								<a href="#" onclick="reply_show('${i.upNo}')" data-toggle="modal" data-target=".contest${i.upNo}"> 
									<img class="image" src="/CloverSns/img/${i.img_route}" style="width: 500px; height: 400px;" />
								</a>
								<div class="carousel-caption">
									<h1 class="carousel-caption-header">${i.subject}</h1>
									<p class="carousel-caption-text hidden-sm hidden-xs">
										${i.name}
									</p>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${p.first!=true}">
								<div class="item">
									<a href="#" onclick="reply_show('${i.upNo}')" data-toggle="modal" data-target=".contest${i.upNo}"> 
									<img	class="image" src="/CloverSns/img/${i.img_route}" style="width: 500px; height: 400px;" />
									</a>
									<div class="carousel-caption">
										<h1 class="carousel-caption-header">${i.subject}</h1>
										<p class="carousel-caption-text hidden-sm hidden-xs">
											${i.name}
										</p>
									</div>
								</div>	
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
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
</c:if>
   
   <hr/>
	<!-- 사진 리스트입니다!(for문 쓰면 될거에요) -->
	<div class="container">
   
		<div class="row">
		<form method="post" action="contestproc.header?command=contestmodal">
	      <c:forEach end="${(beginPerPage + numPerPage)-1}" var="i" step="1" begin="${beginPerPage}" items="${v}">
	      	<input type="hidden" name="upNo" value="${i.upNo}" />
	      	<%-- <c:if test="${i == totalRecord}">
	      	</c:if> --%>
	        <div class="col portfolio-item" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 150;">
	            <a href="#" onclick="reply_show('${i.upNo}')" data-toggle="modal" data-target=".contest${i.upNo}" title="${i.subject}">
		           	<span style="text-align: center">${i.upNo}</span><br/>
	               <img class="img img-responsive img-thumbnail" src="/CloverSns/img/${i.img_route}" style="width: 150px; height: 150px;"/>
	               <div style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden; width: 150px;"><h3>${i.subject}</h3></div>
	            </a>
	            <p>작성자 : ${i.name}</p>
	         </div> <!-- div 끝 -->
	      </c:forEach>          
		</form>
      </div> <!-- row 끝 -->
      
      <hr/>
      
	<!-- 페이징 입니다.!! -->
	<form method="post" action="contestpaging.header">
		<input type="hidden" name="command" value="contestboard" />
		<div class="row text-center">
		
			<div class="paging">
				<ul class="pagination">
					<c:forEach end="${pagePerBlock}" begin="0" step="1" var="i">
						<c:if test="${i == 0}">
							<script>document.getElementById("list2").class="active";</script>
						</c:if>
						<c:if test="${(nowBlock*pagePerBlock) + i<totalPage}">
							<c:choose>
								<c:when test="${i == nowPage}">
									<li class="active"><a href="contestpaging.header?command=contestboard&nowBlock=${nowBlock}&nowPage=${(nowBlock*pagePerBlock) + i}" id="list2">${(nowBlock*pagePerBlock)+i+1}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="contestpaging.header?command=contestboard&nowBlock=${nowBlock}&nowPage=${(nowBlock*pagePerBlock) + i}" id="list2">${(nowBlock*pagePerBlock)+i+1}</a></li>		
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</ul>	
			</div>
		</div>
	</form>
	</div> <!-- container 끝 -->
   
	<jsp:include page="/clover/modal/ContestModal.jsp"></jsp:include>
	
<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>
	<jsp:include page="/clover/bar/header.jsp"></jsp:include>
</body>
</html>