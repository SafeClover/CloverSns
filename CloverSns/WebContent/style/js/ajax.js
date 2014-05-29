// ajax 모듈 파일 (ajax.js)

var httpRequest = null;

function getXMLHttpRequest(){
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("MSXML2.XMLHTTP");
		}
		catch(e){
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}
	else{
		return null;
	}
}

function sendRequest(url, params, callback, method){
	httpRequest = getXMLHttpRequest();
	
	var httpMethod = method ? method : "GET";		// 앞의 method에 값이 전달 되면 (null이 아니라면) 뒤의 method 값을 전달하고, 값이 없으면 "GET"을 전달해라.
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	
	var httpParams = (params == null || params == "") ? null : params;
	
	var httpUrl = url;
	if(httpMethod == "GET" && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.onreadystatechange = callback;
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");		// POST방식 일때는 항상 설정 되어있어야 한다. 거의 GET방식을 많이 사용한다.
	httpRequest.send((httpMethod == "POST") ? httpParams : null);
	
}