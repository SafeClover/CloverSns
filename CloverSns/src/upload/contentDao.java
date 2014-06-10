package upload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import clover.db.DBConnectionMgr;

public class contentDao{
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DBConnectionMgr pool = null;	
	 
	 public contentDao(){
	      try{
	  		pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

	      }
	      catch(Exception err){
	         System.out.println("DB연결 실패 : " + err);
	      }
	   }
		
	public void freeCon(){
		if(con != null)try{con.close();}catch(Exception err){}
		if(stmt != null)try{stmt.close();}catch(Exception err){}
		if(rs != null)try{rs.close();}catch(Exception err){}
	
	}
	
	public void insertContent(contentDto dto){
		String sql = "insert into content(img_route, regDate, subject, id, name, content, privacy) values( ?,now(), ?, ?, ?, ?, ?)";
		try{
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getImg_route());
			stmt.setString(2, dto.getSubject());
			stmt.setString(3, dto.getId());
			stmt.setString(4, dto.getName());
			stmt.setString(5, dto.getContent());
			stmt.setString(6, dto.getPrivacy());
			
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertContent : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	}
}
