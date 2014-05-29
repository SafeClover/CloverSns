package board.mvc.question;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.mvc.question.QuestionCommand;
import board.mvc.question.QuestionFactory;

public class QuestionController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		String question = req.getParameter("question");
		String page = "";
		HttpSession session = req.getSession();
		String current = (String)req.getAttribute("currentState");
		
		QuestionFactory factory = QuestionFactory.getInstance();
		QuestionCommand qCmd = factory.createCommand(question);
		page = (String)qCmd.processCommand(req, resp);
		
		RequestDispatcher view = req.getRequestDispatcher(page);
		view.forward(req, resp);
	}
}
