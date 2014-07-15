package board.mvc.question.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class ReadCommand implements QuestionCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ServiceDao sDao = new ServiceDao();
		
		int boardUpNo = Integer.parseInt(req.getParameter("boardUpNo"));
		String keyField = req.getParameter("keyField");	
		String keyWord = req.getParameter("keyWord");
		
		ServiceDto dto = sDao.getBoard(boardUpNo);
		int UpNo = dto.getBoardUpNo();
		String title = dto.getTitle();
		String id = dto.getId();      
		String boardContent = dto.getBoardContent();
		String regDate = dto.getRegDate();   
		int count = dto.getCount();
		int pos = dto.getPos();
		int depth = dto.getDepth();
		String pw = dto.getPw();
		
		req.setAttribute("id", id);
		req.setAttribute("regDate", regDate);
		req.setAttribute("title", title);
		req.setAttribute("boardContent", boardContent);
		req.setAttribute("count", count);
		req.setAttribute("pos", pos);
		req.setAttribute("depth", depth);
		req.setAttribute("pw", pw);
		req.setAttribute("boardUpNo", UpNo);
		
		return "/clover/board/question/question_Read.jsp";
	}

}
