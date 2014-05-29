package board.mvc.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class DeleteCommand implements QuestionCommand {
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
			return "/clover/board/question/question_Delete.jsp";
	}

}
