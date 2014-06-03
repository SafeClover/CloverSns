package friend;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		RequestDispatcher view = null;
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id"); //���� ������ ���̵�

		if(req.getParameter("command").equals("search")){ //���̵� �˻��� ��
			String keyword = req.getParameter("keyword");
			Vector<MemberDto> searchResult = dao.SearchFriends(keyword);
			req.setAttribute("searchResult", searchResult);
			view = req.getRequestDispatcher("/clover/friends/SearchFriends.jsp");
			
		}
		else if(req.getParameter("command").equals("friendRequest")){ //ģ�� ��û�� �Ҷ�
			String id_get = req.getParameter("id_get");
			/*String id_req = req.getParameter("id_req");*/
			
			System.out.println(id_get+","+id);
			dao.friendRequest(id_get, id);
			System.out.println("controller");
			view = req.getRequestDispatcher("/clover/friends/SearchFriends.jsp");
		}else if(req.getParameter("command").equals("getFriendAlarm")){ //ģ����û �˶��� ������ ��
			String id_get = req.getParameter("id_get");
			
			req.setAttribute("getfriendAlarm",dao.getFriendAlarm(id_get));
			view = req.getRequestDispatcher("/clover/bar/header.jsp");
			
		}else if(req.getParameter("command").equals("acceptedfriend")){	//ģ����û�� ������ ��
			String send_id = (String) req.getParameter("id_send");
			System.out.println(send_id);
			/*String get_id = (String) req.getParameter("id_get"); // ���� ���Ӿ��̵�*/
			
			dao.FriendInsert(send_id, id);
			view = req.getRequestDispatcher("/clover/bar/header.jsp");
		}
		view.forward(req, resp);
	}

}
