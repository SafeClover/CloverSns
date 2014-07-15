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

   //미리보기용
    $(document).ready(function(){
       function readURL(input){
           if(input.files && input.files[0]){
                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
                
                reader.onload = function(e){ //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
                  $('#profileimage').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정(아래 코드에서 읽어들인 dataURL형식) 
                };          
          
                reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
           } 
         }//readURL()
      
         //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
         $("#imageInput").change(function(){ 
           readURL(this);
         }); 
   });
   
   
   function InfoEdit(){
	  if(document.getElementById("imageInput").value==""){
		  alert("이미지를 추가하여 주세요!");
	  }
	  else{
		  var edit = confirm("회원정보를 수정하시겠습니까?");
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
							<c:when test="${mDto.mem_img == '경로'}">
								<img src="/CloverSns/style/img/noimage.jpg" id="profileimage" style="width:350px; height: 350px; border-radius: 200px;" />						
							</c:when>
							<c:otherwise>
								<img src="/CloverSns/img/${mDto.mem_img}" id="profileimage" style="width: 350px; height: 350px; border-radius: 200px;"/>
							</c:otherwise>
						</c:choose>
            
            <input type="file" name="imageInput" id="imageInput" style="margin-top: 20px;margin-left: 15%" size="30"/>
            <b>프로필 사진</b>
         </div>
			<input type="button" value="확인" onclick="InfoEdit()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<input type="button" value="취소" onclick="fnBack()"/>
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