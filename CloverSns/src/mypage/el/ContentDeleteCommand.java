package mypage.el;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import content.ContentDao;
import header.mvc.MypageCommand;

public class ContentDeleteCommand implements mypage.el.MypageCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ContentDao cDao = new ContentDao();
		
		int upNo = Integer.parseInt(req.getParameter("upNo"));

		cDao.deleteMypage(upNo);

		return "/CloverSns/mypage.header?command=mypage";
	}
	
}
