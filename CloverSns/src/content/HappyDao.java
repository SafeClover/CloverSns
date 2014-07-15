package content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import clover.db.DBConnectionMgr;

public class HappyDao {
	private Connection con = null;
	private PreparedStatement stmt= null;
	private ResultSet rs = null;
	private DBConnectionMgr pool = null;
	Vector v = new Vector();
	
	public HappyDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	public void insertHappy(HappyDto dto){
		try{
			con = pool.getConnection();
			String sql = "insert into happy(upno, smile) values(?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, dto.getUpNo());
			stmt.setString(2, dto.getSmile());
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertHappy : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	}
	
	public int showCount(HappyDto dto){
	      int count = 0;
	      String sql = null;
	      try{
	    	  con = pool.getConnection();
	         sql = "SELECT count(*) FROM happy WHERE upNo=?";
	         
	         stmt = con.prepareStatement(sql);
	         stmt.setInt(1, dto.getUpNo());
	         rs = stmt.executeQuery();
	            
	         while(rs.next()){
	            count = rs.getInt("count(*)");
	         }
	      }
	      
	      catch(Exception err){
	         System.out.println("showCount : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt, rs);
	      }
	      return count;
	      
	   }   
	
	public Vector selectSmile(){
		Vector v = new Vector();
		String sql = null;
		
		try{
			con = pool.getConnection();
			sql = "select c.upno, c.img_route, c.regdate, c.subject, count(h.upno) as count " +
					"from content c, happy h where c.regdate >= (select max(regdate) from contest_topic) and c.upno = h.upno group by h.upno order by count desc limit 3";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				ContentDto content = new ContentDto();
				
				content.setUpNo(rs.getInt("upno"));
				content.setImg_route(rs.getString("img_route"));
				content.setRegdate(rs.getString("regdate"));
				content.setSubject(rs.getString("subject"));
				content.setCount(rs.getInt("count"));
				
				v.add(content);
			}
			
		}
		catch(Exception err){
			System.out.println("" + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return v;
	}
	
	public Vector<HappyDto> SelectHappy(){
		Vector<HappyDto> happy_vector = new Vector<HappyDto>();
		String smile = null;
		String sql = null;
		
		try{
			con = pool.getConnection();
			sql = "select * from happy";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				HappyDto dto = new HappyDto();
				
				dto.setSmile(rs.getString("smile"));
				dto.setUpNo(rs.getInt("UpNo"));
				
				happy_vector.add(dto);
			}
			
		}
		catch(Exception err){
			System.out.println("SelectHappy" + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return happy_vector;
	}
	
}
