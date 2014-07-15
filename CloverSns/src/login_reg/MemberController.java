package login_reg;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Vector;

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
			MemberDao dao = new MemberDao();
			String mem_id = req.getParameter("id");
			String mem_pw = req.getParameter("pw");

			String confirm = dao.LoginConfirm(mem_id, mem_pw);
			
			req.setAttribute("id", mem_id);
			req.setAttribute("confirm", confirm);
			nextPage = "/clover/login_reg/LoginConfirm.jsp";
			
			RequestDispatcher view = req.getRequestDispatcher(nextPage);
			view.forward(req, resp);
		}
		else if(cmd.equals("MEMBER")){
			nextPage = "/clover/login_reg/registraion.jsp";
			RequestDispatcher view = req.getRequestDispatcher(nextPage);
			view.forward(req, resp);
		}
		else if(cmd.equals("MEMBER_JOIN")){
			MemberDao dao = new MemberDao();
			dao.MemberInsert(setMember(req));
			
			HttpSession session = req.getSession();
			session.setAttribute("id", req.getParameter("id"));
			
			nextPage = "Login.index?index=Login";
			RequestDispatcher view = req.getRequestDispatcher(nextPage);
			view.forward(req, resp);
		}
		else if(cmd.equals("ID_CHECK")){
			PrintWriter out = resp.getWriter();

		   String id = req.getParameter("id");

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
				out.println("0");
			}
			else{
				out.println("1");
			}
		}
		else if(cmd.equals("INFO_EDIT")){
			nextPage = "/clover/infoedit/InfoEdit_proc.jsp";
			RequestDispatcher view = req.getRequestDispatcher(nextPage);
			view.forward(req, resp);
		}
		else if(cmd.equals("INFO_EDITIMG")){
			nextPage = "/clover/infoedit/InfoEditImg_proc.jsp";
			RequestDispatcher view = req.getRequestDispatcher(nextPage);
			view.forward(req, resp);
		}
		
		
	
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
