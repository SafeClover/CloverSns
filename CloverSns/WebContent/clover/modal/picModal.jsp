<%@page import="content.ContentDao"%>
<%@page import="java.util.Vector"%>
<%@page import="content.ContentDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

	ContentDto dto = new ContentDto();
	ContentDao dao = new ContentDao();
	
	Vector ourclover_vector = dao.getOurclover(id);
	
	for(int i=0; i<ourclover_vector.size(); i++){
		dto = (ContentDto)ourclover_vector.get(i);
%>

<!-- ���� �˾� ���â (for��) -->
<div class="container">
      <div class="row">
         <div class="modal fade ourclover<%=dto.getUpNo()%>">
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
                  	<p id="count" style="font-size: 20px; font-weight:bold ; color: red;"></p>	<!-- 15�� ī��Ʈ -->
                  	<input type="button" value="������" class="btn btn-primary" data-toggle="modal" data-target=".impression" data-dismiss="modal" aria-hidden="true" />
                    <button type="button" class="btn btn-primary close" id="close" data-dismiss="modal" aria-hidden="true">�ݱ�</button>  
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
</div> <!-- container �� -->

<%
	}
%>

<%-- 
<div class="container">
      <div class="row">
         <div class="modal fade ourclover<%=dto.getUpNo()%>">
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
                  	<p id="count" style="font-size: 20px; font-weight:bold ; color: red;"></p>	<!-- 15�� ī��Ʈ -->
                  	<input type="button" value="������" class="btn btn-primary"  onclick="pic_ModalClose()" />
                    <button type="button" class="btn btn-primary close" id="close" onclick="test()" >�ݱ�</button>  
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
</div> <!-- container �� -->
 --%>
</body>
</html>