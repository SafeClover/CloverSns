<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 사진 팝업 모달창 (for문) -->
 <div class="container">
      <div class="row">
         <div class="modal fade 11">
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
                  	<p id="count" style="font-size: 20px; font-weight:bold ; color: red;"></p>	<!-- 15초 카운트 -->
                  	<input type="button" value="감상평" class="btn btn-primary" data-toggle="modal" data-target=".impression1" onclick="pic_ModalClose()" />
                    <button type="button" class="btn btn-primary close" data-dismiss="modal" id="close" onclick="test()" >닫기</button>  
                  </div>
               </div> <!-- 모달 컨텐트 끝 -->
            </div> <!-- 모달 다이아로그 끝 -->
         </div> <!-- 모달 pop1 끝 -->
      </div> <!-- row 끝 -->
   </div> <!-- container 끝 -->
   
   
   <div class="container">
      <div class="row">
         <div class="modal fade 22">
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
                       	 작성자 : <br/> 내용 : <br/>
                     
                     </div>
                  </div> <!-- 모달 바디 끝 -->
                  <div class="modal-footer">
                  	<p id="count" style="font-size: 20px; font-weight:bold ; color: red;"></p>	<!-- 15초 카운트 -->
                  	<input type="button" value="감상평" class="btn btn-primary" data-toggle="modal" data-target=".impression1" onclick="pic_ModalClose()" />
                    <button type="button" class="btn btn-primary close" data-dismiss="modal" id="close" >닫기</button>  
                  </div>
               </div> <!-- 모달 컨텐트 끝 -->
            </div> <!-- 모달 다이아로그 끝 -->
         </div> <!-- 모달 pop1 끝 -->
      </div> <!-- row 끝 -->
   </div> <!-- container 끝 -->

</body>
</html>