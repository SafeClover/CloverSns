package board.mvc.notice.el;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("controller");
		req.setCharacterEncoding("euc-kr");
		String cmd = req.getParameter("notice");
		String nextPage = "";
		
		NoticeFactory factory = NoticeFactory.getInstance();
		NoticeCommand iCmd = factory.createcmdmand(cmd);
		nextPage  = (String)iCmd.processCommand(req, resp);

		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
}
