package board.mvc.notice.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class ReadCommand implements NoticeCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		ServiceDao sDao = new ServiceDao();
		
	
		int num = Integer.parseInt(req.getParameter("boardUpNo"));
		String keyField = req.getParameter("keyField");
		String keyWord = req.getParameter("keyWord");
	
		ServiceDto dto = sDao.getBoard(num);
		
		String id = dto.getId();
		String title = dto.getTitle();
		String content = dto.getBoardContent();
		int count = dto.getCount();
		String regdate = dto.getRegDate();
		int boardUpNo = dto.getBoardUpNo();
		req.setAttribute("id", id);
		req.setAttribute("title", title);
		req.setAttribute("content", content);
		req.setAttribute("count", count);
		req.setAttribute("regdate", regdate);
		req.setAttribute("boardUpNo", boardUpNo);
		req.setAttribute("keyField", keyField);
		req.setAttribute("keyWord", keyWord);
		
		return "/clover/board/notice/notice_Read.jsp";
	}

}
