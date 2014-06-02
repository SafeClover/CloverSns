package friend;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login_reg.MemberDao;
import login_reg.MemberDto;

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
		MemberDao dao = new MemberDao();
		System.out.println(req.getParameter("command"));
		if(req.getParameter("command").equals("search")){
			String keyword = req.getParameter("keyword");
			Vector<MemberDto> searchResult = dao.SearchFriends(keyword);
			req.setAttribute("searchResult", searchResult);
			
		}
		else if(req.getParameter("command").equals("friendRequest")){
			req.getParameter("id_get");
			req.getParameter("id_req");
			System.out.println("controller");
		}
		RequestDispatcher view = req.getRequestDispatcher("/clover/friends/SearchFriends.jsp");
		view.forward(req, resp);
	}

}
