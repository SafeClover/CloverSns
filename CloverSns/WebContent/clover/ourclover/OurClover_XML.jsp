<?xml version="1.0" encoding="EUC-KR" ?>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/xml; charset=EUC-KR" %>

<%

   	String id = (String)session.getAttribute("id");
	String sql = "select * from content c, friends f where privacy = 'friends' and ((f.get_id = ? and c.id = f.send_id) or (f.send_id = ? and c.id = f.get_id)) order by regdate desc";
   
   
   //데이터베이스 연결
   Connection con = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   
   try{
	  Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://192.168.10.21:3306/tproject";
      String user = "root";
      String pw = "tiger";
      con = DriverManager.getConnection(url, user, pw);
      stmt = con.prepareStatement(sql);
      stmt.setString(1, "scvasas");
      stmt.setString(2, "scvasas");
      
      rs = stmt.executeQuery();
      
      
      out.println("<content>");
      
      while(rs.next()){
         out.println("<friends>");
         out.println("<upNo>"+rs.getInt(1)+"</upNo>");   
         out.println("<img_route>"+rs.getString(2)+"</img_route>");   
         out.println("<regdate>"+rs.getString(3)+"</regdate>");   
         out.println("<subject>"+rs.getString(4)+"</subject>");   
         out.println("<id>"+rs.getString(5)+"</id>");   
         out.println("<name>"+rs.getString(6)+"</name>");   
         out.println("<content>"+rs.getString(7)+"</content>");   
         out.println("<privacy>"+rs.getString(8)+"</privacy>");   
         out.println("<send_id>"+rs.getString(9)+"</send_id>");   
         out.println("<get_id>"+rs.getString(10)+"</get_id>");   
         out.println("</friends>");
      }
      
      out.println("</content>");
      
      rs.close();
      stmt.close();
      con.close();
      
   }
   catch(Exception err){
      System.out.println("OurClover_XML : " + err);
   }
   
%>