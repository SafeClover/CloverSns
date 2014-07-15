package find.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mvc.notice.el.NoticeCommand;
import board.mvc.notice.el.NoticeFactory;

public class FindController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		String com = req.getParameter("find");
		String nextPage = "";
		
		FindFactory factory = FindFactory.getInstance();
		FindCommand iCmd = factory.createCommand(com);
		nextPage  = (String)iCmd.processCommand(req, resp);

		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
	
}
