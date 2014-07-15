package mypage.el;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MypageController extends HttpServlet{

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
		System.out.println("µå·ç¿Í" + command);
		String nextPage = "";
		
		MypageFactory factory = MypageFactory.getInstance();
		MypageCommand hCmd = factory.createCommand(command);
		nextPage = (String)hCmd.processCommand(req, resp);
		
		if(nextPage.equals("/CloverSns/mypage.header?command=mypage")){
			resp.sendRedirect(nextPage);
		}
		else{			
			RequestDispatcher view = req.getRequestDispatcher(nextPage);
			view.forward(req, resp);
		}

	}

}
