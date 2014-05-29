<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" />
<link href="/CloverSns/style/css/friends/bootstrap.min.css" rel="stylesheet" />
<link href="/CloverSns/style/css/friends/feature-carousel.css" rel="stylesheet" />
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/jquery.waterwheelCarousel.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>

<script type="text/javascript">
      $(document).ready(function () {
        var carousel = $("#carousel").waterwheelCarousel({
          flankingItems: 3,
          movingToCenter: function ($item) {
            $('#callback-output').prepend('movingToCenter: ' + $item.attr('id') + '<br/>');
          },
          movedToCenter: function ($item) {
            $('#callback-output').prepend('movedToCenter: ' + $item.attr('id') + '<br/>');
          },
          movingFromCenter: function ($item) {
            $('#callback-output').prepend('movingFromCenter: ' + $item.attr('id') + '<br/>');
          },
          movedFromCenter: function ($item) {
            $('#callback-output').prepend('movedFromCenter: ' + $item.attr('id') + '<br/>');
          },
          clickedCenter: function ($item) {
            $('#callback-output').prepend('clickedCenter: ' + $item.attr('id') + '<br/>');
          }
        });

        $('#prev').bind('click', function () {
          carousel.prev();
          return false
        });

        $('#next').bind('click', function () {
          carousel.next();
          return false;
        });

        $('#reload').bind('click', function () {
          newOptions = eval("(" + $('#newoptions').val() + ")");
          carousel.reload(newOptions);
          return false;
        });
      });   
    </script>
    
</head>
<body>
	<div class="container1" style="margin-top: 50px;">
		<div class="row">
			<h1 style="text-align: center">돌아가는 내친구</h1>
				<div id="carousel" style="background-color: black;">
					<a href="#"><img src="/CloverSns/style/img/cap.jpg" id="item-1" /></a> 
					<a href="#"><img src="/CloverSns/style/img/eily.jpg" id="item-2" /></a> 
					<a href="#"><img src="/CloverSns/style/img/hero.jpg" id="item-3" /></a> 
					<a href="#"><img src="/CloverSns/style/img/iphone.jpg" id="item-4" /></a> 
					<a href="#"><img src="/CloverSns/style/img/min.jpg" id="item-5" /></a>
					<a href="#"><img src="/CloverSns/style/img/super.jpg" id="item-6" /></a> 
					<a href="#"><img src="/CloverSns/style/img/7.jpg" id="item-7" /></a> 
					<a href="#"><img src="/CloverSns/style/img/8.jpg" id="item-8" /></a> 
					<a href="#"><img src="/CloverSns/style/img/9.jpg" id="item-9" /></a>
				</div>
					<a href="#" id="prev">후진</a> | <a href="#" id="next">전진</a>
				<br/>
		</div>
	</div>
		
	<div class="container1" id="center">
		<div class="row">
			<div class="navbar1 navbar1-inverse">
				<form class="navbar1-search pull-right">
					<input type="text" class="search-query" placeholder="친구검색">
				</form>
			</div>
		</div>
	</div>
	<br/>
	
<!-- 이부분 for문 이용 하여 친구목록 불러온다 -->
	<div class="container1">
		<div class="row">
			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>

			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>
				
			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>
	
			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>
				
			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>
				
			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>
		
			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>
				
			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>
				
			<div class="span2">
				<a href="#" class="thumbnail">
					<img src="/CloverSns/style/img/hero.jpg"> 
						<i>이름</i><br/>
						<i>생년월일</i>
				</a>
			</div>
		</div>
		
	</div>
	
	
	<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	
</body>

</html>

