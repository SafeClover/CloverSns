<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Vector"%>
<%@page import="ourclover.XMLController"%>
<%@page import="content.ContentDto"%>
<%@page import="content.ContentDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

	String id = request.getParameter("autoId");
	
	System.out.println("our : " + id);
	
	ContentDao cDao = new ContentDao();
	ContentDto cDto = new ContentDto();
	XMLController xml = new XMLController();

	Vector ourclover_vector = cDao.getOurclover(id);	// OurClover select (해당 id의 친구들이 올린 글들의 정보를 벡터에 담아서 가져옴)
	
	Vector alreadyContents = xml.getXmldata(id);		// 해당 id가 읽은 글번호를 벡터에 담아서 가져옴
	
	Vector notReadContent = new Vector();
	
	for(int i=0; i<ourclover_vector.size(); i++){
		cDto = (ContentDto)ourclover_vector.get(i);
		boolean check = true;
		
		if(alreadyContents.size() > 0){
			for(int j=0; j<alreadyContents.size(); j++){
				if(cDto.getUpNo() == Integer.parseInt((String)alreadyContents.get(j))){
					check = false;
					break;
				}
			}
			if(check == true){
				notReadContent.add(cDto);
			}
		}
		else{
			notReadContent.add(cDto);
		}
	}
	
	JSONObject ConObj = new JSONObject(); //content JSON내용을 담을 객체
	
	for(int i=0; i<notReadContent.size(); i++){
		cDto = (ContentDto)notReadContent.get(i);
		ConObj.put("ConUpno", cDto.getUpNo());
		ConObj.put("ConName", cDto.getName());
		ConObj.put("ConSubject", cDto.getSubject());
		ConObj.put("ConRegdate", cDto.getRegdate());
		ConObj.put("ConImg", cDto.getImg_route());
		
		out.println(ConObj + "/");
		
		System.out.println("ConObj : "+ConObj);
	}
	
	
	out.flush();
%>