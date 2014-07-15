package index.mvc;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login_reg.MemberDao;
import login_reg.MemberDto;

public class ProfileEditCommand implements IndexCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberDao mDao = new MemberDao();
		MemberDto mDto = new MemberDto();
		
		String id = (String)session.getAttribute("id");

		mDto = mDao.MemberSelect(id);
		
		req.setAttribute("mDto", mDto);
		
		return "/clover/infoedit/InfoEdit.jsp";
	}

}
