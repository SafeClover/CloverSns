package contest.el;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login_reg.MemberDao;
import login_reg.MemberDto;
import content.ContentDao;
import content.ContentDto;
import content.Contest_replyDto;
import content.HappyDao;
import content.HappyDto;

public class Contest_ajax extends HttpServlet{

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
		
		HttpSession session = req.getSession();

		MemberDao mDao = new MemberDao();
		MemberDto mDto = new MemberDto();
		
		ContentDao cDao = new ContentDao();
		ContentDto cDto = new ContentDto();
		
		HappyDao hDao = new HappyDao();
		HappyDto hDto = new HappyDto();
		
		Contest_replyDto contest_replydto = new Contest_replyDto();
		
		if(req.getParameter("upNo") != null){
			String id = (String)session.getAttribute("id");
			System.out.println("id : " + id);
			
			int upNo = Integer.parseInt(req.getParameter("upNo"));
			
			// 좋아요
			Vector<HappyDto> happy_vector = hDao.SelectHappy();
			
			int clicked = 0;
			
			for(int i=0; i<happy_vector.size(); i++){
				hDto = happy_vector.get(i);
				
				if(upNo == hDto.getUpNo() && id.equals(hDto.getSmile())){
					clicked = 1;				
				}
				
			}
			
			if(req.getParameter("click") != null){
				if(clicked == 0){
					hDto.setSmile(id);
					hDto.setUpNo(upNo);
					hDao.insertHappy(hDto);
				}
			}
			
			hDto.setUpNo(upNo);
			int count = hDao.showCount(hDto);
			
			// 댓글
			if(req.getParameter("reply") != null){
				String reply = new String(URLDecoder.decode(req.getParameter("reply"),"UTF-8"));
				
				mDto = mDao.MemberSelect(id);
				
				contest_replydto.setId(id);
				contest_replydto.setRe(reply);
				contest_replydto.setUpno(upNo);
				contest_replydto.setName(mDto.getMem_name());
				
				cDao.InsertContestReply(contest_replydto);
			}
			
			contest_replydto.setUpno(upNo);
			Vector contest_vector = cDao.SelectContestReply(contest_replydto);
			
			out.println("<contest>");
			out.println("<count>"+count+"</count>");	// 좋아요 count
			out.println("<clicked>"+clicked+"</clicked>");	// 좋아요 클릭한적 있는지 여부
			for(int i=0; i<contest_vector.size(); i++){
				contest_replydto = (Contest_replyDto)contest_vector.get(i);
				out.println("<reply>");
				out.println("<name>" + contest_replydto.getName() + "</name>");
				out.println("<re>" + contest_replydto.getRe() + "</re>");
				out.println("</reply>");
			}
			out.println("</contest>");
			out.close();
			return;
		}else if(req.getParameter("command").equals("changeTopic")){ //콘테스트 주제 변경하기
			String topic = new String(URLDecoder.decode(req.getParameter("topic"),"UTF-8"));
			System.out.println("cchangeTopic"+topic);
			ContestDao conDao = new ContestDao();
			conDao.changeTopic(topic);
		}
		
		
	}

}
