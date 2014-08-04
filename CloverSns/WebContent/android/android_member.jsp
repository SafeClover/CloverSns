<%@page import="java.util.Vector"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="login_reg.Encrypt"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="login_reg.MemberDto"%>
<%@page import="login_reg.MemberDao"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		MemberDto dto = new MemberDto();
		MemberDao dao = new MemberDao();
		
		/* 회원 가입 */
		String reg_name = request.getParameter("reg_name");
		String reg_id = request.getParameter("reg_id");
		String reg_pw = request.getParameter("reg_pw");
		String reg_email = request.getParameter("reg_email");
		String reg_gender = request.getParameter("reg_gender");
		String reg_date = request.getParameter("reg_date");
		
		if(reg_name!=null || reg_id!=null || reg_pw!=null || reg_email!=null || reg_gender!=null || reg_date!=null){
			Encrypt enc = new Encrypt();
			String enc_pw = enc.encrypt(reg_pw);
			
			dto.setMem_name(reg_name);
			dto.setMem_id(reg_id);
			dto.setMem_pw(enc_pw);
			dto.setMem_email(reg_email);
			dto.setMem_gender(reg_gender);
			dto.setMem_birth(reg_date);
			
			dao.MemberInsert(dto);
		}
		
		/* 회원 정보 안드로이드로 보내기 */
		String id = request.getParameter("id");
		
		if(id != null){
			dto.setMem_id(id);
			Vector member = dao.getInfo(dto);
			
			for(int i=0; i<member.size(); i++){
				member.get(i);
			}
			
			JSONObject  list = new JSONObject();	
			
			list.put("name", dto.getMem_name());
			list.put("email", dto.getMem_email());
			list.put("gender", dto.getMem_gender());
			list.put("birth", dto.getMem_birth());
			
	 		out.println(list);
			
			System.out.println(list);
		}
		if(id == null){
			System.out.println("값이 없음");
		}
		
		/* 회원 비밀번호 변경시 */
		String editId = request.getParameter("editId");
		String editpw = request.getParameter("editpw");
		String editemail = request.getParameter("editemail");
		
		if(editpw != null || editemail != null){
			Encrypt en = new Encrypt();
			editpw = en.encrypt(editpw);
		
			System.out.println("변경된 정보 : " + editpw + ", " + editemail);
			
			dto.setMem_id(editId);
			dto.setMem_pw(editpw);
			dto.setMem_email(editemail);
			System.out.println(dto.getMem_id() + ", " + dto.getMem_pw() + ", " + dto.getMem_email());
			dao.InfomationEdit(dto);
		}
		
		/* 탈퇴 */
		String outid = request.getParameter("outid");
		System.out.println("탈퇴 : " + outid);
		if(outid != null || outid != ""){	
			dao.DeleteMember(outid);
		}
	%>