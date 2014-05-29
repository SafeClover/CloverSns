package board.mvc.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface QuestionCommand {
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException;
}