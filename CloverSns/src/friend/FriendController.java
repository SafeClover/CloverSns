package friend;

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
      resp.setCharacterEncoding("euc-kr");
      MemberDao dao = new MemberDao();
      System.out.println(req.getParameter("command"));
      RequestDispatcher view = null;
      HttpSession session = req.getSession();
      PrintWriter out = resp.getWriter();
      
      String id = (String)session.getAttribute("id"); //���� ������ ���̵�

      if(req.getParameter("command").equals("search")){ //���̵� �˻��� ��
         String keyword = req.getParameter("keyword");
         Vector<MemberDto> searchResult = dao.SearchFriends(keyword, id);
         req.setAttribute("searchResult", searchResult);
         req.setAttribute("tab", "search");
         req.setAttribute("keyword", keyword);
         view = req.getRequestDispatcher("/clover/friends/FriendsList.jsp");
         view.forward(req, resp);
         
      }
      else if(req.getParameter("command").equals("friendRequest")){ //ģ�� ��û�� �Ҷ�
         String id_get = req.getParameter("id_get");
         /*String id_req = req.getParameter("id_req");*/
         
         String keyword = req.getParameter("keywordfor");
         System.out.println(id_get+","+id);
         dao.friendRequest(id_get, id);
         System.out.println("controller");
         req.setAttribute("tab", "search");
         req.setAttribute("keyword", keyword);
         view = req.getRequestDispatcher("/clover/friends/FriendsList.jsp");
         view.forward(req, resp);
      }else if(req.getParameter("command").equals("getFriendAlarm")){ //ģ����û �˶��� ������ ��
         System.out.println(req.getParameter("command"));
    	 String id_get = (String) session.getAttribute("id");
         System.out.println("���� ���̵� : "+id_get);
         Vector v = dao.getFriendAlarm(id_get);
         System.out.println("�˶� ���� : " + v.size());
         
         for(int i = 0; i<v.size();i++){
            out.print(v.get(i));
            if(i != v.size()-1){
            out.print(",");
            }
         }
         out.flush();
         out.close();
      }else if(req.getParameter("command").equals("acceptedfriend")){   //ģ����û�� ������ ��
         String send_id = (String) req.getParameter("send_id");
         System.out.println(send_id);
         
         dao.FriendInsert(send_id, id);
         out.println("ok");
         /*view = req.getRequestDispatcher("_self");
         view.forward(req, resp);*/
      }/*else if(req.getParameter("command").equals("myfriends")){//�ڽ��� ģ�� ����� �ҷ��ö�
    	 Vector myfriends = dao.getMyfriends(id);
    	 req.setAttribute("myfriends", myfriends);
    	 view = req.getRequestDispatcher("/clover/friends/FriendsList.jsp");
    	 view.forward(req, resp);    	 
      }*/
   }

}