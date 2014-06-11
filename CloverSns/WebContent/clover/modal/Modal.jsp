<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>Modal</title>

<script>
	//�̸������
    $(document).ready(function(){ 
    	function readURL(input){ 
        	if(input.files && input.files[0]){ 
          		var reader = new FileReader(); //������ �б� ���� FileReader��ü ���� 
          		
          		reader.onload = function(e){ //���� �о���̱⸦ ���������� ȣ��Ǵ� �̺�Ʈ �ڵ鷯 
            		$('#blah').attr('src', e.target.result); //�̹��� Tag�� SRC�Ӽ��� �о���� File������ ����(�Ʒ� �ڵ忡�� �о���� dataURL����) 
          		};          
          
          		reader.readAsDataURL(input.files[0]); //File������ �о� dataURL������ ���ڿ��� ���� 
        	} 
      	}//readURL()-- 
      
      	//file ������� �̹����� ����(���� ����) �Ǿ����� ó���ϴ� �ڵ� 
   		$("#imgInp").change(function(){ 
        	//alert(this.value); //������ �̹��� ��� ǥ�� 
        	readURL(this); 
      	}); 
	});
	
    function UpLoad(){
		var theForm = document.uploadModal;
		var link =  document.location.href;
		theForm.action = "/CloverSns/clover/modal/UploadModal_proc.jsp?link=" + link ;
		theForm.submit();
	}
    
    //������ư
    function privacy(select){
    	document.getElementById("select").value = select.id;
    }
</script>

</head>
<body>
 <!-- ���ε� ��� -->
   <div class="container" >
      <div class="row">
         <div class="modal fade uploadModal" id="uploadModal">
            <div class="modal-dialog">
               <div class="modal-content" style="background-color:hotpink;">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                     	X
					 </button>
                     <h3 class="modal-title">�ູ�ߴ� ������ ��� ������.</h3> 
                  </div> <!-- ��� ����� -->
                  
<!--                   <form method="post" action="/CloverSns/clover/modal/UploadModal_proc.jsp" name="fr" enctype="multipart/form-data" > -->
                  <form method="post" id="uploadModal" enctype="multipart/form-data" name = "uploadModal">
                 	 <div>
                  		<div class="modal-body" style="float:left; width:50%; height:330px;">            
                     		<div class="modal-body" style="width:100%; height:105%; background-color:white;">
                    	 		<img style="width:100%; height:105%;" class="img-responsive center-block" id="blah" alt="your image" name="image"/>
                     		</div>
                   		</div>
                  
                  		<div class="modal-body">
                  			<div class="modal-body" align="center">
                  				<h6 align="center">���������� �����ּ���</h6>         
                  				<input type="radio" name="btn" value="privacy" />�����&nbsp;
                  				<input type="radio" name="btn" value="friends" />ģ������&nbsp;
                  				<input type="radio" name="btn" value="contest" />��ü����
                  				<input type="text" name="select" id="select" size="5" style="text-align: center;" readonly />�� �����ϼ̽��ϴ�.
                  			</div>
                  	
                  			<div class="modal-body" align="center">
                  				<input type="text" placeholder="�����Է�" size="28" name="title" />
                  				<textarea rows="10" cols="30" name="writing" style="overflow-y:scroll" placeholder="���Է�" name="contents"></textarea>
                  			</div>
                  		</div>
                  		
                  		
                  </div>
                  
                  	<div align="right" style="margin-right: 40px">
                  		<input type="button" name="upload" value="���ε�" onclick="UpLoad()"/>
                  	</div>
                  
                  	<div class="modal-body">                   
                     	<input id="imgInp" type="file" name="upFile" />
                  	</div> 
                  </form>
                
                  <div class="modal-footer">
                     <button type="button" class="btn btn-primary close" data-dismiss="modal" >�ݱ�</button>    
                  </div>
               </div> <!-- ��� ����Ʈ �� -->
            </div> <!-- ��� ���̾Ʒα� �� -->
         </div> <!-- ��� pop1 �� -->
      </div> <!-- row �� -->
   </div> <!-- container �� -->

</body>
</html>