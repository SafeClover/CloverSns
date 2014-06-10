<%@page import="java.io.PrintWriter"%>
<%@page import="login_reg.MemberDto"%>
<%@page import="java.util.Vector"%>
<%@page import="login_reg.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	PrintWriter comment = response.getWriter();

   String id = request.getParameter("id");

   MemberDao mem_dao = new MemberDao();
   MemberDto mem_dto = new MemberDto();
   Vector<MemberDto> mem_list = new Vector<MemberDto>();
   
   mem_list = mem_dao.MemberList();
   
   int count = 0;
   
	for(int i=0; i<mem_list.size(); i++){
		mem_dto = mem_list.get(i);

		if(mem_dto.getMem_id().equals(id)){
			count += 1;
		}
		
   }
	
	if(count == 0){
		comment.println("사용할 수 있는 아이디입니다.");
	}
	else{
		comment.println("중복된 아이디입니다.");
	}

%>