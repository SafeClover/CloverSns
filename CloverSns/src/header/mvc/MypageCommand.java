package header.mvc;

import index.mvc.IndexCommand;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import content.ContentDao;
import content.Mypage_replyDto;
import login_reg.MemberDao;
import login_reg.MemberDto;

public class MypageCommand implements HeaderCommand, IndexCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");
		MemberDao mDao = new MemberDao();
		MemberDto mDto = new MemberDto();
		ContentDao cDao = new ContentDao();
		Mypage_replyDto rDto = new Mypage_replyDto();
		
		Vector cv = cDao.getMypage((String)session.getAttribute("id"));
		mDto.setMem_id((String)session.getAttribute("id"));
		Vector mv = mDao.getInfo(mDto);
		
		
//      ------------------------------------------------------------------����¡ ����
		int totalRecord = 0; // ��ü ���� ����
		int numPerPage = 20; // �� �������� ������ ���� ����
		int pagePerBlock = 5; // �� ���� ������ ��
		int totalPage = 0; // ��ü ������ ��
		int totalBlock = 0; // ��ü �� ��
		int nowPage = 0; // ���� ������ ��ȣ
		int nowBlock = 0; // ���� �� ��ȣ
		int beginPerPage = 0; // �������� ���� ��ȣ
		
		totalRecord = cv.size();
		totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));

		if(req.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(req.getParameter("nowPage"));

		if(req.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));

		beginPerPage = nowPage * numPerPage;

		totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));

//      ------------------------------------------------------------------����¡ ����
		
		req.setAttribute("cv", cv);
		req.setAttribute("mv", mv);
		
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("numPerPage", numPerPage);
		req.setAttribute("pagePerBlock", pagePerBlock);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("beginPerPage", beginPerPage);
		
		return "/clover/mypage/MyPage.jsp";
	}

}
