package find.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCommand implements FindCommand{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		System.out.println("ÀÌ¸§ ¶°¶ù!!! : " + name);
		System.out.println("ÀÌ¸ÞÀÏ ¶°¶ù!!! : " + email);
		
		FindIdPw find = new FindIdPw();
		String id = find.FindId(name, email);
		req.setAttribute("id", id);
		
		return "/clover/find/Find_id_proc.jsp";
	}
}
