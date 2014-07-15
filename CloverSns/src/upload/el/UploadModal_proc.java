package upload.el;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login_reg.MemberDao;
import login_reg.MemberDto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import content.ContentDao;
import content.ContentDto;

public class UploadModal_proc extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		
		HttpSession session = req.getSession();

		String id = (String)session.getAttribute("id");
		String url = req.getParameter("link");
		ContentDto condto = new ContentDto();
		ContentDao condao = new ContentDao();
		
		MemberDto memdto = new MemberDto();
		MemberDao memdao = new MemberDao();
		
		memdto = memdao.MemberSelect(id);
		
		String name = memdto.getMem_name();
		
		try{
			String realFolder = "";
			String filename = "";
			int maxSize = 1024*1024*5;
			String encType = "euc-kr";
			String savefile = "img";
			ServletContext scontext = req.getServletContext();
			realFolder = scontext.getRealPath(savefile);
			
			String fullpath = null;
		 
		  	MultipartRequest multi = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
		  	String select = multi.getParameter("btn");
			String writing = multi.getParameter("writing");
			String title = multi.getParameter("title");
			/* String upFile = multi.getParameter("upFile"); */
		  	Enumeration<?> files = multi.getFileNames();
		    String file = (String)files.nextElement();
		    filename = multi.getFilesystemName(file);
		 
		 	fullpath = realFolder + "\\" + filename;
			
		 	condto.setId(id);
		 	condto.setPrivacy(select);
		 	condto.setContent(writing);
		 	condto.setSubject(title);
		 	condto.setImg_route(filename);
		 	condto.setName(name);
			
			
			if(select.equals("privacy")){
				condao.insertMypage(condto);
			}
			else if(select.equals("friends")){
				condao.insertOurclover(condto);
			}
			else if(select.equals("contest")){
				condao.insertContest(condto);
			}
			
			resp.sendRedirect(url);
		} 
		catch(Exception e){
			e.printStackTrace();
		} 
		
	}

}
