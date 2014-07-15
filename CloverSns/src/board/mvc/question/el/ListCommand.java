package board.mvc.question.el;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ServiceDao;
import board.ServiceDto;

public class ListCommand implements QuestionCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		ServiceDao sDao = new ServiceDao();
		ServiceDto sDto = new ServiceDto();
		
		// ����¡�� �ʿ��� ������ ����ο� ����
		int totalRecord = 0;		// ��ü ���� ����
		int numPerPage = 15;			// �� �������� ������ ���� ����
		int pagePerBlock = 5;		// �� ���� ������ ������ ��
		int totalPage = 0;			// ��ü ������ ��
		int totalBlock = 0;			// ��ü �� ��
		int nowPage = 0;			// ���� ������ ��ȣ
		int nowBlock = 0;			// ���� �� ��ȣ
		int beginPerPage = 0;		// �� �������� ���� ��ȣ (�������� ���� ��ȣ���� �����ؼ� ��� ���� �Ѹ������� ���� �� �ִ�.)	
		
		String keyField = req.getParameter("keyField");
		String keyWord = req.getParameter("keyWord");
		
		if(keyField == null){
			keyField = "";
		}
		
		if(req.getParameter("reload") != null){
			if(req.getParameter("reload").equals("true")){
				keyWord="";
			}
		}
		
		if(keyWord==null){
			keyWord="";
		}
		
		Vector list = sDao.getQuestionList(keyField, keyWord);
		
		totalRecord = list.size();
		totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));

		if(req.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		
		if(req.getParameter("nowBlock") != null){
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}
		
		beginPerPage = numPerPage * nowPage;
		
		totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
		
		req.setAttribute("list", list);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("numPerPage", numPerPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("beginPerPage", beginPerPage);
		req.setAttribute("usedepth",sDao.useDepth(sDto.getDepth()) );
		req.setAttribute("keyField", keyField);
		req.setAttribute("keyWord", keyWord);
		
		return "/clover/board/question/question_List.jsp";
	}

}
