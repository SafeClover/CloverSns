
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<link href="/CloverSns/style/css/bar/header.css" rel="stylesheet" />

<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script>
<% 
session.setAttribute("id", "admin");
String id = (String)session.getAttribute("id"); 

							Vector v = (Vector)request.getAttribute("getAlarm");
%>
	function fnGetalarm(){
		document.getalarm.submit();
	}
	
	function fnYesOrNO(id){
		var receive = confirm(id+"���� ģ�� ��û�� �����Ͻðڽ��ϱ�?");
		if(receive==true){
			document.getalarm.command.value = "acceptedfriend";
			alert(document.getalarm.command.value);
			
			document.getalarm.submit();
		}else{
			
		}
	}
</script>
</head>
<body>
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="dropdown clearfix">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<span id="main_icon" class="glyphicon glyphicon-align-justify"></span>
			</a>
			<ul class="dropdown-menu" onclick="fnGetalarm()">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span> ģ�����</a></li>
				
				<form style="color: #dddddd">
				<li class="dropdown-submenu">
					<a href="#">
						<span class="glyphicon glyphicon-comment"></span> ���,������˸�
						<span class="badge ">42</span>
					</a>
					 <ul class="dropdown-menu">
						<li><a href="#">jQuery</a></li>
						<li><a href="#">jQueryUI</a></li>
						<li><a href="#">jQueryUI</a></li>
						<li><a href="#">jQueryUI</a></li>
						<li><a href="#">jQueryUI</a></li>
						<li><a href="#">jQueryUI</a></li>	
					</ul>
				</li>
				</form>
				<form method="post" action="/CloverSns/friend.action" name="getalarm" >
					<li class="dropdown-submenu" >
						<a href="#">
							<span class="glyphicon glyphicon-bell"></span> ģ����û�˸�
							<span class="badge ">42</span>
						</a>
						<ul class="dropdown-menu">
						<%
							if(v != null){
								for(int i = 0;i<v.size();i++){
						%>
									<li onclick="fnYesOrNO('<%=v.get(i)%>')"><%=v.get(i)%></li>
									<input type="hidden" name="id_send" value="<%=v.get(i)%>" />
						<%
								}
							}else{
								%>
								<li>ģ�� ��û�� �����ϴ�.</li>
								<%
							}
						%>								
						</ul>	
					</li>
					<input type="hidden" name="command" value="getFriendAlarm" />
					<!-- <input type="hidden" name="id_get" value="scvasas" /> -->
				</form>
				<li>
					<a href="#"><span class="glyphicon glyphicon-cloud"></span> ä��</a>
				</li>
			</ul>
		</div>
		<div class="dropdown" style="margin-left: 85%;">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span style="font-weight: bold; color: white;">
               <img src="/CloverSns/style/img/login.png" style="width:30px; height: 30px;">
               <%= id %> �� �ȳ��ϼ���!
            </span>
         </a>
         <ul class="dropdown-menu">
            <li>
               <a href="#"><span class="glyphicon glyphicon-user"></span>ȸ����������</a>
            </li>
            <li>
               <a href="/CloverSns/clover/login_reg/Login.jsp"><span class="glyphicon glyphicon-cloud"></span>�α׾ƿ�</a>
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
                <a class="navbar-brand" href="#">�䳢Ǯ</a>
            </div>
			
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#" alt="����������"><img class="img-header" src="/CloverSns/style/img/headerIcon/mypage.png" class="img-responsive center-block">����������</a>
                    </li>
                    <li><a href="#" alt="�����ǵ�"><img class="img-header" src="/CloverSns/style/img/headerIcon/newsfeed.png" class="img-responsive center-block"> �����ǵ�</a>
                    </li>
                    <li><a href="#" alt="�ڶ��ϱ�"><img class="img-header" src="/CloverSns/style/img/headerIcon/contest.png" class="img-responsive center-block">�ڶ��ϱ�</a>
                    </li>
                    <li><a href="#" alt=" ���ε�"><img class="img-header" src="/CloverSns/style/img/headerIcon/upload.png" class="img-responsive center-block"> ���ε�</a>
                    </li>
                    
                </ul>
            </div>
            
            <!-- /.navbar-collapse -->
 		</div>
  
</nav>
</body>
</html>