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

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> <!-- 미리보기용 -->

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
    		
	//라디오버튼용
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
               	<h3>글 제목</h3>
            </a>
            <p>작성자 : </p>
         </div> <!-- col4 끝 -->
              
      </div> <!-- row 끝 -->
      
      <hr/>
      
   </div> <!-- container 끝 -->
   
   <!-- 모달 (Popover) 창 -->
   <div class="container">
      <div class="row">
         <div class="modal fade pop1">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                     	X
					 </button>
                     <h3 class="modal-title">파일업로드</h3> 
                  </div> <!-- 모달 헤더끝 -->
                  
                  <form method="post" action="UploadModal_proc.jsp" name="fr" enctype="multipart/form-data" >
                 	 <div>
                  		<div class="modal-body" style="float:left; width:50%; height:330px;">            
                     		<div class="modal-body" style="width:100%; height:105%;">
                    	 		<img style="width:100%; height:105%;" class="img-responsive center-block" id="blah" alt="your image" name="image"/>
                     		</div>
                   		</div>
                  
                  		<div class="modal-body">
                  			<div class="modal-body" align="center">
                  				<h6 align="center">공개범위를 정해주세요</h6>         
                  				<input type="radio" name="btn" value="private" id="비공개" onclick="test(this)"/>비공개&nbsp;
                  				<input type="radio" name="btn" value="friends" id="친구공개" onclick="test(this)"/>친구공개&nbsp;
                  				<input type="radio" name="btn" value="contest" id="자랑하기" onclick="test(this)"/>자랑하기
                  				<input type="text" name="select" id="select" size="5" style="text-align: center;" readonly />로 저장됩니다.
                  			</div>
                  	
                  			<div class="modal-body" align="center">
                  				<input type="text" placeholder="제목입력" size="28" name="title" />
                  				<textarea rows="10" cols="30" name="writing" style="overflow-y:scroll" placeholder="글입력" name="contents"></textarea>
                  			</div>
                  		</div>
                  </div>
                  
                  	<div align="right" style="margin-right: 40px">
                  		<input type="submit" name="upload" value="업로드"/>
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