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
   
   function mem_out(){
	   window.open("MemberDelete.jsp", "ȸ�� Ż��", "width=300, height=200");
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

<form name="info" action="/CloverSns/member.action" method="post">
<input type="hidden" name="command" value="INFO_EDIT" />
      
   <div style="width:1200px; height: 700px; margin:0 auto; display:table; text-align: center; background-color: #CEFBC9">
   
      <div style="width:1000px; height:600px; display:table-cell; vertical-align:middle; padding-left:400px" >
      
         <!-- <div style="float: left; width:480px; height:600px; padding: 5%; background-color: #E0FFDB">
            <img src="" id="profileimage" style="width: 350px; height: 350px"/><br/><br/>
            <input type="file" name="imageInput" id="imageInput" /><br/><br/>
            <b>������ ����</b>
         </div> -->
         
         <div style="width:480px; height:600px; text-align:left;display:table-cell; background: #E0FFDB; text-align: center;">
            <div style="width:480px; height:400px; display:inline-block;" >
               <h3> ȸ�� ���� ����</h3><br/><br/><br/>
         
         		�̸� : <lable><%=dto.getMem_name() %></lable>
               <br/>
               <br/>

               ��й�ȣ :
               <input type="password" id="pw" name="pw" value="" />
               <br/>
               <br/>
               
               ��й�ȣ Ȯ�� :
               <input type="password" id="pw1" name="pw1" value="" />
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
               <input type="text" id="email" name="email" value="<%=dto.getMem_email() %>" />
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
               <input type="button" value="Ż��" onclick="mem_out()" />
            </div>
            
         </div>
               
      </div>

   </div>
</form>

<div style="text-align: center;">
	<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
</div>
   

</body>
</html>