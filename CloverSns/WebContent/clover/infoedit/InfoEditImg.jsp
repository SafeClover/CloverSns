<%@page import="java.util.Vector"%>
<%@page import="login_reg.MemberDto"%>
<%@page import="login_reg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="dto1" class="login_reg.MemberDto"></jsp:useBean>
<jsp:useBean id="dao1" class="login_reg.MemberDao"></jsp:useBean>
<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> <!-- 미리보기용 -->

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
	   	   
      var edit = confirm("회원정보를 수정하시겠습니까?");
      if(edit == true){
         document.info.submit();
      }
      else{
    	  return;
      }   
   }   
   
</script>

<style>
   body{margin-top: 5%;}
</style>

</head>
<body>

<%
   String id = (String)session.getAttribute("id");

	dto1.setMem_id(id);
	Vector v = dao1.getInfo(dto1);

   MemberDao dao = new MemberDao();
   MemberDto dto = new MemberDto();
   
   dto = dao.MemberSelect(id);
%>

<form name="info" action="/CloverSns/member.action?command=INFO_EDITIMG" method="post" enctype="multipart/form-data">
   
   <div style="width:700px; height: 700px; margin:0 auto; display:table; text-align: center; background-color: #CEFBC9">
 
      <div style="display:table-cell; vertical-align:middle; border:solid 1px blue">
      
         <div style="width:480px; height:600px; padding: 5%; background-color: white; margin-left: 17%">

					<div style="margin-right: 50px;">
						<%
							if(dto1.getMem_img().equals("경로")){
						%>
						<img src="/CloverSns/style/img/noimage.jpg" id="profileimage" style="width:350px; height: 350px; border-radius: 200px;" />
						<%}
						else{
						%>
						<img src="/CloverSns/img/<%= dto1.getMem_img() %>" id="profileimage" style="width: 350px; height: 350px; border-radius: 200px;"/><br/><br/>
						<%
						}
						%>
            
            <input type="file" name="imageInput" id="imageInput" style="margin-top: 25%"/>
            <b>프로필 사진</b>
         </div>
			<input type="button" value="확인" onclick="InfoEdit()" />
   			<input type="button" value="취소" />
      </div>
   </div>
</form>

<div style="text-align: center;">
	<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
</div>
   

</body>
</html>