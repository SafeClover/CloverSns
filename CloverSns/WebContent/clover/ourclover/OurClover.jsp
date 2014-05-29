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

css�� position2�� ������ ������ ������ ���ʿ� ��ġ��Ű�°�.
position1�� ���� �ؿ� ��ġ��Ű�°�.

������ �迭�Ҷ��� ���� ����Ʈ <div style="position: absolute; top:50px; left:20px"> �κп��� top�� left������ ����.
for������ i=0���� �ݺ� ������ top:(i*50)+50 px ; left:(i*20)+20; ������ ������ �迭�ɵ�??

���� Ŭ������ �� �ߴ� ���â�� ��������Ʈ �κ��� data-target���� .pic���ڿ�
���â �κ��� pic���ڿ��� ���ڸ� ���Ͻ����ִ°����� ����.

-->



<!-- ���� ����Ʈ (for��) -->

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




<!-- ���â (for��) -->

   <div class="container">
      <div class="row">
         <div class="modal fade pic1">
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
                  	<p>15�� ī��Ʈ</p>
                    <button type="button" class="btn btn-primary close" data-dismiss="modal" >�ݱ�</button>  
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
   </div> <!-- container �� -->




	<div class="container">
      <div class="row">
         <div class="modal fade pic2">
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
                        �ۼ��� : <br/>
                        ���� : <br/>
                     
                     </div>
                  </div> <!-- ��� �ٵ� �� -->
                  <div class="modal-footer">
                  	<p>15�� ī��Ʈ</p>
                    <button type="button" class="btn btn-primary close" data-dismiss="modal" >�ݱ�</button>  
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
	</div> <!-- container �� -->



<!-- 
���� �������� position:absolute�� ��Ƽ� footer�� absolute�� ��������
footer�� top �Ӽ����� ���� ������ ����ؼ� �����ϵ��� �ؾ��ҵ�?
-->

	<div style="position: absolute; top:300px;">
		<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</body>
</html>