package board.mvc.notice.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;

public class DeleteCommand implements NoticeCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		ServiceDao sDao = new ServiceDao();
	

		int num = Integer.parseInt(req.getParameter("boardUpNo"));
		req.setAttribute("boardUpNo", num);

		return "/clover/board/notice/notice_Delete.jsp";
	}

}
