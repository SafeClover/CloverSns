package board.mvc.notice.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class PostProcCommand implements NoticeCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		ServiceDao sDao = new ServiceDao();
		ServiceDto sDto = new ServiceDto();
		
		String division = req.getParameter("division");
		sDto.setDivision(division);
		sDto.setTitle(req.getParameter("title"));
		sDto.setBoardContent(req.getParameter("boardContent"));
		sDao.insertNotice(sDto);
		
		return "/clover/list.notice?notice=LIST";
	}

}
