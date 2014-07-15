package mypage.el;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login_reg.MemberDao;
import content.ContentDao;
import content.Mypage_replyDto;

public class Mypage_Ajax extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.setCharacterEncoding("utf-8");
		
		resp.setContentType("text/xml");
		resp.setHeader("Cache-Control", "no-cache");
		
		PrintWriter out = resp.getWriter();
		
		ContentDao cDao = new ContentDao();
		MemberDao mDao = new MemberDao();
		
		String cmd = req.getParameter("command");
		int upNo = Integer.parseInt(req.getParameter("upNo"));
		
		System.out.println("넘버 : "+upNo);

		Mypage_replyDto rDto = new Mypage_replyDto();
		rDto.setUpNo(upNo);
		Vector rv = cDao.selectReply(rDto);
		
		
		//
		
		if(!req.getParameter("send_id").equals("null")){
			String send_id = req.getParameter("send_id");
			mDao.deleteReplyAlarm(send_id, upNo);
		}
		
//		mypage 리플
		out.println("<mypage>");
		for(int i=0; i<rv.size(); i++){
			rDto = (Mypage_replyDto)rv.get(i);					
			out.println("<mypage_reply>");
			out.println("<name>" + rDto.getName() + "</name>");			
			out.println("<re>" + rDto.getRe() + "</re>");			
			out.println("<regdate>" + rDto.getRegdate() + "</regdate>");			
			out.println("</mypage_reply>");
		}
		
//		공개설정 확인, 변경
		if(cmd.equals("show")){
			String privacy = cDao.SelectPrivacy(upNo);
			
			if(privacy.equals("privacy")){
				out.println("<command>1</command>");
			}
			else if(privacy.equals("friends")){
				out.println("<command>2</command>");
			}
			else if(privacy.equals("contest")){
				out.println("<command>3</command>");
			}
		}
		else if(cmd.equals("change")){
			String privacy = req.getParameter("privacy");
			
			cDao.ChangePrivacy(privacy, upNo);
			
			if(privacy.equals("privacy")){
				out.println("<command>1</command>");
			}
			else if(privacy.equals("friends")){
				out.println("<command>2</command>");
			}
			else if(privacy.equals("contest")){
				out.println("<command>3</command>");
			}
		}
		out.println("</mypage>");
		out.close();
		return;
	}

}
