<%@page import="login_reg.MemberDto"%>
<%@page import="content.ContentDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="content.ContentDao" id="dao"></jsp:useBean>
<jsp:useBean class="content.ContentDto" id="dto"></jsp:useBean>
<jsp:useBean id="dao1" class="login_reg.MemberDao"></jsp:useBean>
<jsp:useBean id="dto1" class="login_reg.MemberDto"></jsp:useBean>
<jsp:useBean id="dto2" class="content.Mypage_replyDto"></jsp:useBean>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage</title>

<link href="/CloverSns/style/css/contest/contest.css" rel="stylesheet">
<script src="/CloverSns/style/js/ajax.js"></script>

<script type="text/javascript"> 
	var upNo = null;

	function del(upNo){
		this.upNo = upNo;
		if (!confirm("삭제하시겠습니까?")){
			return;
		}
		else{
			document.getElementById("upNo").value = upNo;
			document.getElementById("deleteContent").submit();
		}
	}
	
</script>

</head>

<body style="margin-top: 100px; height: 0px;">


	<!-- 프로필 -->

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col" style="float:left">
				<div style="margin-right: 50px; float:left;">

				<c:forEach var = "mv1" items="${mv}">
					<div style="margin-right: 50px;">
						<c:choose>
							<c:when test='${"경로" eq mv1.mem_img}'>

							<img src="/CloverSns/style/img/noimage.jpg" style="width:200px; height: 200px; border-radius: 50px;" />
							<br/>
							<a href="InfoEditImg.index?index=InfoEditImg" style="margin-left: 45px;">
							<b>프로필 사진 변경</b></a>
							
							</c:when>
							<c:otherwise>

							<img src="/CloverSns/img/${mv1.mem_img}" style="width:200px; height: 200px; border-radius: 50px;" />
							<br/>
							<a href="InfoEditImg.index?index=InfoEditImg" style="margin-left: 45px;">
							<b>프로필 사진 변경</b></a>
						
							</c:otherwise>
						</c:choose>
					</div>
									
					</div>
					<div style="margin-top: 50px;">
						<span>
							<h4 style="font-family: 휴먼모음T">
								<span id="b_hover">아이디 : ${mv1.mem_id}</span><br/>
								<span id="b_hover">이름 : ${mv1.mem_name}</span><br/>
								<span id="b_hover">이메일 : ${mv1.mem_email}</span><br/>
								<span id="b_hover">생일 : ${mv1.mem_birth}</span>
							</h4>
						</span>
					</div>
				</c:forEach>
			</div>
			<div class="col" align="right">
				<a href="InfoEditImg.index?index=profileEdit">
					<img src="/CloverSns/style/img/Gear.png" style="width:40px; height:40px;"/><span id="b_hover">회원정보수정</span>
				</a>
			</div>
		</div>
	</div>

	<br />
	<br />
	<hr />
	<br />
	<br />
	

<!-- 사진 리스트 -->
   <div class="row">
	     <c:forEach items="${cv}" begin="${beginPerPage}" end="${beginPerPage + numPerPage}"  step="1" var="i" > 
	
	         <div class="col portfolio-item">
	            <a href="#" onclick="privacy_show(${i.upNo}, null)" data-toggle="modal" data-target=".contest${i.upNo}" title="${i.subject}">
	               <img class="img img-responsive img-thumbnail" src="/CloverSns/img/${i.img_route}" style="width: 150px; height: 150px;">
	               <div style="white-space:nowrap;text-overflow:ellipsis; overflow:hidden; width: 150px;"><h3>${i.subject}</h3></div>
	            </a> 
	            <p>작성일 : ${i.regdate}</p>
	         </div> <!-- col4 끝 -->  
	 
	     </c:forEach>    
   </div> <!-- row 끝 -->
      
      <hr/>
      
    

	<jsp:include page="/clover/modal/MypageModal.jsp"></jsp:include>

<div style="display: table; height: 100%; width: 100%;">
	<div style="display:table-cell; vertical-align: bottom;">
			<jsp:include page="/clover/bar/footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>
<jsp:include page="/clover/bar/header.jsp"></jsp:include>