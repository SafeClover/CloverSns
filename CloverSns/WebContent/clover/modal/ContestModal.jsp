<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="dto" class="content.ContentDto"></jsp:useBean>
<jsp:useBean id="dao" class="content.ContentDao"></jsp:useBean>
<jsp:useBean id="dto1" class="content.HappyDto"></jsp:useBean>
<jsp:useBean id="dao1" class="content.HappyDao"></jsp:useBean>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<script src="/CloverSns/style/js/ajax.js"></script>

<script>
   var upNo = null;
   
   function Reload(){
		history.go(0);
	}
   
   function like_cnt(upNo){
      this.upNo = upNo;
      var params = "upNo="+upNo+"&click=true";
      var url = "/CloverSns/contest.contest_ajax";
      sendRequest(url, params, callback_like, "POST");
   }
   
   function callback_like(){
       if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
               	var xmlDoc = httpRequest.responseXML;
               	var count = xmlDoc.getElementsByTagName("count").item(0).textContent;
              	var p = document.getElementById("count" + upNo);
               
         	   	p.innerHTML = count;
         	   
   				document.getElementById("like" + upNo).disabled="disabled";
         	   
            }
      }
   }
   
   
   function Reply(upNo){
	      var reply_text = escape(encodeURIComponent(document.getElementById("reply_text"+upNo).value));
	      this.upNo = upNo;
	      var params = "upNo=" + upNo + "&reply=" + reply_text;
	      var url = "/CloverSns/contest.contest_ajax";
	      sendRequest(url, params, callback_reply, "POST");
	}
		   
	function callback_reply(){
		if (httpRequest.readyState == 4) {
	         if (httpRequest.status == 200) {
				var xmlDoc = httpRequest.responseXML;
				var reply = document.getElementById("reply"+upNo);
				var list = xmlDoc.getElementsByTagName("reply");
				
				while(reply.hasChildNodes()){
					reply.removeChild(reply.childNodes.item(0));
				}

				for(var i=0; i<list.length; i++){
					var name = xmlDoc.getElementsByTagName("name").item(i).textContent;
					var re = xmlDoc.getElementsByTagName("re").item(i).textContent;
					
					var reply_name = document.createElement("a");
					var reply_re = document.createElement("span");
					
					reply_name.setAttribute("href", "#");
					reply_name.setAttribute("id", "reply_name");
					reply_re.setAttribute("id", "reply_re");
					
					reply_name.innerHTML = name + "<br/>";
					reply_re.innerHTML = re + "<br/><hr/>";
					
					reply.appendChild(reply_name);
					reply.appendChild(reply_re);
				}
				
				document.getElementById("reply_text"+upNo).value = "";
	         }
	         
		}
	}
   
</script>
</head>
<body>
   <!-- 자랑하기 모달 (Popover) 창 -->
   
   <c:forEach var="cDto" items="${v}">
      <div class="container">
       <div class="row">
           <div class="modal fade contest${cDto.upNo} aaa" style="height: 800px;">
               <div class="modal-dialog" style="width: 1000px;">
                  <div class="modal-content" style="background-color: #baefac">
                  <div class="modal-body">
                     
                     <table style="width: 950px;">
                     	<tr>
                     		<td rowspan="4" style="width: 65%">
	                           <img src="/CloverSns/img/${cDto.img_route}" class="img-responsive center-block" style="width: 600px; height: auto; max-height: 600px;">
                     		</td>
                     		
                     		<td style="padding: 10px; width: 35%">
                     			<label>제목 : ${cDto.subject}</label><br/>
	                           	<label>작성일 : ${cDto.regdate}</label><br/>
	                           	<label>작성자 : ${cDto.id}</label>
		                              <p id="count${cDto.upNo}"></p>
		                              <input type="button" value="like" id="like${cDto.upNo}" name="like" onclick="like_cnt('${cDto.upNo}')" />
                     		</td>
                     	</tr>
                     	
                     	<tr>
	                     	<td style="padding: 10px; width: 35%">
	                     		<div style="background-color: white; width:100%; height: 50px; overflow: auto;">
					                 <p>내용 : ${cDto.content}</p>
	                     		</div>
	                     	</td>
                     	</tr>

                     	<tr>
	                     	<td style="padding: 10px; width: 35%">
	                     		<div style="background-color: white; width:100%; height: 250px; overflow: auto;">
	                     		
	                     			<!-- 댓글이 올라오는 자리 -->
	                     			
	                     			<div id="reply${cDto.upNo}"></div>
	                     				                     			 
	                     		</div>
	                     	</td>
                     	</tr>
                     	<tr>
                     		<td style="padding: 10px; width: 35%">
                     			<input type="text" id="reply_text${cDto.upNo}" name="reply" style="width: 80%;"/>
                     			<input type="button" id="send_reply" name="send_reply" value="전송" onclick="Reply('${cDto.upNo}')" />
                     		</td>
                     	</tr>
                     	
                     </table>
                        
                  </div>
                  
					<div class="modal-footer">
                        <button type="button" class="btn btn-primary close" data-dismiss="modal" onclick="Reload()" >닫기</button>  
					</div>                        
                     </div> <!-- 모달 컨텐트 끝 -->
               </div> <!-- 모달 다이아로그 끝 -->
            </div> <!-- 모달 pop1 끝 -->
       </div> <!-- row 끝 -->
   </div> <!-- container 끝 -->
   </c:forEach>
</body>
</html>