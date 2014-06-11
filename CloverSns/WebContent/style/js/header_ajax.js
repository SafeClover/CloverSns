//ajax 모든 파일 (ajax.js)
var httpRequest = null;

function getXMLHttpRequest(){
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("MSXML2.XMLHTTP");
			}
			catch(e){
				return new ActiveXObject("Microsoft.XMLHTTP");
			}
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}
	else{
		return null;
	}
}
	function sendRequest(url, params, callback, method){
		httpRequest = getXMLHttpRequest();
		
		var httpMethod = method? method: "GET"; //method != null? method : "GET"; 같은 말
		if(httpMethod != "GET" && httpMethod != "POST"){
			httpMethod = "GET";
		}
		
		var httpParams = (params == null || params =="") ? null : params;
		var httpUrl = url;
		if(httpMethod =="GET" || httpParams != null){
			httpUrl = httpUrl+"?"+httpParams;
		}
		
		httpRequest.open(httpMethod, httpUrl, true);
		httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		httpRequest.onreadystatechange = callback; //send메서드 전에만 호출하면 됨
		httpRequest.send((httpMethod == "POST") ? httpUrl : null );
	}

	