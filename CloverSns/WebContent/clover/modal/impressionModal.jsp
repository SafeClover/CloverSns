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
<script>
	function Reload(){
		history.go(0);
	}
</script>
</head>
<body>

<!-- ������ �˾� ���â -->
	<form action="ImpressionSubmit.jsp" method="post" name="impression_form">
		<input type="hidden" name="upno" id="upno" />
		<div class="container">
	      <div class="row">
	         <div class="modal fade impression">
	            <div class="modal-dialog" style="width: 30%; margin-top: 12%;">
	               <div class="modal-content">
	                  <div class="modal-header">
	                     <button type="button" class="close" data-dismiss="modal" onclick="Reload()">
	                     X
	                     </button>
	                     <h3 class="modal-title">�������� ���ܺ�����.</h3>
	                  </div> <!-- ��� ����� -->
	                  <div class="modal-body">
	                     <textarea name="impression_text" id="impression_text" rows="5" cols="45"></textarea><br/><br/>
	                     <input class="btn btn-primary" type="button" value="����" onclick="impression_Submit()"/>
	                  </div> <!-- ��� �ٵ� �� -->
	                  <div class="modal-footer">
	                    <button type="button" class="btn btn-primary close" data-dismiss="modal" onclick="Reload()">�ݱ�</button>  
	                  </div>
	               </div> <!-- ��� ����Ʈ �� -->
	            </div> <!-- ��� ���̾Ʒα� �� -->
	         </div> <!-- ��� pop1 �� -->
	      </div> <!-- row �� -->
		</div> <!-- container �� -->
	</form>

</body>
</html>