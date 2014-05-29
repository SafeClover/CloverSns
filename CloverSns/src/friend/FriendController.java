package friend;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login_reg.MemberDao;

public class FriendController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		
		String keyword = req.getParameter("keyword");
		MemberDao dao = new MemberDao();
		String[] searchResult = dao.SearchFriends(keyword);
		req.setAttribute("searchResult", searchResult);
		
		RequestDispatcher view = req.getRequestDispatcher("SearchFriends.jsp");
		view.forward(req, resp);
	}

}
