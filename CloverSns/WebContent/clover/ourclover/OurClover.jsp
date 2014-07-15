<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>OurClover</title>

<jsp:useBean id="cDao" class="content.ContentDao" />
<jsp:useBean id="cDto" class="content.ContentDto" />

<link href="/CloverSns/style/css/ourclover/ourclover.css" rel="stylesheet">
<script src="/CloverSns/style/js/ajax.js"></script>

<script>
	var sec = 6;
	 
	function UpNoInsert(upno, id){
		sec = -1;
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
 	
 // 초카운트
 	function fnTimer(upno){
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
<body style="height: 0px;">

<br/><br/><br/>

<!--
 
	css에 position2가 겹쳐질 두장의 사진중 위쪽에 배치시키는것.
	position1이 사진 밑에 배치시키는것.
	
	사진을 배열할때는 사진 리스트 <div style="position: absolute; top:50px; left:20px"> 부분에서 top과 left값으로 조정.
	for문에서 i=0부터 반복 돌릴때 top:(i*50)+50 px ; left:(i*20)+20; 식으로 돌리면 배열될듯??
	
	사진 클릭했을 때 뜨는 모달창은 사진리스트 부분의 data-target에서 .pic숫자와
	모달창 부분의 pic숫자에서 숫자를 통일시켜주는것으로 구분. (글번호로 하면 될듯?)

-->

<c:set var="x" value="${beginPerPage}" />

<c:set var="LoopStop1" value="true" />


<div class="container" style="width: 100%;">
	<div class="row" style="width: 100%;">
	
	<c:forEach begin="${beginPerPage}" end="${beginPerPage + numPerPage - 1}" var="i" step="1">
		<c:set  var="cDto" value="${notReadContent[i]}" />

		<c:set var="top" value="${x%20}"></c:set>
		
			<!-- jstl에서 반복문 break 로직 -->
			<c:if test="${LoopStop1}">
				<c:if test="${i == totalRecord }">
					<c:set var="LoopStop1" value="false" />
			</c:if>
			
			<c:if test="${LoopStop1}">
				
			
<!-- 사진 리스트 (for문) -->

	<div class="img_click" style="position: absolute; top: ${((((top/5))-((top/5)%1))*340)+150}px; left: ${((x%5)*224)+210}px;">
		<a href="#" data-toggle="modal" data-target=".ourclover${cDto.upNo}" onclick="PicDelete('${cDto.upNo}'); fnTimer('${cDto.upNo}')" title="${cDto.subject}">
			<div style="white-space:nowrap;text-overflow:ellipsis; overflow:hidden; width: 150px;"><h4><b style="margin-left: 20px">${cDto.upNo}&nbsp;&nbsp;&nbsp;${cDto.subject}</b></h4></div> 
			
			<img class="pictureCover" src="/CloverSns/style/img/clover.png">
		</a>
	</div>
	
	<img class="picture" src="/CloverSns/img/${cDto.img_route}" style="margin-top: 140px;">

				<c:set var="x" value="${x+1}"/>
				
			</c:if>
				
			</c:if>
	
	</c:forEach>

	
</div>

	<hr/>
	
	<!-- 페이징 입니다.!! -->
      <div class="row text-center" >

            <div class="paging">
                <ul class="pagination">
                
                	<c:choose>
						<c:when test="${nowBlock==0}">
	                   		<li class="disabled"><a>&laquo;</a></li>
						</c:when>
						<c:otherwise>
	                   		<li><a href="ourclover.header?command=ourclover&nowBlock=${nowBlock-1}&nowPage=${pagePerBlock*(nowBlock-1)}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="0" end="${pagePerBlock-1}" var="i" step="1">
						<c:choose>
							<c:when test="${i == 0}">
	                    		<script>document.getElementById("list2").class="active";</script>
							</c:when>
						</c:choose>
						
						<c:if test="${(nowBlock*pagePerBlock) + i<totalPage}">
							<c:choose>
								<c:when test="${i == nowPage}">
									<li class="active"><a href="/ourclover.header?command=ourclover&nowBlock=${nowBlock}&nowPage=${(nowBlock*pagePerBlock) + i}" id="list2">${(nowBlock*pagePerBlock) + i + 1}</a></li>
								</c:when>
								<c:otherwise>
	                    			<li><a href="ourclover.header?command=ourclover&nowBlock=${nowBlock}&nowPage=${(nowBlock*pagePerBlock) + i}" id="list2">${(nowBlock*pagePerBlock) + i + 1}</a></li>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
					
					<c:choose>
						<c:when test="${nowBlock+1<totalBlock}">
                    		<li><a href="ourclover.header?command=ourclover&nowBlock=${nowBlock+1}&nowPage=${pagePerBlock*(nowBlock+1)}">&raquo;</a></li>						
						</c:when>
						<c:otherwise>
							<li class="disabled"><a>&raquo;</a></li>
						</c:otherwise>
					</c:choose>
                </ul>	
            </div>
        </div>
</div>

<!-- 
	footer
	위에 사진들을 position:absolute로 잡아서 footer도 absolute로 잡아줘야함
	footer의 top 속성값은 사진 갯수에 비례해서 증가하도록 해야할듯?
-->

<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>
	<jsp:include page="/clover/bar/header.jsp"></jsp:include>
	
<!-- 모달 -->
<p id="impression"></p>
<jsp:include page="/clover/modal/impressionModal.jsp"></jsp:include>
<jsp:include page="/clover/modal/picModal.jsp"></jsp:include>

</body>
</html>