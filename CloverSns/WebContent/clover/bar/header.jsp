<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
var send_name = new Array;
var receive = null;
var cutTmp = null;

history.go(1); // �α��� ���������� �ڷΰ��� ���°�, ����� T^T

//header�� �»�ܹ�ư Ŭ���ϸ� ȣ���
function fnGetalarm() {
   var url = "/CloverSns/friend.action";
   var params = "command=getFriendAlarm";
   sendRequest(url, params, callback, "POST");
}

function callback() {
      if (httpRequest.readyState == 4) {
         if (httpRequest.status == 200) {
        	 
            var xmlDoc = httpRequest.responseXML;
            var friend_alarm = xmlDoc.getElementsByTagName("friend_alarm");
            
            // ģ����û�� ����� id�� name �޾ƿͼ� �迭�� ����
            for(var i=0; i<friend_alarm.length; i++){
            	send_id[i] = xmlDoc.getElementsByTagName("send_id").item(i).textContent;
            	send_name[i] = xmlDoc.getElementsByTagName("send_name").item(i).textContent;
            }
            
            //bradge ���� ����
            if(friend_alarm.length > 0){               
               $(".friends").text(friend_alarm.length);
            }
            else{
               $(".friends").text(0);
            }

            for(var i=0; i<friend_alarm.length; i++){
              $("#send").remove();
            }
            
            if(friend_alarm.length == 0){
            	$("#friendalarm").append("<li id='send'>ģ�� ��û�� ����</a></li>");
         }else{
               for(var i=0; i<friend_alarm.length; i++) {
                   $("#friendalarm").append("<li id='send'><a href='#'>" + send_name[i] + "</a></li>");
               }
                 $("#friendalarm li").each(
                       function(i){
                          $(this).attr("idx", i+1);
                       }
                    ).click(
                       function(){
                          receive = confirm(send_name[$(this).attr("idx")-1] + "���� ģ�� ��û�� �����Ͻðڽ��ϱ�?");
                          if(receive==true){
                             var url = "/CloverSns/friend.action";
                             var params = "command=acceptedfriend&send_id="+send_id[$(this).attr("idx")-1]+"&send_name="+escape(encodeURIComponent(send_name[$(this).attr("idx")-1]));
                             sendRequest(url, params, callback2, "POST");
                          }
                       }
                    );
         }
            //������ �˶� ������
            sendRequest("/CloverSns/friend.action", "command=getReplyalarm", callback3, "POST");
         }else {
            alert(httpRequest.status);
         }
      }
   }
   function callback2(){
         if (httpRequest.readyState == 4) {
               if (httpRequest.status == 200) {
                  var name = httpRequest.responseText;
                  alert(name + "�԰� ģ���� �Ǿ����ϴ�.");
               }else {
                   alert(httpRequest.status);
               }
         }
   }
   
   function callback3(){
      if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
               var data = httpRequest.responseText;
               
                var cutTmp = data.split('|');
                //badge ���� ����
                if(cutTmp[0] != ""){               
                    $(".replys").text(cutTmp.length);
                 }
                 else{
                    $(".replys").text(0);
                 }
                
                for(var i=0; i<cutTmp.length+1; i++){
                  $("#alarm").remove();
                }
             if(cutTmp[0]==""){
                $("#replyalarm").append("<li id='alarm'>�˶� ����</a></li>");
             }else{
                var upNos = new Array();
                var ids = new Array();
                   for(var i=0; i<cutTmp.length; i++){
                      var reply = cutTmp[i].split('`');
                      upNos[i]=reply[2];
                      ids[i] = reply[3];
                       $("#replyalarm").append("<li id='alarm'><a href='#' data-toggle='modal' data-target='.contest" + upNos[i] + "'>" +reply[0]+"�Բ��� '"+reply[1]+"'�� �������� ����̽��ϴ�." + "</a></li>");
                   }
                  $("#replyalarm li").each(
                          function(i){
                             $(this).attr("idx", i+1);
                          }
                       ).click(
                          function(){
                        	  privacy_show(upNos[$(this).attr("idx")-1], ids[$(this).attr("idx")-1]);
                             }
                       );
             }
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
<style>
   #font_over:hover{
      color: white;
   }
</style>
</head>
<body>
	<%-- <c:set var="sessionId" value="${sessionId}"></c:set> --%>
<%-- <%
   if(id == null){
%> --%>
	<c:if test="${sessionScope.id == null}">
      <script>
         alert("�������� ������ �ƴմϴ�. \n�α����� ���ּ���.");
         location.href="/CloverSns/clover/login_reg/Login.jsp";
      </script>   
	</c:if>
<%-- <%
   }
   else{
%> --%>
	<c:if test="${sessionScope.id != null}">
		<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation" style="background-image: url('/CloverSns/style/img/header.jpg') ">
		        <div class="dropdown clearfix">
		         <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		            <span id="main_icon" class="glyphicon glyphicon-align-justify" onclick="fnGetalarm()"></span>
		         </a>
		         <ul class="dropdown-menu" >
		            <li><a href="/CloverSns/friendlist.header?command=friendslist" ><span class="glyphicon glyphicon-user"></span> ģ�����</a></li>
		            
		         
		            <li class="dropdown-submenu">
		               <a href="#" onclick="">
		                  <span class="glyphicon glyphicon-comment"></span> ���,������˸�
		                  <span class="badge replys"></span>
		               </a>
		                <ul class="dropdown-menu" id="replyalarm">
		               </ul>
		            </li>
		       
		          <!--   <div name="getalarm" > -->
		               <li class="dropdown-submenu" >
		                  <a href="#">
		                     <span class="glyphicon glyphicon-bell"></span> ģ����û�˸�
		                     <span class="badge friends"></span>
		                  </a>
		                  <ul class="dropdown-menu" id="friendalarm">
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
		               <%-- <%= id %> --%>
		               	${sessionScope.id} �� �ȳ��ϼ���!
		            </span>
		         </a>
		         <ul class="dropdown-menu">
		            <li>
		               <a href="InfoEditImg.index?index=profileEdit"><span class="glyphicon glyphicon-user"></span>ȸ����������</a>
		            </li>
		            <li>
		               <a href="logout.index?index=logout"><span class="glyphicon glyphicon-cloud"></span>�α׾ƿ�</a>
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
		               	<img src="/CloverSns/style/img/Logo2.png" style="margin-top:10px ; width: 150px; height: 60px; margin-right: 200px;" />
		            </div>
		         
		            <!-- Collect the nav links, forms, and other content for toggling -->
		            <div class="collapse navbar-collapse navbar-ex1-collapse">
		                <ul class="nav navbar-nav">
		                    <li><a href="/CloverSns/mypage.header?command=mypage"><img class="img-header" src="/CloverSns/style/img/headerIcon/mypage.png" class="img-responsive center-block"><font style="color: black;"><span id="font_over">����������</span></font></a></li>
		                    <li><a href="/CloverSns/ourclover.header?command=ourclover"><img class="img-header" src="/CloverSns/style/img/headerIcon/newsfeed.png" class="img-responsive center-block"><font style="color: black;"><span id="font_over">Ŭ�ι�</span></font></a></li>
		                    <li><a href="/CloverSns/contestboard.header?command=contestboard"><img class="img-header" src="/CloverSns/style/img/headerIcon/contest.png" class="img-responsive center-block"><font style="color: black;"><span id="font_over">�ڶ��ϱ�</span></font></a></li>
		                    <li><a href="#" alt=" ���ε�" id="upload" data-toggle="modal" data-target="uploadModal"><img class="img-header" src="/CloverSns/style/img/headerIcon/upload.png" class="img-responsive center-block"><font style="color: black;"><span id="font_over">���ε�</span></font></a></li>
		                </ul>
		            </div>
		            
		            <!-- /.navbar-collapse -->
		       </div>
		  
		</nav>
		
		<!-- ��� -->
		<jsp:include page="/clover/modal/Modal.jsp"></jsp:include>
	</c:if>
<%-- <% } %> --%>
</body>
</html>