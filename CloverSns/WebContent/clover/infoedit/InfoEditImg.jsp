<%@page import="java.util.Vector"%>
<%@page import="login_reg.MemberDto"%>
<%@page import="login_reg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="dto1" class="login_reg.MemberDto"></jsp:useBean>
<jsp:useBean id="dao1" class="login_reg.MemberDao"></jsp:useBean>
<!-- <link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet"> -->
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>

<script>

   //�̸������
    $(document).ready(function(){
       function readURL(input){
           if(input.files && input.files[0]){
                var reader = new FileReader(); //������ �б� ���� FileReader��ü ���� 
                
                reader.onload = function(e){ //���� �о���̱⸦ ���������� ȣ��Ǵ� �̺�Ʈ �ڵ鷯 
                  $('#profileimage').attr('src', e.target.result); //�̹��� Tag�� SRC�Ӽ��� �о���� File������ ����(�Ʒ� �ڵ忡�� �о���� dataURL����) 
                };          
          
                reader.readAsDataURL(input.files[0]); //File������ �о� dataURL������ ���ڿ��� ���� 
           } 
         }//readURL()
      
         //file ������� �̹����� ����(���� ����) �Ǿ����� ó���ϴ� �ڵ� 
         $("#imageInput").change(function(){ 
           readURL(this);
         }); 
   });
   
   
   function InfoEdit(){
	  if(document.getElementById("imageInput").value==""){
		  alert("�̹����� �߰��Ͽ� �ּ���!");
	  }
	  else{
		  var edit = confirm("ȸ�������� �����Ͻðڽ��ϱ�?");
	      if(edit == true){
	         document.info.submit();
	      }
	      else{
	    	  return;
	      }
	  }
   }   
   
   function fnBack(){
	   history.back();
   }
   
</script>

</head>
<body>

<br/><br/><br/>

<form name="info" action="/CloverSns/InfoEditImg.index?index=INFO_EDITIMG" method="post" enctype="multipart/form-data">
 	 
      <div style="vertical-align:middle; margin-top: 50px; margin-left: 35%; text-align: center">
      
         <div style="width:480px; height:600px; background-color: white;">

					<div>
						<c:choose>
							<c:when test="${mDto.mem_img == '���'}">
								<img src="/CloverSns/style/img/noimage.jpg" id="profileimage" style="width:350px; height: 350px; border-radius: 200px;" />						
							</c:when>
							<c:otherwise>
								<img src="/CloverSns/img/${mDto.mem_img}" id="profileimage" style="width: 350px; height: 350px; border-radius: 200px;"/>
							</c:otherwise>
						</c:choose>
            
            <input type="file" name="imageInput" id="imageInput" style="margin-top: 20px;margin-left: 15%" size="30"/>
            <b>������ ����</b>
         </div>
			<input type="button" value="Ȯ��" onclick="InfoEdit()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<input type="button" value="���" onclick="fnBack()"/>
      </div>
   </div>
</form>

<hr/>

<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>
	<jsp:include page="/clover/bar/header.jsp"></jsp:include>

</body>
</html>