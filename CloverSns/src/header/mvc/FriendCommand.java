package header.mvc;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login_reg.MemberDao;
import login_reg.MemberDto;
import content.ContentDao;
import content.ContentDto;

public class FriendCommand implements HeaderCommand{

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		/*<jsp:useBean id="dao" class="login_reg.MemberDao"></jsp:useBean>
		<jsp:useBean id="dto" class="login_reg.MemberDto"></jsp:useBean>
		<jsp:useBean id="dao2" class="content.ContentDao"></jsp:useBean>
		<jsp:useBean id="dto2" class="content.ContentDto"></jsp:useBean>*/
		
		/*FriendList.jsp*/
		HttpSession session = req.getSession();
		MemberDto mDto = new MemberDto();
		MemberDao mDao = new MemberDao();
		ContentDto cDto = new ContentDto();
		ContentDao cDao = new ContentDao();
		
		
		cDto.setId((String)session.getAttribute("id"));
	 	Vector myfriends = mDao.getMyfriends((String)session.getAttribute("id"));
	   	Vector searchResult = (Vector)req.getAttribute("searchResult");
	   	
	   	req.setAttribute("myfriends", myfriends);
	   	req.setAttribute("searchResult", searchResult);
	   	
	   	/*Header.jsp*/
	
	    Vector v = (Vector)req.getAttribute("getAlarm");
	    
	
	    
		return "/clover/friends/FriendsList.jsp";
	}
	
}
