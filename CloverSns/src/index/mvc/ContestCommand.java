package index.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContestCommand implements IndexCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setAttribute("url", "/CloverSns/clover/contest/ContestBoard.jsp");
		return "/clover/main/index.jsp";
	}

}
