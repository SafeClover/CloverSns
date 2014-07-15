package board.mvc.question.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class UpdateCommand implements QuestionCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("boardUpNo"));
		ServiceDao dao = new ServiceDao();
		ServiceDto dto = dao.getBoard(num);
		
		req.setAttribute("num", num);
		req.setAttribute("id", dto.getId());
		req.setAttribute("title", dto.getTitle());
		req.setAttribute("content", dto.getBoardContent());
		
		return "/clover/board/question/question_Update.jsp";
	}

}
