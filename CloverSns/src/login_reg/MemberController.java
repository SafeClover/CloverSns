package login_reg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String cmd = req.getParameter("command");
		String nextPage = null;
		
		 if(cmd.equals("LOGIN")){
			String mem_id = req.getParameter("id");
			String mem_pw = req.getParameter("pw");

			req.setAttribute("mem_id", mem_id);
			req.setAttribute("mem_pw", mem_pw);
			
			nextPage = "/clover/login_reg/LoginConfirm.jsp";
		}
		else if(cmd.equals("MEMBER")){
			nextPage = "/clover/login_reg/registraion.jsp";
		}
		else if(cmd.equals("MEMBER_JOIN")){
			MemberDao dao = new MemberDao();
			dao.MemberInsert(setMember(req));
			
			HttpSession session = req.getSession();
			session.setAttribute("id", req.getParameter("id"));
			
			nextPage = "Login.index?index=Login";
		}
		else if(cmd.equals("ID_CHECK")){
			String id = req.getParameter("id");
			nextPage = "/clover/login_reg/idCheck.jsp?id=" + id;
		}
		else if(cmd.equals("INFO_EDIT")){
			nextPage = "/clover/infoedit/InfoEdit_proc.jsp";
		}
		else if(cmd.equals("INFO_EDITIMG")){
			nextPage = "/clover/infoedit/InfoEditImg_proc.jsp";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	
	}
	
	public MemberDto setMember(HttpServletRequest req){
		MemberDto dto = new MemberDto();
		Encrypt encrypt = new Encrypt();
		dto.setMem_birth(req.getParameter("year") + "_" + req.getParameter("month") + "_" + req.getParameter("day"));
		dto.setMem_email(req.getParameter("email"));
		dto.setMem_gender(req.getParameter("gender"));
		dto.setMem_id(req.getParameter("id"));
		dto.setMem_name(req.getParameter("name"));
		dto.setMem_pw(encrypt.encrypt(req.getParameter("pw")));

		return dto;
	}

}
