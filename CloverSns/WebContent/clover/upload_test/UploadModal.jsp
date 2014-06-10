<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:useBean id="dto" class="content.ContentDto"></jsp:useBean>
	<jsp:useBean id="dao" class="content.ContentDao"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1">
    
    <title>Contest</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet">
<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet">
    
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> <!-- �̸������ -->

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
    function test(select){
    	document.getElementById("select").value = select.id;
    }
</script>
</head>
<body style="overflow: scroll;">

   <div class="container">
      <div class="row">
      
         <div class="col portfolio-item">
            <a href="#" data-toggle="modal" data-target=".pop1">
               <img class="img img-responsive img-thumbnail" src="/CloverSns/style/img/1.jpg">
               	<h3>�� ����</h3>
            </a>
            <p>�ۼ��� : </p>
         </div> <!-- col4 �� -->
              
      </div> <!-- row �� -->
      
      <hr/>
      
   </div> <!-- container �� -->
   
   <!-- ��� (Popover) â -->
   <div class="container">
      <div class="row">
         <div class="modal fade pop1">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                     	X
					 </button>
                     <h3 class="modal-title">���Ͼ��ε�</h3> 
                  </div> <!-- ��� ����� -->
                  
                  <form method="post" action="UploadModal_proc.jsp" name="fr" enctype="multipart/form-data" >
                 	 <div>
                  		<div class="modal-body" style="float:left; width:50%; height:330px;">            
                     		<div class="modal-body" style="width:100%; height:105%;">
                    	 		<img style="width:100%; height:105%;" class="img-responsive center-block" id="blah" alt="your image" name="image"/>
                     		</div>
                   		</div>
                  
                  		<div class="modal-body">
                  			<div class="modal-body" align="center">
                  				<h6 align="center">���������� �����ּ���</h6>         
                  				<input type="radio" name="btn" value="private" id="�����" onclick="test(this)"/>�����&nbsp;
                  				<input type="radio" name="btn" value="friends" id="ģ������" onclick="test(this)"/>ģ������&nbsp;
                  				<input type="radio" name="btn" value="contest" id="�ڶ��ϱ�" onclick="test(this)"/>�ڶ��ϱ�
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