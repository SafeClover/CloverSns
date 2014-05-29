// ajax ��� ���� (ajax.js)

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
	
	var httpMethod = method ? method : "GET";		// ���� method�� ���� ���� �Ǹ� (null�� �ƴ϶��) ���� method ���� �����ϰ�, ���� ������ "GET"�� �����ض�.
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
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");		// POST��� �϶��� �׻� ���� �Ǿ��־�� �Ѵ�. ���� GET����� ���� ����Ѵ�.
	httpRequest.send((httpMethod == "POST") ? httpParams : null);
	
}