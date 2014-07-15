package board.mvc.question.el;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.ServiceDao;
import board.ServiceDto;

public class PostProcCommand implements QuestionCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ServiceDao sDao = new ServiceDao();
		ServiceDto sDto = new ServiceDto();
		req.setCharacterEncoding("euc-kr");
		
		sDto.setTitle(req.getParameter("title"));
		sDto.setId((String)session.getAttribute("id"));
		sDto.setBoardContent(req.getParameter("boardContent"));
		sDto.setPw(req.getParameter("pw"));
		
		sDto.setCount(0);
		sDto.setDepth(0);
		
		sDto.setDivision("question");
			
		sDao.insertQuestion(sDto);
		
		return "/clover/list.question?question=LIST";
	}

}
