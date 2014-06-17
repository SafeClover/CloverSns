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
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	public void insertHappy(HappyDto dto){
		try{
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
			sql = "SELECT count(*) FROM happy WHERE upNo=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, dto.getUpNo());
			rs = stmt.executeQuery();
				
			while(rs.next()){
				count = rs.getInt("count(*)");
				System.out.println("count : " + count);
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
	
	public String selectSmile(HappyDto dto){
		String smile = null;
		String sql = null;
		
		try{
			sql = "select smile from happy where smile=? and upNo=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getSmile());
			stmt.setInt(2, dto.getUpNo());
			rs = stmt.executeQuery();
			
			while(rs.next()){				
				smile = rs.getString("smile");
			}
			
		}
		catch(Exception err){
			System.out.println("" + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return smile;
	}
	
	
	public Vector<HappyDto> SelectHappy(){
		Vector<HappyDto> happy_vector = new Vector<HappyDto>();
		String smile = null;
		String sql = null;
		
		try{
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
			System.out.println("" + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return happy_vector;
	}
}
