package ourclover;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;

import clover.db.DBConnectionMgr;

public class OurCloverDao {
		private Connection con = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		private DBConnectionMgr pool = null;	
		
	public OurCloverDao(){
		try{
	  		pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	public void InsertImpression(String impression, int upno, String id, String name){
		try{
			String sql = "INSERT INTO reply(upno, id, regdate, re, name) VALUES(?, ?, now(), ?, ?)";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, upno);
			stmt.setString(2, id);
			stmt.setString(3, impression);
			stmt.setString(4, name);
			
			stmt.executeUpdate();
			
		}
		catch(Exception err){
			System.out.println("InsertImpression : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	}

}
