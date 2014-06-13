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
   	Vector v = dao.getContest();
   	for(int i=0; i<v.size(); i++){
   		dto = (ContentDto)v.get(i);
   	%>
   	<div class="container">
    	<div class="row">
        	<div class="modal fade contest<%= dto.getUpNo() %> aaa">
            	<div class="modal-dialog">
               		<div class="modal-content">
                  		<div class="modal-header">
                     		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                     			X
                     		</button>
                     		<h3 class="modal-title">글번호 : <%= dto.getUpNo() %></h3>
                     		<h3 class="modal-title">제목 : <%= dto.getSubject() %></h3>
                     		<h5>작성일 : <%= dto.getRegdate() %></h5>
	                     
                     		<div id="vote" style="text-align: right">
                     		<%
                     		dto1.setUpNo(dto.getUpNo());
   							int count = dao1.showCount(dto1);
                     		%>
                     			<p id="count<%=dto.getUpNo()%>"><%= count %></p>
                     			<input type="button" value="like" id="like<%=dto.getUpNo() %>" name="like" onclick="like_cnt('<%= dto.getUpNo() %>')" />
                       		<div id="result"></div>
                     		</div>	
                  		</div> <!-- 모달 헤더끝 -->
                  		<div class="modal-body">
                     		<img src="/CloverSns/img/<%= dto.getImg_route() %>" class="img-responsive center-block">
                     		<div class="modal-body">
                        		작성자 : <%= dto.getId() %><br/>
                        		내용 : <%= dto.getContent() %><br/>
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
<% } %>
</body>
</html>