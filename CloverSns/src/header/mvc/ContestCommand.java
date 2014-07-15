package header.mvc;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import content.ContentDao;
import content.ContentDto;
import content.HappyDao;
import content.HappyDto;
import contest.el.ContestDao;

public class ContestCommand implements HeaderCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");

		// 세션 
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		ContentDto cDto = new ContentDto();
		ContentDao cDao = new ContentDao();
		HappyDto hDto = new HappyDto();
		HappyDao hDao = new HappyDao();
		
		Vector v = cDao.getContest();
		Vector happy = hDao.selectSmile();
		
		ContestDao conDao = new ContestDao();
		String topic = conDao.topic();
		
		//페이징 자바 코드
		int totalRecord = 0; // 전체 글의 갯수
		int numPerPage = 10; // 한 페이지당 보여질 글의 갯수
		int pagePerBlock = 5; // 한 블럭당 페이지 수
		int totalPage = 0; // 전체 페이지 수
		int totalBlock = 0; // 전체 블럭 수
		int nowPage = 0; // 현재 페이지 번호
		int nowBlock = 0; // 현재 블럭 번호
		int beginPerPage = 0; // 페이지당 시작 번호

		totalRecord = v.size();
		totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));
		if(req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		else if(req.getParameter("nowPage") == null){
			nowPage = 0;
		}
		if(req.getParameter("nowBlock") != null){
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}
		else if(req.getParameter("nowPage") == null){
			nowBlock = 0;
		}
		beginPerPage = nowPage * numPerPage;
		totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
		
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("numPerPage", numPerPage);
		req.setAttribute("pagePerBlock", pagePerBlock);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("beginPerPage", beginPerPage);
		req.setAttribute("topic", topic);
		
		int smile = happy.size();
		
		req.setAttribute("smile", smile);
		req.setAttribute("v", v);
		req.setAttribute("happy", happy);
		
		return "/clover/contest/ContestBoard.jsp";
	}

}
