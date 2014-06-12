<%@page import="content.HappyDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/xml; charset=EUC-KR" %>
<jsp:useBean id="happy_dto" class="content.HappyDto"></jsp:useBean>
<jsp:useBean id="happy_dao" class="content.HappyDao"></jsp:useBean>
<%
	if(request.getParameter("upNo") != null){
		
		int upNo = Integer.parseInt(request.getParameter("upNo"));
		String id = (String)session.getAttribute("id");
		
		Vector<HappyDto> happy_vector = happy_dao.SelectHappy();
		
		int repeat = 0;
		
		for(int i=0; i<happy_vector.size(); i++){
			happy_dto = happy_vector.get(i);
			
			if(upNo == happy_dto.getUpNo() && id.equals(happy_dto.getSmile())){
				repeat += 1;				
			}
						
		}
		
		if(repeat == 0){			
			happy_dto.setSmile(id);
			happy_dto.setUpNo(upNo);
			happy_dao.insertHappy(happy_dto);
		}
		
		happy_dto.setUpNo(upNo);
		int count = happy_dao.showCount(happy_dto);
		
		out.println("<dto>");
		out.println("<count>"+count+"</count>");	
		out.println("</dto>");
		
	}
%>
