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
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> <!-- �̸������ -->

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
	   	   
      var edit = confirm("ȸ�������� �����Ͻðڽ��ϱ�?");
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
							if(dto1.getMem_img().equals("���")){
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
            <b>������ ����</b>
         </div>
			<input type="button" value="Ȯ��" onclick="InfoEdit()" />
   			<input type="button" value="���" />
      </div>
   </div>
</form>

<div style="text-align: center;">
	<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
</div>
   

</body>
</html>