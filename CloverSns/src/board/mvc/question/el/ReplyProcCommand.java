package board.mvc.question.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class ReplyProcCommand implements QuestionCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		int num = Integer.parseInt(req.getParameter("boardUpNo"));
		System.out.println("replyproc : " + num);
		
		ServiceDao dao = new ServiceDao();
		ServiceDto parent = dao.getBoard(num);
		ServiceDto dto = new ServiceDto();
		dao.replyUpdatePos(parent);
		
		dto.setPos(parent.getPos());
		dto.setDepth(parent.getDepth());
		dto.setId(req.getParameter("id"));
		dto.setTitle(req.getParameter("title"));
		dto.setBoardContent(req.getParameter("boardContent"));
		dto.setPw(req.getParameter("pw"));
		dao.replyBoard(dto);
		
		return "/clover/list.question?question=LIST";
	}

}
