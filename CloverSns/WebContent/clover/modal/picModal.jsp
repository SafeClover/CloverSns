<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ���� �˾� ���â (for��) -->
 <div class="container">
      <div class="row">
         <div class="modal fade 11">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">
                     </button>
                     <h3 class="modal-title">��� â ����</h3>
                     <h5>�ۼ��� : </h5>
                  </div> <!-- ��� ����� -->
                  <div class="modal-body">
                     <img src="/CloverSns/style/img/sample.jpg" class="img-responsive center-block">
                     <div class="modal-body">
                       	 �ۼ��� : <br/> ���� : <br/>
                     
                     </div>
                  </div> <!-- ��� �ٵ� �� -->
                  <div class="modal-footer">
                  	<p id="count" style="font-size: 20px; font-weight:bold ; color: red;"></p>	<!-- 15�� ī��Ʈ -->
                  	<input type="button" value="������" class="btn btn-primary" data-toggle="modal" data-target=".impression1" onclick="pic_ModalClose()" />
                    <button type="button" class="btn btn-primary close" data-dismiss="modal" id="close" onclick="test()" >�ݱ�</button>  
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
   </div> <!-- container �� -->
   
   
   <div class="container">
      <div class="row">
         <div class="modal fade 22">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">
                     </button>
                     <h3 class="modal-title">��� â ����</h3>
                     <h5>�ۼ��� : </h5>
                  </div> <!-- ��� ����� -->
                  <div class="modal-body">
                     <img src="/CloverSns/style/img/Chrysanthemum.jpg" class="img-responsive center-block">
                     <div class="modal-body">
                       	 �ۼ��� : <br/> ���� : <br/>
                     
                     </div>
                  </div> <!-- ��� �ٵ� �� -->
                  <div class="modal-footer">
                  	<p id="count" style="font-size: 20px; font-weight:bold ; color: red;"></p>	<!-- 15�� ī��Ʈ -->
                  	<input type="button" value="������" class="btn btn-primary" data-toggle="modal" data-target=".impression1" onclick="pic_ModalClose()" />
                    <button type="button" class="btn btn-primary close" data-dismiss="modal" id="close" >�ݱ�</button>  
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
   </div> <!-- container �� -->

</body>
</html>