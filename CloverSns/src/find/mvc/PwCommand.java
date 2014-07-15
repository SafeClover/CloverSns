package find.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PwCommand implements FindCommand{

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		
		FindIdPw find = new FindIdPw();
		String pw = find.FindPw(id, email);
		
		if(pw.equals("false")){			
			req.setAttribute("pw", pw);
		}
		
		return "/clover/find/Find_pw_proc.jsp";
	}
	
}
