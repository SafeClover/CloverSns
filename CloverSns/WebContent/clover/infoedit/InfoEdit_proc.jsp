<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="login_reg.MemberDao"%>
<%@page import="login_reg.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

   MemberDto dto = new MemberDto();
   MemberDao dao = new MemberDao();
   
   try{
      String realFolder = "";
      String filename = "";
      int maxSize = 1024*1024*5;
      String encType = "euc-kr";
      String savefile = "img";
      ServletContext scontext = getServletContext();
      realFolder = scontext.getRealPath(savefile);
      
      String fullpath = null;
      
      MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
      
       Enumeration files = multi.getFileNames();  
       String file = (String)files.nextElement();
      filename = multi.getFilesystemName(file);
   
      fullpath = realFolder + "\\" + filename;
      System.out.println(filename);
   
      dto.setMem_pw(multi.getParameter("pw"));
      dto.setMem_name(multi.getParameter("name"));
      dto.setMem_birth(multi.getParameter("year") + "_" + multi.getParameter("month") + "_" + multi.getParameter("day"));
      dto.setMem_email(multi.getParameter("email"));
      dto.setMem_gender(multi.getParameter("gender"));
      dto.setMem_img(filename);
      dto.setMem_id((String)session.getAttribute("id"));
      
      dao.InfomationEdit(dto);
      
      response.sendRedirect("/CloverSns/clover/mypage/MyPage.jsp");
      /* response.sendRedirect("/CloverSns/Mypage.index?index=Mypage"); */
   }
   catch(Exception e){
      e.printStackTrace();
   }
   
%>