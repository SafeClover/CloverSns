<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="/CloverSns/style/js/ajax.js"></script>

</head>
<body>

	<script>
		xmlDoc=loadXMLDoc("ContentCheck.xml");
		alert("test1");
		
		id = xmlDoc.createElement("id");
		
		x = xmlDoc.getElementsByTagName("Check")[0];
		
		alert(x);
		x.appendChild(id);
		
		document.write(x.getElementsByTagName("id")[0].nodeName);
	</script>

</body>
</html>