package board.question.el;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class Question_Ajax extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		
		int num = Integer.parseInt(req.getParameter("boardUpNo"));
		
		String pass1 = req.getParameter("pw");
		ServiceDao dao = new ServiceDao();
		ServiceDto dto = dao.getBoard(num);
		
		if(pass1.equals(dto.getPw())){
			ServiceDto dto2 = new ServiceDto();
			dto2.setId(req.getParameter("id"));
			dto2.setTitle(req.getParameter("title"));
			dto2.setBoardContent(req.getParameter("boardContent"));
			dto2.setBoardUpNo(num);
			
			dao.updateBoard(dto2);
			resp.sendRedirect("list.question?question=LIST");
			return;
		}
		else{
			out.println("1");
			out.close();
			return;
		}
	}

}
