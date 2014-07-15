package board.mvc.question.el;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class DeleteProcCommand implements QuestionCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ServiceDto dto = new ServiceDto();
		ServiceDao dao = new ServiceDao();
		PrintWriter pw = resp.getWriter();
		int boardUpNo = Integer.parseInt(req.getParameter("boardUpNo"));
		
		dto = dao.getBoard(boardUpNo);

		String pass2 = dto.getPw();
		String pass1 = (String)req.getParameter("pw");
		
		if(pass1 != null){
			if(pass1.equals(pass2)){
				dao.deleteBoard(boardUpNo);
				return "/clover/list.question?question=LIST";
			}
			else{
				req.setAttribute("message", "패스워드가 틀렸습니다.");
			}
		}
		return "/clover/list.question?question=DELETE";
		
	}

}
