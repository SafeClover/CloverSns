package index.mvc;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login_reg.MemberDao;
import login_reg.MemberDto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InfoEditImgProcCommand implements IndexCommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		   HttpSession session = req.getSession();

		   MemberDto dto = new MemberDto();
		   MemberDao dao = new MemberDao();
		   
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

			      Enumeration files = multi.getFileNames();  
			      String file = (String)files.nextElement();
			      filename = multi.getFilesystemName(file);
			   
			      fullpath = realFolder + "\\" + filename;
			      System.out.println(filename);
			   
			      dto.setMem_img(filename);
			      dto.setMem_id((String)session.getAttribute("id"));
			      
			      dao.InfomationImgEdit(dto);
		      
		   }
		   catch(Exception e){
		      e.printStackTrace();
		   }
		
		return "/CloverSns/mypage.header?command=mypage";
	}

}
