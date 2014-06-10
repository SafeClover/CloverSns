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
 
	css�� position2�� ������ ������ ������ ���ʿ� ��ġ��Ű�°�.
	position1�� ���� �ؿ� ��ġ��Ű�°�.
	
	������ �迭�Ҷ��� ���� ����Ʈ <div style="position: absolute; top:50px; left:20px"> �κп��� top�� left������ ����.
	for������ i=0���� �ݺ� ������ top:(i*50)+50 px ; left:(i*20)+20; ������ ������ �迭�ɵ�??
	
	���� Ŭ������ �� �ߴ� ���â�� ��������Ʈ �κ��� data-target���� .pic���ڿ�
	���â �κ��� pic���ڿ��� ���ڸ� ���Ͻ����ִ°����� ����. (�۹�ȣ�� �ϸ� �ɵ�?)

-->

<%
	ContentDao dao = new ContentDao();
	ContentDto dto = new ContentDto();
	
	Vector ourclover_vector = dao.getOurclover();

	for(int i=0; i<ourclover_vector.size(); i++){
		dto = (ContentDto)ourclover_vector.get(i);
%>

<!-- ���� ����Ʈ (for��) -->

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
	���� �������� position:absolute�� ��Ƽ� footer�� absolute�� ��������
	footer�� top �Ӽ����� ���� ������ ����ؼ� �����ϵ��� �ؾ��ҵ�?
-->

	<div style="position: absolute; top:<%=Math.floor(((double)ourclover_vector.size()/5)*300)+100%>px;">
		<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
	
	
	
<!-- ��� -->
<jsp:include page="/clover/modal/impressionModal.jsp"></jsp:include>
<jsp:include page="/clover/modal/picModal.jsp"></jsp:include>

</body>
</html>