package header.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login_reg.MemberDao;
import login_reg.MemberDto;
import content.ContentDao;
import content.ContentDto;
import content.Contest_replyDto;


public class HeaderController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		
		String command = req.getParameter("command");
		System.out.println("Controller : "+req.getParameter("command"));
		String nextPage = "";
		
		HeaderFactory factory = HeaderFactory.getInstance();
		HeaderCommand hCmd = factory.createCommand(command);
		nextPage = (String)hCmd.processCommand(req, resp);
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
		
	}

}
