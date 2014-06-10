<%@page import="content.ContentDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean class="content.ContentDao" id="dao"></jsp:useBean>
<jsp:useBean class="content.ContentDto" id="dto"></jsp:useBean>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" />
<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet">
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>

</head>

<body>

<% Vector v = dao.getMypage((String)session.getAttribute("id"));%>
   
	<!-- ������ -->

	<div class="container">
		<div class="row">
			<div align="right">
				<a href="/CloverSns/clover/infoedit/InfoEdit.jsp" target="head">
					<img alt="" src="/CloverSns/style/img/Gear.png" style="width:40px; height:40px;"/>�����ʼ���</a>
			
				<!-- <img class="img-responsive profilesize" 
				src="/CloverSns/style/img/lim.jpg"> 
				<a href="javascript:popupOpen();"> ������ ���� </a> -->
			</div>
		</div>
	</div>

	<br />
	<br />
	<hr />
	<br />
	<br />
	
	
<!-- ���� ����Ʈ�Դϴ�!(for�� ���� �ɰſ���) -->
   <div class="container">
   
      <div class="row">
        <% 
         for(int i=0; i<v.size(); i++){ 
         dto = (ContentDto)v.get(i);    
        %>
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".contest<%= dto.getUpNo() %>">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/img/<%= dto.getImg_route() %>" style="width: 150px; height: 150px;">
               <h3><%= dto.getSubject() %></h3>
            </a>
            <p>�ۼ��� : <%= dto.getId() %></p>
         </div> <!-- col4 �� -->    
      <% } %>             
      </div> <!-- row �� -->
      
      <hr/>
      
      <!-- ����¡ �Դϴ�.!! -->
      <div class="row text-center">

            <div class="paging">
                <ul class="pagination">
                    <li><a href="#">&laquo;</a></li>
                    <% for(int i=1; i<=5; i++){ 
                       if(i == 1){ %>
                          <script>document.getElementById("list2").class="active";</script>
                       <% } %>
                    <li><a href="#" id="list2"><%= i %></a></li>
                    <% } %>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </div>
        </div>
   </div> <!-- container �� -->
	
	

	<!-- ��� (Popover) â -->
      <% 
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
                     <h3 class="modal-title"><%= dto.getSubject() %></h3>
                     <h5>�ۼ��� : <%= dto.getRegdate() %></h5>
                  </div> <!-- ��� ����� -->
                  <div class="modal-body">
                     <img src="/CloverSns/img/<%= dto.getImg_route() %>" class="img-responsive center-block">
                     <div class="modal-body">
                        �ۼ��� : <%= dto.getId() %><br/>
                        ���� : <%= dto.getContent() %><br/>
                     </div>
                  </div> <!-- ��� �ٵ� �� -->
                  <div class="modal-footer">
                     <button type="button" class="btn btn-primary close" data-dismiss="modal" >�ݱ�</button>  
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
   </div> <!-- container �� -->
<% } %>


<jsp:include page="/clover/bar/footer.jsp"></jsp:include>

</body>
</html>