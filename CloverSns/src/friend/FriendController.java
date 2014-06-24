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
  
      RequestDispatcher view = null;
      HttpSession session = req.getSession();
      PrintWriter out = resp.getWriter();
      
      String id = (String)session.getAttribute("id"); //현재 접속자 아이디
      System.out.println("현재 command :"+req.getParameter("command"));
      if(req.getParameter("command").equals("search")){ //아이디 검색할 때
         String keyword = req.getParameter("keyword");
         Vector<MemberDto> searchResult = dao.SearchFriends(keyword, id);
         req.setAttribute("searchResult", searchResult);
         req.setAttribute("tab", "search");
         req.setAttribute("keyword", keyword);
         view = req.getRequestDispatcher("/clover/friends/FriendsList.jsp");
         view.forward(req, resp);
         
      }
      else if(req.getParameter("command").equals("friendRequest")){ //친구 요청을 할때
         String id_get = req.getParameter("id_get");
         String id_req = req.getParameter("id_req");
         System.out.println("키워드 넘기기 : "+req.getParameter("keywordfor"));
         String keyword = req.getParameter("keywordfor");
         System.out.println("친구 신청 :"+id_get+","+id);
         dao.friendRequest(id_get, id);
         System.out.println("친구요청후 다시 검색값 넘김");
         Vector<MemberDto> searchResult = dao.SearchFriends(keyword, id);
         req.setAttribute("searchResult", searchResult);
         req.setAttribute("tab", "search");
         req.setAttribute("keyword", keyword);
         view = req.getRequestDispatcher("/clover/friends/FriendsList.jsp");
         view.forward(req, resp);
         
      }else if(req.getParameter("command").equals("getFriendAlarm")){ //친구요청 알람을 가져올 때
         System.out.println(req.getParameter("command"));
    	 String id_get = (String) session.getAttribute("id");
         System.out.println("현재 아이디 : "+id_get);
         Vector v = dao.getFriendAlarm(id_get);
         System.out.println("알람 갯수 : " + v.size());
         
         for(int i = 0; i<v.size();i++){
            out.print(v.get(i));
            if(i != v.size()-1){
            out.print(",");
            }
         }
         out.flush();
         out.close();
      }else if(req.getParameter("command").equals("acceptedfriend")){   //친구요청을 수락할 때
         String send_id = (String) req.getParameter("send_id");
         System.out.println(send_id);
         
         dao.FriendInsert(send_id, id);
         out.println("ok");
        
      }else if(req.getParameter("command").equals("deleteReplyAlarm")){ //감상평 알람 확인하고 알람테이블에서 삭제
    	  String upNo = req.getParameter("upNos");
    	  String send_id = req.getParameter("send_id");
    	  System.out.println("deleteReplyAlarm 컨트롤러:"+send_id);
    	  dao.deleteReplyAlarm(send_id, upNo);
      }else if(req.getParameter("command").equals("getReplyalarm")){   //감상평, 댓글 알람 가져올때
    	  System.out.println("getReplyAlarm");
    	  Vector v = dao.getReplyAlarm(id);
    	  if(v.size()!=0){
    		  for(int i=0;i<v.size();i++){
    			Vector reply = (Vector)v.get(i); //댓글한 이름, 게시물번호, 게시물 제목, 댓글한 아이디
    			String name = (String)reply.get(0);
    			int upNo = (int)reply.get(1);
    			String subject =(String)reply.get(2);
    			String send_id = (String)reply.get(3);
    			out.print(name+"`"+subject+"`"+upNo+"`"+send_id);
  	            if(i != v.size()-1){
  	            out.print("|");
  	            }
    		  }
    	  }
      }
   }

}