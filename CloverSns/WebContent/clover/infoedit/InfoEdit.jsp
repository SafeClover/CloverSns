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
	   
	  if(document.getElementById("pw").value == "" || document.getElementById("pw1").value == ""){
         alert("������ ��й�ȣ�� �Է����ּ���.");
         document.getElementById("pw").focus();
         return;
      }
      else if(document.getElementById("pw").value.length < 8){
         alert("��й�ȣ�� 8�� �̻� �Է����ּ���.");
         document.getElementById("pw").focus();
         return;
      }
      else if(document.getElementById("pw").value.length >= 8){
	      if(document.getElementById("pw").value != document.getElementById("pw1").value){
	         alert("�Է��� ��й�ȣ�� �ٸ��ϴ�.");
	         document.getElementById("pw").focus();
	         return;
	      }
      }

      if(document.getElementById("email").value == ""){
         alert("������ �̸����� �Է��ϼ���.");
         document.getElementById("email").focus();
         return;
      }
	   
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

<form name="info" action="/CloverSns/member.action?command=INFO_EDIT" method="post" enctype="multipart/form-data">
   
   <div style="width:1200px; height: 700px; margin:0 auto; display:table; text-align: center; background-color: #CEFBC9">
   
      <div style="width:1000px; height:600px; display:table-cell; vertical-align:middle; border:solid 1px blue">
      
         <div style="float: left; width:480px; height:600px; padding: 5%; background-color: #E0FFDB">
            <img src="/CloverSns/img/<%= dto1.getMem_img() %>" id="profileimage" style="width: 350px; height: 350px; border-radius: 200px;"/><br/><br/>
            <input type="file" name="imageInput" id="imageInput" /><br/><br/>
            <b>������ ����</b>
         </div>
         
         <div style="float:right; width:480px; height:600px; text-align:left; vertical-align:middle; display:table-cell; background: #E0FFDB">
            <div style="width:480px; height:400px; display:inline-block;" >
         
               ���̵� : <label><%=id%></label>
               <br/>
               
               ��й�ȣ :
               <input type="password" id="pw" name="pw" value="" />
               <br/>
               <br/>
               
               ��й�ȣ Ȯ�� :
               <input type="password" id="pw1" name="pw1" value="" />
               <br/>
               <br/>
            
               �̸� : 
               <label><%= dto1.getMem_name() %></label>
               <br/>
               <br/>
            
               <label for="birth">������� : </label>
                  <label>
	                  <%= dto1.getMem_birth() %>
                  </label>
               <br/>
               <br/>
            
               �̸��� : 
               <input type="text" id="email" name="email" value="<%= dto1.getMem_email() %>" />
               <br/>
               <br/>
            
               <label for="gender">���� : </label>
               <label><%= dto1.getMem_gender() %></label>
               <br/>
               <br/>
                  
               ���Գ�¥ : <label><%=dto.getMem_regDate()%></label>
               <br/>
               <br/>
               <input type="button" value="Ȯ��" onclick="InfoEdit()" />
               <input type="button" value="���" />
            </div>
            
         </div>
<!--          <form method="post" action="/CloverSns/clover/infoedit/InfoEdit_proc.jsp">
			<input type="submit" name="delete" value="Ż��" />
         </form> -->
      </div>

   </div>
</form>

<div style="text-align: center;">
	<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
</div>
   

</body>
</html>