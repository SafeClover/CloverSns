<%@page import="login_reg.MemberDto"%>
<%@page import="login_reg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
      
   }   
   
</script>

<style>
   body{margin-top: 5%;}
</style>

</head>
<body>

<%
   String id = (String)session.getAttribute("id");

   MemberDao dao = new MemberDao();
   MemberDto dto = new MemberDto();
   
   dto = dao.MemberSelect(id);
%>

<form name="info" action="/CloverSns/member.action?command=INFO_EDIT" method="post" enctype="multipart/form-data">
   
   <div style="width:1200px; height: 700px; margin:0 auto; display:table; text-align: center; background-color: #CEFBC9">
   
      <div style="width:1000px; height:600px; display:table-cell; vertical-align:middle; border:solid 1px blue">
      
         <div style="float: left; width:480px; height:600px; padding: 5%; background-color: #E0FFDB">
            <img src="" id="profileimage" style="width: 350px; height: 350px"/><br/><br/>
            <input type="file" name="imageInput" id="imageInput" /><br/><br/>
            <b>������ ����</b>
         </div>
         
         <div style="float:right; width:480px; height:600px; text-align:left; vertical-align:middle; display:table-cell; background: #E0FFDB">
            <div style="width:480px; height:400px; display:inline-block;" >
         
               ���̵� : <label><%=id%></label>
               <br/>
               
               ��й�ȣ :
               <input type="password" name="pw" value="" />
               <br/>
               <br/>
               
               ��й�ȣ Ȯ�� :
               <input type="password" value="" />
               <br/>
               <br/>
            
               �̸� : 
               <input type="text" name="name" value="" />
               <br/>
               <br/>
            
               <label for="birth">�������</label>
                  <select name="year">
                     <%
                        for(int i=1930; i<2014; i++){
                     %>
                           <option><%=i%></option>
                     <%
                           if(i == 2013){
                     %>
                              <option selected="selected"><%=i + 1%></option>
                     <%
                           }
                        }
                     %>
                  </select>��
                  
                  <select name="month">
                     <%
                        for(int i=0; i<12; i++){
                     %>
                           <option><%=i + 1%></option>
                     <%
                        }
                     %>
                  </select>��
                  
                  <select name="day">
                     <%
                        for(int i=0; i<31; i++){
                     %>
                           <option><%=i + 1%></option>
                     <%
                        }
                     %>
                  </select>��
               <br/>
               <br/>
            
               �̸��� : 
               <input type="text" name="email" value="" />
               <br/>
               <br/>
            
               <label for="gender">����</label>
               <input type="radio" name="gender" id="gender" value="����" checked="checked" />����
               &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender" id="gender" value="����" />����
               <br/>
               <br/>
                  
               ���Գ�¥ : <label><%=dto.getMem_regDate()%></label>
               <br/>
               <br/>
               <input type="button" value="Ȯ��" onclick="InfoEdit()" />
               <input type="button" value="���" />
            </div>
            
         </div>
               
      </div>

   </div>
</form>

<br/><br/><br/><br/>
<br/><br/><br/><br/>
<br/><br/><br/><br/>
   

</body>
</html>