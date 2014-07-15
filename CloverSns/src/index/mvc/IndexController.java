package index.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mvc.notice.el.NoticeCommand;
import board.mvc.notice.el.NoticeFactory;

public class IndexController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		String cmd = req.getParameter("index");
		String nextPage = "";
		
		IndexFactory factory = IndexFactory.getInstance();
		IndexCommand iCmd = factory.createCommand(cmd);
		nextPage = (String)iCmd.processCommand(req, resp);
		
		if(nextPage.equals("/CloverSns/mypage.header?command=mypage")){
			resp.sendRedirect(nextPage);
		}
		else if(nextPage.equals("/CloverSns/ourclover.header?command=ourclover")){
			resp.sendRedirect(nextPage);
		}
		else{
			RequestDispatcher view = req.getRequestDispatcher(nextPage);
			view.forward(req, resp);			
		}
		
	}
}
