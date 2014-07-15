<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
function privacy_show(upNo, send_id){
	this.upNo = upNo;
	var params = "command=show&upNo=" + upNo + "&send_id="+send_id;
	var url = "/CloverSns/mypage.mypage_ajax";
	sendRequest(url, params, privacy_show_callback, null);
}

function privacy_show_callback(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			var xmlDoc = httpRequest.responseXML;
			
			// �������� Ȯ��
			var privacy = xmlDoc.getElementsByTagName("command").item(0).textContent;
			
			if(privacy == 1){
				document.getElementById("privacy"+upNo).selected = "selected";
			}
			else if(privacy == 2){
				document.getElementById("friends"+upNo).selected = "selected";
			}
			else if(privacy == 3){
				document.getElementById("contest"+upNo).selected = "selected";
			}
			else{
				alert("����");
			}
			
			// mypage ����
			
			var mypage_reply = xmlDoc.getElementsByTagName("mypage_reply");				
			
			var reply_input = document.getElementById("reply_input" + upNo);
			
			while(reply_input.hasChildNodes()){
				reply_input.removeChild(reply_input.childNodes.item(0));
			}
			
			for(var i=0; i<mypage_reply.length; i++){
				var name = xmlDoc.getElementsByTagName("name").item(i).textContent;
				var re = xmlDoc.getElementsByTagName("re").item(i).textContent;
				var regdate = xmlDoc.getElementsByTagName("regdate").item(i).textContent;
				
				var reply_name = document.createElement("a");
				var reply_re = document.createElement("span");
				var reply_regdate = document.createElement("span");
				
				reply_name.setAttribute("href", "#");
				reply_name.setAttribute("id", "reply_name");
				reply_re.setAttribute("id", "reply_re");
				reply_regdate.setAttribute("id", "reply_regdate");
				
				reply_re.innerHTML = re + "  ";
				reply_name.innerHTML = name;
				reply_regdate.innerHTML = "[" +  regdate + "]<hr/>";
				
				reply_input.appendChild(reply_re);
				reply_input.appendChild(reply_name);
				reply_input.appendChild(reply_regdate);
			}
			
		}
		else{
			alert(httpRequest.status);
		}
	}
}


function privacy_change(selectInfo, upNo){
	this.upNo = upNo;
	var params = "command=change&send_id=null&privacy=" + selectInfo.options[selectInfo.selectedIndex].value + "&upNo=" + upNo;
	var url = "/CloverSns/mypage.mypage_ajax";
	sendRequest(url, params, privacy_callback, null);
}

function privacy_callback(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			
			var xmlDoc = httpRequest.responseXML;
			var privacy = xmlDoc.getElementsByTagName("command").item(0).textContent;
			
			var privacy_input = document.getElementById("privacy_input" + upNo);
			
			if(privacy == 1){
				privacy_input.innerHTML = "���������� ������� �����Ǿ����ϴ�.";
			}
			else if(privacy == 2){
				privacy_input.innerHTML = "���������� ģ�������� �����Ǿ����ϴ�.";
			}
			else if(privacy == 3){
				privacy_input.innerHTML = "���������� ��ü������ �����Ǿ����ϴ�.";
			}
			else{
				alert("����");
			}
			
		}
		else{
			alert(httpRequest.status);
		}
	}
}
</script>
<body>

	<!-- ��� (Popover) â -->
	
	<form method="post" action="/CloverSns/delete.mypage?command=delete" id="deleteContent" name="deleteContent">
		<input type="hidden" name="upNo" id="upNo"/>
		
		<c:forEach items="${cv}" var="cv">
	      <div class="container" style="width: 70%;">
	      <div class="row">
	         <div class="modal fade contest${cv.upNo}">
	            <div class="modal-dialog">
	               <div class="modal-content">
	                  <div class="modal-header">
	                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	                        X
	                     </button>
	                     <h3 class="modal-title"><span id="b_hover" class="b_hover">${cv.subject}</span></h3>
	                     <h5>�ۼ��� : <span id="b_hover" class="b_hover">${cv.regdate}</span></h5>
	                  </div> <!-- ��� ����� -->
	                  <div class="modal-body">
	                     <img style="width: auto; height: 350px; max-width: 1000px;" src="/CloverSns/img/${cv.img_route}" class="img-responsive center-block">
	                     
	                     <div class="modal-body">
	                     
					�������� ���� : 
					<select onchange="privacy_change(this,'${cv.upNo}')">
						<option id="privacy${cv.upNo}" value="privacy">�����</option>
						<option id="friends${cv.upNo}" value="friends">ģ������</option>
						<option id="contest${cv.upNo}" value="contest">��ü����</option>
					</select>
					
					<p style="color: red;" id="privacy_input${cv.upNo}"></p>
					
	                        �ۼ��� : <b id="b_hover" class="b_hover">${cv.name}</b><br/>
	                        ���� : <span id="b_hover" class="b_hover">${cv.content}<br/></span>
	                     </div>
	                     
	                  </div> <!-- ��� �ٵ� �� -->
	                  
	                  <div>
	                	<h4 style="color: green; margin-left: 30px; font-weight: bold;">������</h4>
	                	
	                	<div style="background:lightgray; height:100px; overflow: auto;">
	                	
	                  	 	<div id="reply_input${cv.upNo}" class="b_hover" style="margin-left: 10px; margin-top: 20px;">
	                  	 	</div>
	                  	 	
	                	</div>

		          	  	<div align="right" style="margin-right: 15px">
		              	 <a href="javascript:del('${cv.upNo}')">����</a>
		          	  	</div>
	                  </div>
	                  <div class="modal-footer">
	                     <button type="button" class="btn btn-primary close" data-dismiss="modal" >�ݱ�</button>  
	                  </div>
	               </div> <!-- ��� ����Ʈ �� -->
	            </div> <!-- ��� ���̾Ʒα� �� -->
	         </div> <!-- ��� pop1 �� -->
	      </div> <!-- row �� -->
	   </div> <!-- container �� -->
	</c:forEach>
	
</form>

</body>
</html>