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

		Vector ourclover_vector = cDao.getOurclover(id);	// OurClover select (해당 id의 친구들이 올린 글들의 정보를 벡터에 담아서 가져옴)
		
		Vector alreadyContents = xml.getXmldata(id);		// 해당 id가 읽은 글번호를 벡터에 담아서 가져옴
		
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
		
//		------------------------------------------------------------------페이징 변수
		int totalRecord = 0; // 전체 글의 갯수
		int numPerPage = 20; // 한 페이지당 보여질 글의 갯수
		int pagePerBlock = 5; // 한 블럭당 페이지 수
		int totalPage = 0; // 전체 페이지 수
		int totalBlock = 0; // 전체 블럭 수
		int nowPage = 0; // 현재 페이지 번호
		int nowBlock = 0; // 현재 블럭 번호
		int beginPerPage = 0; // 페이지당 시작 번호
		
		totalRecord = notReadContent.size();
		totalPage = (int)(Math.ceil((double)totalRecord/numPerPage));
		
		if(req.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		if(req.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		
		beginPerPage = nowPage * numPerPage;
		
		totalBlock = (int)(Math.ceil((double)totalPage/pagePerBlock));
//		------------------------------------------------------------------페이징 변수
		
		
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
