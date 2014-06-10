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

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<link href="/CloverSns/style/css/ourclover/ourclover.css" rel="stylesheet">
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>

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
	 
	function UpNo(upno){
		document.getElementById("upno").value = upno;
	}
	 
	function pic_ModalClose(){
		$(".modal").modal("hide");
	}
	
	function impression_Submit(){
		$(".modal").modal("hide");
		document.impression_form.submit();
	}

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
	ContentDao dao = new ContentDao();
	ContentDto dto = new ContentDto();
	
	Vector ourclover_vector = dao.getOurclover();

	for(int i=0; i<ourclover_vector.size(); i++){
		dto = (ContentDto)ourclover_vector.get(i);
%>

<!-- 사진 리스트 (for문) -->

	<div style="position: absolute; top: <%=(Math.floor((double)i/5)*300)+50%>px; left: <%=((i%5)*300)+100%>px;">
		<div class="position2">
			<a href="#" data-toggle="modal" data-target=".ourclover<%=dto.getUpNo()%>" onclick="UpNo('<%=dto.getUpNo()%>')">
				<img class="picture" src="/CloverSns/style/img/clover.png">
			</a>
		</div>
		<div class="position1">
			<img class="picture" src="/CloverSns/img/<%= dto.getImg_route() %>">
		</div>
	</div>

<%		
	}
%>


<!-- 
	footer
	위에 사진들을 position:absolute로 잡아서 footer도 absolute로 잡아줘야함
	footer의 top 속성값은 사진 갯수에 비례해서 증가하도록 해야할듯?
-->

	<div style="position: absolute; top:<%=Math.floor(((double)ourclover_vector.size()/5)*300)+100%>px;">
		<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
	
	
	
<!-- 모달 -->
<jsp:include page="/clover/modal/impressionModal.jsp"></jsp:include>
<jsp:include page="/clover/modal/picModal.jsp"></jsp:include>

</body>
</html>