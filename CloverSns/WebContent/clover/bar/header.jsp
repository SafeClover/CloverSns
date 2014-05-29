
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<link href="/CloverSns/style/css/bar/header.css" rel="stylesheet" />

<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<span id="main_icon" class="glyphicon glyphicon-align-justify">
			</a>
			<ul class="dropdown-menu">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span> 친구목록</a></li>
				<li class="dropdown-submenu">
					<a href="#">
						<span class="glyphicon glyphicon-bell"></span> 친구신청알림
						<span class="badge ">42</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">jQuery</a></li>
						<li><a href="#">jQueryUI</a></li>								
					</ul>	
				</li>
				<li class="dropdown-submenu">
					<a href="#">
						<span class="glyphicon glyphicon-comment"></span> 댓글,감상평알림
						<span class="badge ">42</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">jQuery</a></li>
						<li><a href="#">jQueryUI</a></li>								
					</ul>
				</li>
				<li>
					<a href="#"><span class="glyphicon glyphicon-cloud"></span> 채팅</a>
				</li>
			</ul>
		</div>
 		<div class="header-index">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">토끼풀</a>
            </div>
			
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#" alt="마이페이지"><img class="img-header" src="/CloverSns/style/img/headerIcon/mypage.png" class="img-responsive center-block">마이페이지</a>
                    </li>
                    <li><a href="#" alt="뉴스피드"><img class="img-header" src="/CloverSns/style/img/headerIcon/newsfeed.png" class="img-responsive center-block"> 뉴스피드</a>
                    </li>
                    <li><a href="#" alt="자랑하기"><img class="img-header" src="/CloverSns/style/img/headerIcon/contest.png" class="img-responsive center-block">자랑하기</a>
                    </li>
                    <li><a href="#" alt=" 업로드"><img class="img-header" src="/CloverSns/style/img/headerIcon/upload.png" class="img-responsive center-block"> 업로드</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
 		</div>
  
</nav>
</body>
</html>