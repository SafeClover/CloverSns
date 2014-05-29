<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<link href="/CloverSns/style/css/bootstrap.css" rel="stylesheet" />
<link href="/CloverSns/style/css/mypage/mypage.css" rel="stylesheet" />
<script src="/CloverSns/style/js/jquery-2.1.1.min.js"></script>
<script src="/CloverSns/style/js/bootstrap.js"></script>

<script type="text/javascript">
	function popupOpen() {

		var popUrl = "/CloverSns/clover/mypage/ProfileImgEdit.html"; //�˾�â�� ��µ� ������ URL

		var popOption = "width=500, height=400, resizable=no, scrollbars=no, status=no;"; //�˾�â �ɼ�(optoin)

		window.open(popUrl, "", popOption);

	}
</script>

</head>

<body>
	<!-- ������ -->

	<div class="container">
		<div class="row">
			<div class="row-fluid">
				<img class="img-responsive profilesize"
					src="/CloverSns/style/img/lim.jpg"> <a
					href="javascript:popupOpen();"> ������ ���� </a>
			</div>
		</div>
	</div>

	<br />
	<br />
	<hr />
	<br />
	<br />
	
	
	<table>
		<tr>
			<td>
				<a href="#" data-toggle="modal" data-target=".pic1"> 
					<img class="picturesize" src="/CloverSns/style/img/apple.jpg">
				</a> 			
			</td>
			
			<td>
				<a href="#"> 
					<img class="picturesize" src="/CloverSns/style/img/dog.jpg">
				</a> 
			</td>

			<td>
				<a href="#"> 
					<img class="picturesize" src="/CloverSns/style/img/fall.jpg">
				</a> 
			</td>

			<td>
				<a href="#"> 
					<img class="picturesize" src="/CloverSns/style/img/kitty.jpg">
				</a> 		
			</td>

			<td>
				<a href="#"> 
					<img class="picturesize" src="/CloverSns/style/img/car.jpg">
				</a> 
			</td>
		</tr>
	
		<tr>
			<td>
				<a href="#"> 
					<img class="picturesize" src="/CloverSns/style/img/phone.jpg">
				</a> 
			</td>

			<td>
				<a href="#"> 
					<img class="picturesize" src="/CloverSns/style/img/coffee.jpg">
				</a> 
			</td>
			
		</tr>
	
	
	</table>
	
	

	<!-- ���â (for��) -->

	<div class="container">
		<div class="row">
			<div class="modal fade pic1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
							</button>
							<h3 class="modal-title">��� â ����</h3>
							<h5>�ۼ��� :</h5>
						</div> <!-- ��� ����� -->
						<div class="modal-body">
							<img src="/CloverSns/style/img/apple.jpg" class="img-responsive center-block">
							<div class="modal-body">
								�ۼ��� : <br /> ���� : <br />
							</div>
						</div> <!-- ��� �ٵ� �� -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary close" data-dismiss="modal">�ݱ�</button>
						</div>
					</div>
					<!-- ��� ����Ʈ �� -->
				</div>
				<!-- ��� ���̾Ʒα� �� -->
			</div>
			<!-- ��� pop1 �� -->
		</div>
		<!-- row �� -->
	</div>
	<!-- container �� -->


<jsp:include page="/clover/bar/footer.jsp"></jsp:include>

</body>
</html>