<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" />
<link href="/CloverSns/style/css/bar/header.css" rel="stylesheet" />
<script src="/CloverSns/style/js/header_ajax.js"></script>
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>
<script>

var send_id = new Array;
var receive = null;


history.go(1); // �α��� ���������� �ڷΰ��� ���°�, ����� T^T


<% 
	String id = (String)session.getAttribute("id");
	Vector v = (Vector)request.getAttribute("getAlarm");
%>
	function fnGetalarm() {
		var url = "/CloverSns/friend.action";
		var params = "command=getFriendAlarm";
		sendRequest(url, params, callback, null);
		/* document.getalarm.submit(); */
	}


function callback() {
      if (httpRequest.readyState == 4) {
         if (httpRequest.status == 200) {
            var xmlDoc = httpRequest.responseText;
            /* var li =document.createElement("li");
               li.appendChild(xmlDoc);
               li.setAttributeNode("onclick="); */
            /* document.getElementById("alarm").innerHTML = xmlDoc; */
            
            var data = httpRequest.responseText;
            var cutTmp = data.split(',');


            for(var i=0; i<cutTmp.length; i++){
		  		$("#send").remove();
            }


            for(var i=0; i<cutTmp.length; i++) {
                $("#alarm").append("<li id='send'><a href='#'>" + cutTmp[i] + "</a></li>");
            	send_id[i] = cutTmp[i];
            }
           	$("#alarm li").each(
           			function(i){
           				$(this).attr("idx", i+1);
           			}
           		).click(
           			function(){
           				receive = confirm(send_id[$(this).attr("idx")-1] + "���� ģ�� ��û�� �����Ͻðڽ��ϱ�?");
           				if(receive==true){
           					/* document.getalarm.command.value = "acceptedfriend";
           					alert(document.getalarm.command.value); */
           					var url = "/CloverSns/friend.action";
           					var params = "command=acceptedfriend&send_id="+send_id[$(this).attr("idx")-1];
           					sendRequest(url, params, callback2, null);    
           					/* document.getalarm.submit(); */
           				}
           			}
           		);
         }else {
            alert(httpRequest.status);
         }
      }
   }
	function callback2(){
		   if (httpRequest.readyState == 4) {
		         if (httpRequest.status == 200) {
		        	 var message = httpRequest.responseText;
		        	 alert(message);
		         }else {
		             alert(httpRequest.status);
		         }
		   }
	}
   $(document).ready(
		function(){
			$("#upload").click(
				function(){
					$("#uploadModal").modal("show");
				}		
			);
		}	   
   );
</script>
</head>
<body>
<%
	if(id == null){
%>
		<script>
			alert("�������� ������ �ƴմϴ�. \n�α����� ���ּ���.");
			location.href="/CloverSns/clover/login_reg/Login.jsp";
		</script>	
<%
	}
	else{
%>
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="dropdown clearfix">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span id="main_icon" class="glyphicon glyphicon-align-justify" onclick="fnGetalarm()"></span>
         </a>
         <ul class="dropdown-menu" >
            <li><a href="/CloverSns/clover/friends/FriendsList.jsp" target="head"><span class="glyphicon glyphicon-user"></span> ģ�����</a></li>
            
            <form style="color: #dddddd">
            <li class="dropdown-submenu">
               <a href="#">
                  <span class="glyphicon glyphicon-comment"></span> ���,������˸�
                  <span class="badge ">42</span>
               </a>
                <ul class="dropdown-menu" >
                  <li><a href="#">jQuery</a></li>
                  <li><a href="#">jQueryUI</a></li>
                  <li><a href="#">jQueryUI</a></li>
                  <li><a href="#">jQueryUI</a></li>
                  <li><a href="#">jQueryUI</a></li>
                  <li><a href="#">jQueryUI</a></li>   
               </ul>
            </li>
            </form>
          <!--   <div name="getalarm" > -->
               <li class="dropdown-submenu" >
                  <a href="#">
                     <span class="glyphicon glyphicon-bell"></span> ģ����û�˸�
                     <span class="badge ">42</span>
                  </a>
                  <ul class="dropdown-menu" id="alarm">
                  		<li id="send"></li>
                  </ul>   
               </li>
              <!--  <input type="hidden" name="command" value="getFriendAlarm" /> -->
               <!-- <input type="hidden" name="id_get" value="scvasas" /> -->
            <!-- </div> -->
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
               <a href="Infoedit.index?index=Infoedit"><span class="glyphicon glyphicon-user"></span>ȸ����������</a>
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
                    <li><a href="Mypage.index?index=Mypage" alt=""><img class="img-header" src="/CloverSns/style/img/headerIcon/mypage.png" class="img-responsive center-block">����������</a></li>
                    <li><a href="Ourclover.index?index=Ourclover" alt="Ŭ�ι�"><img class="img-header" src="/CloverSns/style/img/headerIcon/newsfeed.png" class="img-responsive center-block">Ŭ�ι�</a></li>
                    <li><a href="Contest.index?index=Contest" alt="�ڶ��ϱ�"><img class="img-header" src="/CloverSns/style/img/headerIcon/contest.png" class="img-responsive center-block">�ڶ��ϱ�</a></li>
                    <li><a href="#" alt=" ���ε�" id="upload" data-toggle="modal" data-target="uploadModal"><img class="img-header" src="/CloverSns/style/img/headerIcon/upload.png" class="img-responsive center-block"> ���ε�</a></li>
                </ul>
            </div>
            
            <!-- /.navbar-collapse -->
       </div>
  
</nav>

<!-- ��� -->
<jsp:include page="/clover/modal/Modal.jsp"></jsp:include>
<% } %>
</body>
</html>