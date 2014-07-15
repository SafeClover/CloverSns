package contest.el;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import content.ContentDto;
import clover.db.DBConnectionMgr;

public class ContestDao {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DBConnectionMgr pool = null;	
	
	public ContestDao(){
		try{
	  		pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	public void changeTopic(String topic){	//주제 변경하기
		System.out.println("dao:"+topic);
		String sql = "insert into contest_topic(topic, regdate)" +
				"values(?,now())";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, topic);
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("changeTopic : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	}
	
	public String topic(){ //콘테스트 주제 가져오기
		String sql;
		String topic = null;
		try{
			con = pool.getConnection();
			sql = "select topic from contest_topic where regdate=(select max(regdate) from contest_topic)";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				topic = rs.getString(1);
			}
			return topic;
		}
		catch(Exception err){
			System.out.println("topic : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return null;
	}
}
