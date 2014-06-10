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
            <b>프로필 사진</b>
         </div>
         
         <div style="float:right; width:480px; height:600px; text-align:left; vertical-align:middle; display:table-cell; background: #E0FFDB">
            <div style="width:480px; height:400px; display:inline-block;" >
         
               아이디 : <label><%=id%></label>
               <br/>
               
               비밀번호 :
               <input type="password" name="pw" value="" />
               <br/>
               <br/>
               
               비밀번호 확인 :
               <input type="password" value="" />
               <br/>
               <br/>
            
               이름 : 
               <input type="text" name="name" value="" />
               <br/>
               <br/>
            
               <label for="birth">생년월일</label>
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
                  </select>년
                  
                  <select name="month">
                     <%
                        for(int i=0; i<12; i++){
                     %>
                           <option><%=i + 1%></option>
                     <%
                        }
                     %>
                  </select>월
                  
                  <select name="day">
                     <%
                        for(int i=0; i<31; i++){
                     %>
                           <option><%=i + 1%></option>
                     <%
                        }
                     %>
                  </select>일
               <br/>
               <br/>
            
               이메일 : 
               <input type="text" name="email" value="" />
               <br/>
               <br/>
            
               <label for="gender">성별</label>
               <input type="radio" name="gender" id="gender" value="남자" checked="checked" />남자
               &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender" id="gender" value="여자" />여자
               <br/>
               <br/>
                  
               가입날짜 : <label><%=dto.getMem_regDate()%></label>
               <br/>
               <br/>
               <input type="button" value="확인" onclick="InfoEdit()" />
               <input type="button" value="취소" />
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