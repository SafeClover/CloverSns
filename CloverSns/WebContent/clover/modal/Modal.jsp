<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>Modal</title>

<script>
	//미리보기용
    $(document).ready(function(){ 
    	function readURL(input){ 
        	if(input.files && input.files[0]){ 
          		var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
          		
          		reader.onload = function(e){ //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
            		$('#blah').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정(아래 코드에서 읽어들인 dataURL형식) 
          		};          
          
          		reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
        	} 
      	}//readURL()-- 
      
      	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
   		$("#imgInp").change(function(){ 
        	//alert(this.value); //선택한 이미지 경로 표시 
        	readURL(this); 
      	}); 
	});
	
    function UpLoad(){
		var theForm = document.uploadModal;
		var link =  document.location.href;
		theForm.action = "/CloverSns/clover/modal/UploadModal_proc.jsp?link=" + link ;
		theForm.submit();
	}
    
    //라디오버튼
    function privacy(select){
    	document.getElementById("select").value = select.id;
    }
</script>

</head>
<body>
 <!-- 업로드 모달 -->
   <div class="container" >
      <div class="row">
         <div class="modal fade uploadModal" id="uploadModal">
            <div class="modal-dialog">
               <div class="modal-content" style="background-color:hotpink;">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                     	X
					 </button>
                     <h3 class="modal-title">행복했던 순간을 담아 보세요.</h3> 
                  </div> <!-- 모달 헤더끝 -->
                  
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
                  				<h6 align="center">공개범위를 정해주세요</h6>         
                  				<input type="radio" name="btn" value="privacy" />비공개&nbsp;
                  				<input type="radio" name="btn" value="friends" />친구공개&nbsp;
                  				<input type="radio" name="btn" value="contest" />전체공개
                  				<input type="text" name="select" id="select" size="5" style="text-align: center;" readonly />를 선택하셨습니다.
                  			</div>
                  	
                  			<div class="modal-body" align="center">
                  				<input type="text" placeholder="제목입력" size="28" name="title" />
                  				<textarea rows="10" cols="30" name="writing" style="overflow-y:scroll" placeholder="글입력" name="contents"></textarea>
                  			</div>
                  		</div>
                  		
                  		
                  </div>
                  
                  	<div align="right" style="margin-right: 40px">
                  		<input type="button" name="upload" value="업로드" onclick="UpLoad()"/>
                  	</div>
                  
                  	<div class="modal-body">                   
                     	<input id="imgInp" type="file" name="upFile" />
                  	</div> 
                  </form>
                
                  <div class="modal-footer">
                     <button type="button" class="btn btn-primary close" data-dismiss="modal" >닫기</button>    
                  </div>
               </div> <!-- 모달 컨텐트 끝 -->
            </div> <!-- 모달 다이아로그 끝 -->
         </div> <!-- 모달 pop1 끝 -->
      </div> <!-- row 끝 -->
   </div> <!-- container 끝 -->

</body>
</html>