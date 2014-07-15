package board.mvc.notice.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class UpdateProcCommand implements NoticeCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		ServiceDto dto = new ServiceDto();
		ServiceDao dao = new ServiceDao();

		int num = Integer.parseInt(req.getParameter("boardUpNo"));
		dto = dao.getBoard(num);
		
		
		dto.setBoardUpNo(num);
		dto.setBoardContent(req.getParameter("content"));
		dto.setTitle(req.getParameter("title"));
		
		dao.updateBoard(dto);
		
		return "/clover/list.notice?notice=LIST";
	}

}
