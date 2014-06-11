package content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import login_reg.MemberDao;
import login_reg.MemberDto;
import clover.db.DBConnectionMgr;

public class ContentDao {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DBConnectionMgr pool = null;	
	
	public ContentDao(){
		try{
	  		pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	// 마이페이지 select 쿼리
	public Vector getMypage(String id){
		Vector v = new Vector();
		String sql;
		try{
			sql = "select * from content where privacy = 'privacy' and id=? order by regdate desc";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			
			while(rs.next()){
				ContentDto dto = new ContentDto();
				
				dto.setUpNo(rs.getInt("upNo"));
				dto.setImg_route(rs.getString("img_route"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrivacy(rs.getString("privacy"));
				
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getMypage : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return v;
	}
	
	// 마이페이지 insert 쿼리
	public void insertMypage(ContentDto dto){
		String sql = "insert into content(img_route, regdate, subject, id, name, content, privacy)" +
				"values(?,now(),?,?,?,?,?)";
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
			System.out.println("insertMypage : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	}
	
	// 아워클로버 select 쿼리
	public Vector getOurclover(String id){
		Vector v = new Vector();
		String sql;
		try{
			sql = "select * from content c, friends f where privacy = 'friends' and ((f.get_id = ? and c.id = f.send_id) or (f.send_id = ? and c.id = f.get_id)) order by regdate desc";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, id);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				ContentDto dto = new ContentDto();
				
				dto.setUpNo(rs.getInt("upNo"));
				dto.setImg_route(rs.getString("img_route"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrivacy(rs.getString("privacy"));
				
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getOurclover : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return v;
	}
	
	// 아워클로버 insert 쿼리
	public void insertOurclover(ContentDto dto){
		String sql = "insert into content(img_route, regdate, subject, id, name, content, privacy)" +
				"values(?,now(),?,?,?,?,?)";
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
		System.out.println("insertOurclover : " + err);
		}
		finally{
		pool.freeConnection(con, stmt, rs);
		}
	}
	
	// 자랑하기 select 쿼리
	public Vector getContest(){
		Vector v = new Vector();
		String sql;
		try{
			sql = "select * from content where privacy = 'contest' order by regdate desc";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				ContentDto dto = new ContentDto();
				
				dto.setUpNo(rs.getInt("upNo"));
				dto.setImg_route(rs.getString("img_route"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrivacy(rs.getString("privacy"));
				
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getContest : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return v;
	}
	
	// 자랑하기 insert 쿼리
	public void insertContest(ContentDto dto){
		String sql = "insert into content(img_route, regdate, subject, id, name, content, privacy)" +
							"values(?,now(),?,?,?,?,?)";
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
			System.out.println("insertContest : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	}
}
