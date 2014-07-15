package board.mvc.notice.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;

public class DeleteProcCommand implements NoticeCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		ServiceDao dao = new ServiceDao();
		int num = Integer.parseInt(req.getParameter("boardUpNo"));
		dao.deleteBoard(num);
		return "list.notice?notice=LIST";
	}

}
