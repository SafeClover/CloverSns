<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
    		
	//������ư��
    function privacy(select){
    	document.getElementById("select").value = select.id;
    }
</script>

</head>
<body>

 <!-- ���ε� ��� -->
   <div class="container">
      <div class="row">
         <div class="modal fade uploadModal" id="uploadModal">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                     	X
					 </button>
                     <h3 class="modal-title">���Ͼ��ε�</h3> 
                  </div> <!-- ��� ����� -->
                  
                  <form method="post" action="/CloverSns/clover/upload_test/UploadModal_proc.jsp" name="fr" enctype="multipart/form-data" >
                 	 <div>
                  		<div class="modal-body" style="float:left; width:50%; height:330px;">            
                     		<div class="modal-body" style="width:100%; height:105%;">
                    	 		<img style="width:100%; height:105%;" class="img-responsive center-block" id="blah" alt="your image" name="image"/>
                     		</div>
                   		</div>
                  
                  		<div class="modal-body">
                  			<div class="modal-body" align="center">
                  				<h6 align="center">���������� �����ּ���</h6>         
                  				<input type="radio" name="btn" value="private" id="�����" onclick="privacy(this)"/>�����&nbsp;
                  				<input type="radio" name="btn" value="friends" id="ģ������" onclick="privacy(this)"/>ģ������&nbsp;
                  				<input type="radio" name="btn" value="contest" id="�ڶ��ϱ�" onclick="privacy(this)"/>�ڶ��ϱ�
                  				<input type="text" name="select" id="select" size="5" style="text-align: center;" readonly />�� ����˴ϴ�.
                  			</div>
                  	
                  			<div class="modal-body" align="center">
                  				<input type="text" placeholder="�����Է�" size="28" name="title" />
                  				<textarea rows="10" cols="30" name="writing" style="overflow-y:scroll" placeholder="���Է�" name="contents"></textarea>
                  			</div>
                  		</div>
                  </div>
                  
                  	<div align="right" style="margin-right: 40px">
                  		<input type="submit" name="upload" value="���ε�"/>
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