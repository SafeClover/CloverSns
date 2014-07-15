package board.mvc.notice.el;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class ListCommand implements NoticeCommand{
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		ServiceDao sDao = new ServiceDao();
		ServiceDto sDto = new ServiceDto();
		
		// 페이징에 필요한 변수를 선언부에 선언
		int totalRecord = 0;		// 전체 글의 갯수
		int numPerPage = 15;			// 한 페이지당 보여질 글의 갯수
		int pagePerBlock = 5;		// 한 블럭당 보여질 페이지 수
		int totalPage = 0;			// 전체 페이지 수
		int totalBlock = 0;			// 전체 블럭 수
		int nowPage = 0;			// 현재 페이지 번호
		int nowBlock = 0;			// 현재 블럭 번호
		int beginPerPage = 0;		// 한 페이지당 시작 번호 (페이지당 시작 번호부터 시작해서 몇개의 글을 뿌릴것인지 정할 수 있다.)	
		
		String keyField = req.getParameter("keyField");
		String keyWord = req.getParameter("keyWord");
		
		if(keyField == null){
			keyField = "";
		}
		
		if(req.getParameter("reload") != null){
			if(req.getParameter("reload").equals("true")){
				keyWord="";
			}
		}
		
		if(keyWord==null){
			keyWord="";
		}
		
		Vector list = sDao.getNoticeList(keyField, keyWord);
		
		totalRecord = list.size();
		totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));

		if(req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		
		if(req.getParameter("nowBlock") != null){
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}
		
		beginPerPage = numPerPage * nowPage;
		
		totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
		
		req.setAttribute("list", list);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("numPerPage", numPerPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("beginPerPage", beginPerPage);
		req.setAttribute("getParam", getParam(req));
		req.setAttribute("keyField", keyField);
		req.setAttribute("keyWord", keyWord);

		return "/clover/board/notice/notice_List.jsp";
	}
	
	public String getParam(HttpServletRequest req){
		if(req.getParameter("keyWord") != null){
			return req.getParameter("keyWord");
		}
		else{
			return "";
		}
			
	}
}

