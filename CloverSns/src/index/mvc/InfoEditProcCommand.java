package index.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login_reg.Encrypt;
import login_reg.MemberDao;
import login_reg.MemberDto;

public class InfoEditProcCommand implements IndexCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");	
		
		HttpSession session = req.getSession();

		Encrypt encrypt = new Encrypt();
		MemberDto dto = new MemberDto();
		MemberDao dao = new MemberDao();
		
		dto.setMem_id((String)session.getAttribute("id"));
		dto.setMem_pw(encrypt.encrypt(req.getParameter("pw")));
		dto.setMem_name(req.getParameter("name"));
		dto.setMem_birth(req.getParameter("year") + "_" + req.getParameter("month") + "_" + req.getParameter("day"));
		dto.setMem_email(req.getParameter("email"));
		dto.setMem_gender(req.getParameter("gender"));
			
		dao.InfomationEdit(dto);
		
		
		return "/CloverSns/mypage.header?command=mypage";
	}

}
