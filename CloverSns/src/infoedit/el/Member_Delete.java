package infoedit.el;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login_reg.MemberDao;

public class Member_Delete extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset:euc-kr");
		resp.setHeader("Cache-Control", "no-cache");
		
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		
		String id = (String)session.getAttribute("id");
		String code_pass = req.getParameter("pass");
		
		MemberDao dao = new MemberDao();
		String check = dao.LoginConfirm(id, code_pass);
		
		if(check.equals("true")){
			System.out.println("Ãâ·Â!!");
			dao.DeleteMember(id);
			out.println("1");
			session.invalidate();
			return;
		}
		else{
			out.println("0");
			return;
		}
		
	}

}
