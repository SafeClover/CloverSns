<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<link href="/CloverSns/style/css/accordion/bootstrap.min.css" rel="stylesheet"/>
<link href="/CloverSns/style/css/accordion/bootstrap-responsive.css" rel="stylesheet"/>
<script src="/CloverSns/style/js/accordion/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/accordion/bootstrap.js"></script>
</head>

<body>

<div class="container">
	<div class="row">
		<div class="span10">
			<h3>회원 가입 및 로그인</h3>
			<div id="theAccordion" class="accordion">
			<!-- 계정 만들기 -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#account_add" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">계정을 만들려면 어떻게 해야 되나요?</a>
					</div>
					<div id="account_add" class="accordion-body collapse in">
						<div class="accordion-inner">
							토끼풀 홈페이지 접속 -> 회원가입 버튼 클릭 -> 개인 정보 입력 -> 회원가입 완료
						</div>
					</div>
				</div>
				<!-- 계정 만들기 끝-->
				<!-- 로그인 방법 -->    
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#how_login" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">로그인을 하는 방법은 무엇인가요?</a>
					</div>
					<div id="how_login" class="accordion-body collapse in">
						<div class="accordion-inner">
							토끼풀 홈페이지 접속 -> 아이디 입력 -> 비밀번호 입력 -> 로그인 버튼 클릭
						</div>
					</div>
				</div>
				<!-- 로그인 방법 끝-->
				<!-- 로그인 불가능 -->  
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#no_login" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">로그인이 되지 않습니다.</a>
					</div>
					<div id="no_login" class="accordion-body collapse in">
						<div class="accordion-inner">
<pre>
- 회원님의 아이디 및 비밀번호가 일치하는지 확인합니다.
- 비밀번호를 재설정하세요.
</pre>
						</div>
					</div>
				</div>
				<!-- 로그인 불가능 끝-->
				<!-- 로그아웃 방법 -->   
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#how_logout" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">로그아웃을 하는 방법은 무엇인가요?</a>
					</div>
					<div id="how_logout" class="accordion-body collapse in">
						<div class="accordion-inner">
							토끼풀 페이지 오른쪽 상단에서 로그아웃 선택
						</div>
					</div>
				</div>
				<!-- 로그아웃 방법 끝 -->
				<!-- 회원정보 수정 -->   
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#edit_info" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">회원정보를 수정하고 싶어요.</a>
					</div>
					<div id="edit_info" class="accordion-body collapse in">
						<div class="accordion-inner">
							우측 상단의 아이디 클릭 -> 회원정보 수정 클릭 -> 정보 입력 후 정보변경 클릭
						</div>
					</div>
				</div>
				<!-- 회원정보 수정 끝 -->   				
			</div>
			
			<h3>비밀 번호</h3>
			<div id="theAccordion" class="accordion">
			<!-- 비밀번호 분실 -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#pass_lose" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">비밀번호를 잊어버렸을 경우에는 어떻게 해야 되나요?</a>
					</div>
					<div id="pass_lose" class="accordion-body collapse in">
						<div class="accordion-inner">
							로그인 페이지에서 중앙의 Forgotten Password?? 클릭 -> 변경할 비밀번호 입력 -> 수정 클릭
						</div>
					</div>
				</div>
				<!-- 비밀번호 분실 끝-->
				<!-- 비밀번호 재설정 -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#re_pass" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">비밀번호를 재설정하고 싶어요.</a>
					</div>
					<div id="re_pass" class="accordion-body collapse in">
						<div class="accordion-inner">
							우측 상단의 아이디 클릭 -> 회원정보 수정 클릭 -> 정보 입력 후 정보변경 클릭
						</div>
					</div>
				</div>
				<!-- 비밀번호 재설정 끝 -->   				
			</div>
			
				<h3>토끼풀 시작하기</h3>
			<div id="theAccordion" class="accordion">
			<!-- 친구 찾기 -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#search_friends" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">친구 찾기</a>
					</div>
					<div id="search_friends" class="accordion-body collapse in">
						<div class="accordion-inner">
							왼쪽 상단의 서브메뉴 클릭 -> 친구목록 클릭 -> 친구 검색 -> 친구 추가 클릭
						</div>
					</div>
				</div>
				<!-- 친구 찾기 끝-->
				<!-- 게시방법 -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#how_up" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">게시방법</a>
					</div>
					<div id="how_up" class="accordion-body collapse in">
						<div class="accordion-inner">
							중앙 상단의 업로드 버튼 클릭 -> 업로드할 사진 및 글 작성 후 업로드
						</div>
					</div>
				</div>
				<!-- 게시방법 끝 --> 
				<!-- 공개설정 -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#privacy" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">게시방법</a>
					</div>
					<div id="privacy" class="accordion-body collapse in">
						<div class="accordion-inner">
							게시물 업로드시 비공개, 친구공개, 자랑하기 선택
						</div>
					</div>
				</div>
				<!-- 공개설정 끝 --> 
				<!-- 뉴스피드 -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#news" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">뉴스피드</a>
					</div>
					<div id="news" class="accordion-body collapse in">
						<div class="accordion-inner">
<pre>
- 이미지의 일부분이 가려져서 나타납니다.
- 이미지 클릭시 전체 이미지가 보이며, 15초가 지나면 이미지를 볼 수 없습니다.
- 이미지를 볼 수 있는 시간이 지나고 나면 감상평을 작성할 수 있습니다.
</pre>
						</div>
					</div>
				</div>
				<!-- 뉴스피드 끝 --> 
				<!-- 자랑하기 -->  
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#contest" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">자랑하기</a>
					</div>
					<div id="contest" class="accordion-body collapse in">
						<div class="accordion-inner">
<pre>
- 하나의 주제가 정해지면 그 주제에 어울리는 사진을 업로드한다.
- 가장 많이 선택된 사진은 명예의 전당에 올라간다.

</pre>
						</div>
					</div>
				</div>
				<!-- 비밀번호 재설정 끝 --> 
								
			</div>
		</div>
	</div>
</div>

</body>
</html>