package board.mvc.question.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class ReplyCommand implements QuestionCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		int boardUpNo = Integer.parseInt(req.getParameter("boardUpNo"));
		String keyfield = req.getParameter("keyfield");

		
		ServiceDao dao = new ServiceDao();
		ServiceDto dto = dao.getBoard(boardUpNo);
		String title = dto.getTitle();
		String boardContent = dto.getBoardContent();
		
		req.setAttribute("boardUpNo", boardUpNo);
		req.setAttribute("title", title);
		req.setAttribute("boardContent", boardContent);
		return "/clover/board/question/question_reply.jsp";
	}

}
