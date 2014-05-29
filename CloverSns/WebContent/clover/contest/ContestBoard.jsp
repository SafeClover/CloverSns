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
   $(document).ready(function() { // 페이지 로딩이 끝나면 처리합니다.
        $(".iframe", parent.document).height($(document).height());  // 부모창에있는 아이프레임(클래스가 ifrm인) 높이 조절
   });  
</script>

</head>
<body style="overflow: scroll;">
   

      <div class="row">
      
         <div class="title">
            <h1 class="page-header">콘테스트</h1>
            <h3>주제는 ㅁㅁㅁ 입니다.</h3>
         </div> <!-- title 끝 -->
         
      </div> <!-- row 끝 -->

   
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
                               코알라
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
                               펭귄
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
                               튤립
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
                               사막
                           </p>
                       </div>
                   </div>
                   
               </div> <!-- carousel-inner 끝 -->
   
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
   
   <!-- 사진 리스트입니다!(for문 쓰면 될거에요) -->
   <div class="container">
      <div class="row">
      
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               <h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
                  
      </div> <!-- row 끝 -->
      
      <hr/>
      
      <!-- 페이징 입니다.!! -->
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
      
   </div> <!-- container 끝 -->
   
   <!-- 모달 (Popover) 창 -->
   <div class="container">
      <div class="row">
         <div class="modal fade pop1">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
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
                     <button type="button" class="btn btn-primary close" data-dismiss="modal" >닫기</button>  
                  </div>
               </div> <!-- 모달 컨텐트 끝 -->
            </div> <!-- 모달 다이아로그 끝 -->
         </div> <!-- 모달 pop1 끝 -->
      </div> <!-- row 끝 -->
   </div> <!-- container 끝 -->

<jsp:include page="/clover/bar/footer.jsp"></jsp:include>

</body>