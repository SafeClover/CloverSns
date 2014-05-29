<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
    
    <title>Contest</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet">
    
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script src="/CloverSns/style/js/carousel.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   $(document).ready(function() { // ������ �ε��� ������ ó���մϴ�.
        $(".iframe", parent.document).height($(document).height());  // �θ�â���ִ� ����������(Ŭ������ ifrm��) ���� ����
   });  
</script>

</head>
<body style="overflow: scroll;">
   

      <div class="row">
      
         <div class="title">
            <h1 class="page-header">���׽�Ʈ</h1>
            <h3>������ ������ �Դϴ�.</h3>
         </div> <!-- title �� -->
         
      </div> <!-- row �� -->

   
   <!-- ���� �Դϴ�. -->
   <div class="container">
      <div class="row">
         <h2>���� ����</h2>
      </div>
       
       <div class="row">
           <!-- carousel �κ��Դϴ�.(�ڵ� �� �ۿ�) -->
           <div id="transition-timer-carousel" class="carousel slide transition-timer-carousel" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
               <li data-target="#transition-timer-carousel" data-slide-to="0" class="active"></li>
               <li data-target="#transition-timer-carousel" data-slide-to="1"></li>
               <li data-target="#transition-timer-carousel" data-slide-to="2"></li>
               <li data-target="#transition-timer-carousel" data-slide-to="3"></li>
               <li data-target="#transition-timer-carousel" data-slide-to="4"></li>
            </ol>
   
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
               <div class="item active">
                  <a href="#" data-toggle="modal" data-target=".pop1">
                     <img class="image" src="/CloverSns/style/img/Koala.jpg" />
                  </a>
                       <div class="carousel-caption">
                           <h1 class="carousel-caption-header">Slide 1</h1>
                           <p class="carousel-caption-text hidden-sm hidden-xs">
                               �ھ˶�
                           </p>
                       </div>
                   </div>
                   
                   <div class="item">
                      <a href="#" data-toggle="modal" data-target=".pop1">
                          <img class="image" src="/CloverSns/style/img/Penguins.jpg" />
                      </a>
                       <div class="carousel-caption">
                           <h1 class="carousel-caption-header">Slide 2</h1>
                           <p class="carousel-caption-text hidden-sm hidden-xs">
                               ���
                           </p>
                       </div>
                   </div>
                   
                   <div class="item">
                      <a href="#" data-toggle="modal" data-target=".pop1">
                          <img class="image" src="/CloverSns/style/img/Chrysanthemum.jpg" />
                       </a>
                       <div class="carousel-caption">
                           <h1 class="carousel-caption-header">Slide 3</h1>
                           <p class="carousel-caption-text hidden-sm hidden-xs">
                               ??
                           </p>
                       </div>
                   </div>
                   
                   <div class="item">
                      <a href="#" data-toggle="modal" data-target=".pop1">
                          <img class="image" src="/CloverSns/style/img/Tulips.jpg" />
                       </a>
                       <div class="carousel-caption">
                           <h1 class="carousel-caption-header">Slide 4</h1>
                           <p class="carousel-caption-text hidden-sm hidden-xs">
                               ƫ��
                           </p>
                       </div>
                   </div>
                   
                   <div class="item">
                      <a href="#" data-toggle="modal" data-target=".pop1">
                          <img class="image" src="/CloverSns/style/img/Desert.jpg" />
                       </a>
                       <div class="carousel-caption">
                           <h1 class="carousel-caption-header">Slide 5</h1>
                           <p class="carousel-caption-text hidden-sm hidden-xs">
                               �縷
                           </p>
                       </div>
                   </div>
                   
               </div> <!-- carousel-inner �� -->
   
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
   
   <hr/>
   
   <!-- ���� ����Ʈ�Դϴ�!(for�� ���� �ɰſ���) -->
   <div class="container">
      <div class="row">
      
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
                  
      </div> <!-- row �� -->
      
      <hr/>
      
      <!-- ����¡ �Դϴ�.!! -->
      <div class="row text-center">

            <div class="paging">
                <ul class="pagination">
                    <li><a href="#">&laquo;</a>
                    </li>
                    <li class="active"><a href="#">1</a>
                    </li>
                    <li><a href="#">2</a>
                    </li>
                    <li><a href="#">3</a>
                    </li>
                    <li><a href="#">4</a>
                    </li>
                    <li><a href="#">5</a>
                    </li>
                    <li><a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>

        </div>
      
   </div> <!-- container �� -->
   
   <!-- ��� (Popover) â -->
   <div class="container">
      <div class="row">
         <div class="modal fade pop1">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
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
                     <button type="button" class="btn btn-primary close" data-dismiss="modal" >�ݱ�</button>  
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
   </div> <!-- container �� -->

<jsp:include page="/clover/bar/footer.jsp"></jsp:include>

</body>