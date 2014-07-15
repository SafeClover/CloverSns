package board.mvc.notice.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class UpdateCommand implements NoticeCommand{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		ServiceDao sDao = new ServiceDao();
		
		int num = Integer.parseInt(req.getParameter("boardUpNo"));

		ServiceDto sDto = sDao.getBoard(num);

		String id = sDto.getId();
		String title = sDto.getTitle();
		String content = sDto.getBoardContent();
		int count = sDto.getCount();
		String regdate = sDto.getRegDate();
		
		req.setAttribute("id", id);
		req.setAttribute("title", title);
		req.setAttribute("content", content);
		req.setAttribute("count", count);
		req.setAttribute("regdate", regdate);
		return "/clover/board/notice/notice_Update.jsp";
	}

}
