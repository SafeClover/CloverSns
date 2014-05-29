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
<script src="/CloverSns/style/js/bootstrap.js"></script>

</head>
<body>

<!-- 

css에 position2가 겹쳐질 두장의 사진중 위쪽에 배치시키는것.
position1이 사진 밑에 배치시키는것.

사진을 배열할때는 사진 리스트 <div style="position: absolute; top:50px; left:20px"> 부분에서 top과 left값으로 조정.
for문에서 i=0부터 반복 돌릴때 top:(i*50)+50 px ; left:(i*20)+20; 식으로 돌리면 배열될듯??

사진 클릭했을 때 뜨는 모달창은 사진리스트 부분의 data-target에서 .pic숫자와
모달창 부분의 pic숫자에서 숫자를 통일시켜주는것으로 구분.

-->



<!-- 사진 리스트 (for문) -->

	<div style="position: absolute; top:50px; left:20px">
		<div class="position2">
			<a href="#" data-toggle="modal" data-target=".pic1">
				<img class="picture" src="/CloverSns/style/img/clover.png">
			</a>
		</div>
		<div class="position1">
			<img class="picture" src="/CloverSns/style/img/sample.jpg">
		</div>
	</div>

	<div style="position: absolute; top:50px; left:300px">
		<div class="position2">
			<a href="#" data-toggle="modal" data-target=".pic2">
				<img class="picture" src="/CloverSns/style/img/clover.png">
			</a>
		</div>
		<div class="position1">
			<img class="picture" src="/CloverSns/style/img/Chrysanthemum.jpg">
		</div>
	</div>




<!-- 모달창 (for문) -->

   <div class="container">
      <div class="row">
         <div class="modal fade pic1">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">
                     </button>
                     <h3 class="modal-title">모달 창 제목</h3>
                     <h5>작성일 : </h5>
                  </div> <!-- 모달 헤더끝 -->
                  <div class="modal-body">
                     <img src="/CloverSns/style/img/sample.jpg" class="img-responsive center-block">
                     <div class="modal-body">
                       	 작성자 : <br/> 내용 : <br/>
                     
                     </div>
                  </div> <!-- 모달 바디 끝 -->
                  <div class="modal-footer">
                  	<p>15초 카운트</p>
                    <button type="button" class="btn btn-primary close" data-dismiss="modal" >닫기</button>  
                  </div>
               </div> <!-- 모달 컨텐트 끝 -->
            </div> <!-- 모달 다이아로그 끝 -->
         </div> <!-- 모달 pop1 끝 -->
      </div> <!-- row 끝 -->
   </div> <!-- container 끝 -->




	<div class="container">
      <div class="row">
         <div class="modal fade pic2">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">
                     </button>
                     <h3 class="modal-title">모달 창 제목</h3>
                     <h5>작성일 : </h5>
                  </div> <!-- 모달 헤더끝 -->
                  <div class="modal-body">
                     <img src="/CloverSns/style/img/Chrysanthemum.jpg" class="img-responsive center-block">
                     <div class="modal-body">
                        작성자 : <br/>
                        내용 : <br/>
                     
                     </div>
                  </div> <!-- 모달 바디 끝 -->
                  <div class="modal-footer">
                  	<p>15초 카운트</p>
                    <button type="button" class="btn btn-primary close" data-dismiss="modal" >닫기</button>  
                  </div>
               </div> <!-- 모달 컨텐트 끝 -->
            </div> <!-- 모달 다이아로그 끝 -->
         </div> <!-- 모달 pop1 끝 -->
      </div> <!-- row 끝 -->
	</div> <!-- container 끝 -->



<!-- 
위에 사진들을 position:absolute로 잡아서 footer도 absolute로 잡아줘야함
footer의 top 속성값은 사진 갯수에 비례해서 증가하도록 해야할듯?
-->

	<div style="position: absolute; top:300px;">
		<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</body>
</html>