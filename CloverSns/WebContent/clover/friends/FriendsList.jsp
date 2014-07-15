
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<jsp:useBean id="dao" class="login_reg.MemberDao"></jsp:useBean>
<jsp:useBean id="dto" class="login_reg.MemberDto"></jsp:useBean>
<jsp:useBean id="dao2" class="content.ContentDao"></jsp:useBean>
<jsp:useBean id="dto2" class="content.ContentDto"></jsp:useBean>

<link href="/CloverSns/style/css/friends/FriendsList.css" rel="stylesheet" />

 <script  type="text/javascript">
       document.onkeydown = keyClose;
      function keyClose(){
         if(event.keyCode == 116){
            parent.location.href = "/CloverSns/clover/friends/FriendsList.jsp";
         }
      }

      function fnFriendRequest(name, id){
         
         var del=confirm(name+"님께 친구 요청을 보내시겠습니까?");
         if(del==true){
            document.getElementById("keywordfor").value = document.getElementById("keyword").value;
            document.getElementById("id_get").value=id;
            document.friendRequest.submit();
         }
         
      }
      
      function isNull(){
         if(document.getElementById("keyword").value != null || document.getElementById("keyword").value != ""){
            document.search.submit();
         }
      }
   </script>    
</head>
<body style="margin-top: 80px;">
   <c:set value="${myfriends}" var="myfriends"></c:set>
   <c:set value="${searchResult}" var="searchResult"></c:set>
   <div>
      <img alt="우리는 친구?" src="/CloverSns/style/img/Friends.jpg">
   </div>
   
   <!-- 내친구/아이디 검색 탭 -->
   <ul class="nav nav-tabs">
   <c:if test="${tab != 'search'}">
         <li class="active"><a href="#home" data-toggle="tab">내 친구</a></li>
        <li><a href="#searchID" data-toggle="tab">이름 검색</a></li>
    </c:if>
    <c:if test="${tab == 'search'}">   
         <li><a href="#home" data-toggle="tab">내 친구</a></li>
        <li class="active"><a href="#searchID" data-toggle="tab">이름 검색</a></li>
    </c:if>
   </ul>

   <!-- Tab panes -->
   <div class="tab-content">
   <!-- 내친구 부분 -->
   <c:if test="${tab != 'search'}">
     <div class="tab-pane active" id="home">
   </c:if>
    <c:if test="${tab == 'search'}">   
     <div class="tab-pane" id="home">
    </c:if>
        <!-- 이부분 for문 이용 하여 친구목록 불러온다 -->
      <div class="container1">
         <div class="row">
         <c:if test="${myfriends != null}">
            <c:forEach var="dto" items="${myfriends}">
               <div>
                  <a href="#" class="thumbnail" style="width: 150px; height: auto; float: left; margin: 20px;">
                  	<c:choose>
                  		<c:when test="${dto.mem_img == '경로'}">
	                        <img src="/CloverSns/style/img/noimage.jpg" style="width: 100%; height: auto;">
                  		</c:when>
                  		<c:otherwise>
                    	    <img src="/CloverSns/img/${dto.mem_img}"  style="width: 100%; height: auto;">
                  		</c:otherwise>
                  	</c:choose>
                  	 
                     <i>${dto.mem_name}</i><br/>
                     <i>${dto.mem_birth}</i>
                  </a>
               </div>
            </c:forEach>   
         </c:if>
         <c:if test="${myfriends == null}">
            <div style="height: 200px; margin-left: 200px; font-size: 15px;">
               <br/><br/><br/><br/>
               아직 친구가 없네요!  바로 위 이름 검색 탭을 눌러서 친구 신청을 해보세요 :)
            </div>
         </c:if>

         </div>
      </div>
   </div>
     
     <!-- 아이디 검색 부분 -->
     <c:if test="${tab != 'search'}">
      <div class="tab-pane" id="searchID">
     </c:if>
     <c:if test="${tab == 'search'}">
        <div class="tab-pane active" id="searchID">
     </c:if>
         <form method="post" name="search" action="/CloverSns/friend.action?command=search">
         <div class="container">
            <div class="row">
               <h2>친구 찾기</h2>
               <div id="custom-search-input">
                  <div class="input-group col-md-12">
                  
                  <c:if test="${keyword == null}">
                     <input type="text" name="keyword" class="search-query form-control" placeholder="Search" title="r"/> 
                  </c:if>
                  <c:if test="${keyword != null}"> <!-- 검색어 유지 -->
                  
                     <input type="text" id="keyword" name="keyword" value="${keyword}<%-- <%=request.getAttribute("keyword")%> --%>" class="search-query form-control" placeholder="Search" title="r"/> 
                  </c:if>
                  
                     <span class="input-group-btn">
                        <button class="btn btn-danger" type="button" onclick="isNull()">
                           <span class=" glyphicon glyphicon-search"></span>
                        </button>
                     </span>
                  </div>
               </div>
            </div>
         </div>
      </form> 
      
      <div class="container container-result">
      
       <section class="col-xs-12 col-sm-6 col-md-12">
       <c:if test="${searchResult == null }">
            검색결과가 없습니다.
       </c:if>
       <c:if test="${searchResult != null }">
            <form action="/CloverSns/friend.action" name="friendRequest" method="post">
             <c:forEach var="result" items="${searchResult}">
                <c:set var="list" value="${result}" />
               <article class="search-result row">
                  <div class="col-xs-12 col-sm-12 col-md-3">
                     <a href="#" title="Lorem ipsum" class="thumbnail">
                     	<c:choose>
                     		<c:when test="${list[3] == '경로'}">
		                        <img src="/CloverSns/style/img/noimage.jpg" alt="Lorem ipsum" style="height: 150px; max-width: 200px;" />
                     		</c:when>
                     		<c:otherwise>
		                        <img src="/CloverSns/img/${list[3]}" alt="Lorem ipsum" style="height: 150px; max-width: 200px;" />
                     		</c:otherwise>
                     	</c:choose>
                     </a>
                  </div>
   
                  <div class="col-xs-12 col-sm-12 col-md-2">
                     <ul class="meta-search">
                        <li><i class="glyphicon glyphicon-user"></i> <span>${list[1]}</span></li>
                     </ul>
                  </div>
                  
                  
                  <!-- 친구 추가 버튼 -->
                  
                     <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
               
                     <c:if test="${list[2] == '1'}">
                        <span class="plus">친구추가
                           <Button type="button" onclick="fnFriendRequest('${list[1]}','${list[0]}')">
                           		<i class="glyphicon glyphicon-plus"></i>
                           </Button>
                          
                            </span>
                     </c:if>
                     <c:if test="${list[2] == '2'}">
                            친구 신청 대기중
                     </c:if>
                     <c:if test="${list[2] == '3'}">
                            우린 이미 친구!
                     </c:if>
                        
                     </div>
                      <input type="hidden" name="command" value="friendRequest"/>
                         <input type="hidden" id="keywordfor" name="keywordfor" />
                     <input type="hidden" name="id_get" id="id_get"/> 
                  
                  <span class="clearfix borda"></span>
               </article>
               
            </c:forEach>
         </form>
      </c:if>
      
      </section>
   </div> 
     </div>
   </div>

   <div style="text-align: center;">
      <jsp:include page="/clover/bar/footer.jsp"></jsp:include>
   </div>
   
   <jsp:include page="/clover/bar/header.jsp"></jsp:include>
</body>

</html>