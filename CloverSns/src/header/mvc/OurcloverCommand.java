package header.mvc;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ourclover.XMLController;
import content.ContentDao;
import content.ContentDto;

public class OurcloverCommand implements HeaderCommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");
		
		ContentDao cDao = new ContentDao();
		ContentDto cDto = new ContentDto();
		XMLController xml = new XMLController();

		Vector ourclover_vector = cDao.getOurclover(id);	// OurClover select (�ش� id�� ģ������ �ø� �۵��� ������ ���Ϳ� ��Ƽ� ������)
		
		Vector alreadyContents = xml.getXmldata(id);		// �ش� id�� ���� �۹�ȣ�� ���Ϳ� ��Ƽ� ������
		
		Vector notReadContent = new Vector();
		
		for(int i=0; i<ourclover_vector.size(); i++){
			cDto = (ContentDto)ourclover_vector.get(i);
			boolean check = true;
			
			if(alreadyContents.size() > 0){
				for(int j=0; j<alreadyContents.size(); j++){
					if(cDto.getUpNo() == Integer.parseInt((String)alreadyContents.get(j))){
						check = false;
						break;
					}
				}
				if(check == true){
					notReadContent.add(cDto);					
				}
			}
			else{
				notReadContent.add(cDto);
			}
		}
		
//		------------------------------------------------------------------����¡ ����
		int totalRecord = 0; // ��ü ���� ����
		int numPerPage = 20; // �� �������� ������ ���� ����
		int pagePerBlock = 5; // �� ���� ������ ��
		int totalPage = 0; // ��ü ������ ��
		int totalBlock = 0; // ��ü �� ��
		int nowPage = 0; // ���� ������ ��ȣ
		int nowBlock = 0; // ���� �� ��ȣ
		int beginPerPage = 0; // �������� ���� ��ȣ
		
		totalRecord = notReadContent.size();
		totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));
		
		if(req.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		if(req.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		
		beginPerPage = nowPage * numPerPage;
		
		totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
//		------------------------------------------------------------------����¡ ����
		
		
		req.setAttribute("ourclover_vector", ourclover_vector);
		req.setAttribute("notReadContent", notReadContent);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("numPerPage", numPerPage);
		req.setAttribute("pagePerBlock", pagePerBlock);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("beginPerPage", beginPerPage);
		
		
		return "/clover/ourclover/OurClover.jsp";
	}

}
