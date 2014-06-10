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
			System.out.println("DB���� ���� : " + err);
		}
	}
	
	// ���������� select ����
	public Vector getMypage(String id){
		Vector v = new Vector();
		String sql;
		try{
			sql = "select * from content where privacy = 'privacy' and id=?";
			
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
	
	// ���������� insert ����
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
	
	// �ƿ�Ŭ�ι� select ����
	public Vector getOurclover(){
		Vector v = new Vector();
		String sql;
		try{
			sql = "select * from content where privacy = 'friends'";
			
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
			System.out.println("getOurclover : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return v;
	}
	
	// �ƿ�Ŭ�ι� insert ����
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
	
	// �ڶ��ϱ� select ����
	public Vector getContest(){
		Vector v = new Vector();
		String sql;
		try{
			sql = "select * from content where privacy = 'contest'";
			
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
	
	// �ڶ��ϱ� insert ����
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
