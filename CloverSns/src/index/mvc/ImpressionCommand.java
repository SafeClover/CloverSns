package index.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ourclover.OurCloverDao;
import login_reg.MemberDao;
import login_reg.MemberDto;

public class ImpressionCommand implements IndexCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String impression_text = req.getParameter("impression_text");
		
		int upno = Integer.parseInt(req.getParameter("upno")); //�Խñ� ��ȣ
		String content_id = req.getParameter("id"); //�Խñ� �ۼ��� ID
		String id = (String)session.getAttribute("id");
		
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.MemberSelect(id);

		String name = dto.getMem_name();

		OurCloverDao ourclover_dao = new OurCloverDao();
		ourclover_dao.InsertImpression(impression_text, upno, id, name, content_id);
		
		return "/CloverSns/ourclover.header?command=ourclover";
	}
}
