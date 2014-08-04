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

	Vector ourclover_vector = cDao.getOurclover(id);	// OurClover select (�ش� id�� ģ������ �ø� �۵��� ������ ���Ϳ� ��Ƽ� ������)
	
	Vector alreadyContents = xml.getXmldata(id);		// �ش� id�� ���� �۹�ȣ�� ���Ϳ� ��Ƽ� ������
	
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
	
	JSONObject ConObj = new JSONObject(); //content JSON������ ���� ��ü
	
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