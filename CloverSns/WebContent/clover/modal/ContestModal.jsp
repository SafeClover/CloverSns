<%@page import="content.Contest_replyDto"%>
<%@page import="content.ContentDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="dto" class="content.ContentDto"></jsp:useBean>
<jsp:useBean id="dao" class="content.ContentDao"></jsp:useBean>
<jsp:useBean id="dto1" class="content.HappyDto"></jsp:useBean>
<jsp:useBean id="dao1" class="content.HappyDao"></jsp:useBean>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<script src="/CloverSns/style/js/ajax.js"></script>
<title>Insert title here</title>
<script>
   var upNo = null;
   
   function like_cnt(upNo){
      this.upNo = upNo;
      var params = "upNo="+upNo;
      var url = "/CloverSns/clover/contest/Contest_proc.jsp";
      sendRequest(url, params, callback, "POST");
   }
   
   function callback(){
       if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
               var xmlDoc = httpRequest.responseXML;    
               var count = xmlDoc.getElementsByTagName("count").item(0).textContent;
               
               var p = document.getElementById("count" + upNo);
               
         	   p.innerHTML = count;
            
                /*   
               $(this).prev().html(parseInt($(this).prev().html()) + 1);
                  document.getElementById("like").disabled="disabled";
               */
            }
      }
   }
   
   function Reply(upNo){
	      var reply = document.getElementById("reply"+upNo).value;
	      this.upNo = upNo;
	      var params = "upNo=" + upNo + "&reply=" + reply;
	      var url = "/CloverSns/clover/contest/Contest_reply.jsp";
	      sendRequest(url, params, callback2, "POST");
   }
	   
   function callback2(){
       if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
               var xmlDoc = httpRequest.responseXML;

               document.getElementById("reply"+upNo).value = "";
               
               
            }
      }
      
   }
   
   
   $(document).ready(
      function(){
         $("input").click(
            function(){
               document.getElementById("like" + upNo).disabled="disabled";
            }      
         );
      }
         
   );
   
</script>
</head>
<body>
   <!-- 자랑하기 모달 (Popover) 창 -->
      <%
      Contest_replyDto contest_replydto = new Contest_replyDto();
      Vector v = dao.getContest();
      for(int i=0; i<v.size(); i++){
         dto = (ContentDto)v.get(i);
      %>
      <div class="container">
       <div class="row">
           <div class="modal fade contest<%= dto.getUpNo() %> aaa" style="height: 800px;">
               <div class="modal-dialog" style="width: 1000px;">
                  <div class="modal-content" style="background-color: #baefac">
                  <div class="modal-body">
                     
                     <table>
                     	<tr>
                     		<td rowspan="4">
	                           <img src="/CloverSns/img/<%= dto.getImg_route() %>" class="img-responsive center-block" style="width: auto; height: 450px;">
                     		</td>
                     		
                     		<td style="padding: 10px; width: 100%">
                     			<label>제목 : <%= dto.getSubject() %></label><br/>
	                           	<label>작성일 : <%= dto.getRegdate() %></label><br/>
	                           	<label>작성자 : <%= dto.getId() %></label>
		                           <%
		                         	  dto1.setUpNo(dto.getUpNo());
		                       		  int count = dao1.showCount(dto1);
		                           %>
		                              <p id="count<%=dto.getUpNo()%>"><%= count %></p>
		                              <input type="button" value="like" id="like<%=dto.getUpNo() %>" name="like" onclick="like_cnt('<%= dto.getUpNo() %>')" />
                     		</td>
                     	</tr>
                     	
                     	<tr>
	                     	<td style="padding: 10px; width: 100%">
	                     		<div style="background-color: white; width:100%; height: 50px; overflow: auto;">
					                 <p>내용 : <%= dto.getContent() %></p>
	                     		</div>
	                     	</td>
                     	</tr>

                     	<tr>
	                     	<td style="padding: 10px; width: 100%">
	                     		<div style="background-color: white; width:100%; height: 250px; overflow: auto;">
	                     		
	                     			<!-- 댓글이 올라오는 자리 -->
	                     			<%
	                     			contest_replydto.setUpno(dto.getUpNo());
	                     			Vector contest_vector = dao.SelectContestReply(contest_replydto);
	                     			
	                     			for(int j=0; j<contest_vector.size(); j++){
	                     				contest_replydto = (Contest_replyDto)contest_vector.get(j);
	                     			%>
		                     			<img src="/CloverSns/style/img/BoardImg/client.jpg" style="width:60px; height: 60px; padding: 5px;"/>
		                     			<a href="#"><%=contest_replydto.getId() %></a>
		                     			<p style="font-size: 15px;"><%=contest_replydto.getRe() %></p>
		                     			<hr/>
	                     			<%}%>
	                     			 
	                     		</div>
	                     	</td>
                     	</tr>
                     	<tr>
                     		<td style="padding: 10px; width: 100%">
                     			<input type="text" id="reply<%=dto.getUpNo() %>" name="reply" style="width: 80%;"/>
                     			<input type="button" id="send_reply" name="send_reply" value="전송" onclick="Reply('<%=dto.getUpNo() %>')" />
                     		</td>
                     	</tr>
                     	
                     </table>
                        
                  </div>
                  
					<div class="modal-footer">
                        <button type="button" class="btn btn-primary close" data-dismiss="modal" >닫기</button>  
					</div>                        
                     </div> <!-- 모달 컨텐트 끝 -->
               </div> <!-- 모달 다이아로그 끝 -->
            </div> <!-- 모달 pop1 끝 -->
       </div> <!-- row 끝 -->
   </div> <!-- container 끝 -->
<% } %>
</body>
</html>