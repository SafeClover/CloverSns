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
			<h3>ȸ�� ���� �� �α���</h3>
			<div id="theAccordion" class="accordion">
			<!-- ���� ����� -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#account_add" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">������ ������� ��� �ؾ� �ǳ���?</a>
					</div>
					<div id="account_add" class="accordion-body collapse in">
						<div class="accordion-inner">
							�䳢Ǯ Ȩ������ ���� -> ȸ������ ��ư Ŭ�� -> ���� ���� �Է� -> ȸ������ �Ϸ�
						</div>
					</div>
				</div>
				<!-- ���� ����� ��-->
				<!-- �α��� ��� -->    
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#how_login" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">�α����� �ϴ� ����� �����ΰ���?</a>
					</div>
					<div id="how_login" class="accordion-body collapse in">
						<div class="accordion-inner">
							�䳢Ǯ Ȩ������ ���� -> ���̵� �Է� -> ��й�ȣ �Է� -> �α��� ��ư Ŭ��
						</div>
					</div>
				</div>
				<!-- �α��� ��� ��-->
				<!-- �α��� �Ұ��� -->  
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#no_login" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">�α����� ���� �ʽ��ϴ�.</a>
					</div>
					<div id="no_login" class="accordion-body collapse in">
						<div class="accordion-inner">
<pre>
- ȸ������ ���̵� �� ��й�ȣ�� ��ġ�ϴ��� Ȯ���մϴ�.
- ��й�ȣ�� �缳���ϼ���.
</pre>
						</div>
					</div>
				</div>
				<!-- �α��� �Ұ��� ��-->
				<!-- �α׾ƿ� ��� -->   
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#how_logout" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">�α׾ƿ��� �ϴ� ����� �����ΰ���?</a>
					</div>
					<div id="how_logout" class="accordion-body collapse in">
						<div class="accordion-inner">
							�䳢Ǯ ������ ������ ��ܿ��� �α׾ƿ� ����
						</div>
					</div>
				</div>
				<!-- �α׾ƿ� ��� �� -->
				<!-- ȸ������ ���� -->   
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#edit_info" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">ȸ�������� �����ϰ� �;��.</a>
					</div>
					<div id="edit_info" class="accordion-body collapse in">
						<div class="accordion-inner">
							���� ����� ���̵� Ŭ�� -> ȸ������ ���� Ŭ�� -> ���� �Է� �� �������� Ŭ��
						</div>
					</div>
				</div>
				<!-- ȸ������ ���� �� -->   				
			</div>
			
			<h3>��� ��ȣ</h3>
			<div id="theAccordion" class="accordion">
			<!-- ��й�ȣ �н� -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#pass_lose" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">��й�ȣ�� �ؾ������ ��쿡�� ��� �ؾ� �ǳ���?</a>
					</div>
					<div id="pass_lose" class="accordion-body collapse in">
						<div class="accordion-inner">
							�α��� ���������� �߾��� Forgotten Password?? Ŭ�� -> ������ ��й�ȣ �Է� -> ���� Ŭ��
						</div>
					</div>
				</div>
				<!-- ��й�ȣ �н� ��-->
				<!-- ��й�ȣ �缳�� -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#re_pass" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">��й�ȣ�� �缳���ϰ� �;��.</a>
					</div>
					<div id="re_pass" class="accordion-body collapse in">
						<div class="accordion-inner">
							���� ����� ���̵� Ŭ�� -> ȸ������ ���� Ŭ�� -> ���� �Է� �� �������� Ŭ��
						</div>
					</div>
				</div>
				<!-- ��й�ȣ �缳�� �� -->   				
			</div>
			
				<h3>�䳢Ǯ �����ϱ�</h3>
			<div id="theAccordion" class="accordion">
			<!-- ģ�� ã�� -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#search_friends" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">ģ�� ã��</a>
					</div>
					<div id="search_friends" class="accordion-body collapse in">
						<div class="accordion-inner">
							���� ����� ����޴� Ŭ�� -> ģ����� Ŭ�� -> ģ�� �˻� -> ģ�� �߰� Ŭ��
						</div>
					</div>
				</div>
				<!-- ģ�� ã�� ��-->
				<!-- �Խù�� -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#how_up" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">�Խù��</a>
					</div>
					<div id="how_up" class="accordion-body collapse in">
						<div class="accordion-inner">
							�߾� ����� ���ε� ��ư Ŭ�� -> ���ε��� ���� �� �� �ۼ� �� ���ε�
						</div>
					</div>
				</div>
				<!-- �Խù�� �� --> 
				<!-- �������� -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#privacy" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">�Խù��</a>
					</div>
					<div id="privacy" class="accordion-body collapse in">
						<div class="accordion-inner">
							�Խù� ���ε�� �����, ģ������, �ڶ��ϱ� ����
						</div>
					</div>
				</div>
				<!-- �������� �� --> 
				<!-- �����ǵ� -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#news" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">�����ǵ�</a>
					</div>
					<div id="news" class="accordion-body collapse in">
						<div class="accordion-inner">
<pre>
- �̹����� �Ϻκ��� �������� ��Ÿ���ϴ�.
- �̹��� Ŭ���� ��ü �̹����� ���̸�, 15�ʰ� ������ �̹����� �� �� �����ϴ�.
- �̹����� �� �� �ִ� �ð��� ������ ���� �������� �ۼ��� �� �ֽ��ϴ�.
</pre>
						</div>
					</div>
				</div>
				<!-- �����ǵ� �� --> 
				<!-- �ڶ��ϱ� -->  
				<div class="accordion-group">
					<div class="accordion-heading">
						<a href="#contest" data-toggle="collapse" class="accordion-toggle"
						data-parent="#theAccordion">�ڶ��ϱ�</a>
					</div>
					<div id="contest" class="accordion-body collapse in">
						<div class="accordion-inner">
<pre>
- �ϳ��� ������ �������� �� ������ ��︮�� ������ ���ε��Ѵ�.
- ���� ���� ���õ� ������ ���� ���翡 �ö󰣴�.

</pre>
						</div>
					</div>
				</div>
				<!-- ��й�ȣ �缳�� �� --> 
								
			</div>
		</div>
	</div>
</div>

</body>
</html>