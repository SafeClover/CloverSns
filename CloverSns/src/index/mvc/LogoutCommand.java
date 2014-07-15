package index.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCommand implements IndexCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		res.setHeader("cache-control","no-cache");
		res.setHeader("expires","0");
		res.setHeader("pragma","no-cache");
		if(req.getProtocol().equals("HTTP/1.1")){
			res.setHeader("cache-control", "no-cache");
		}
		
		session.removeAttribute("id");
		session.invalidate();
		return "/clover/login_reg/Login.jsp";
	}

}
