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
			con = pool.getConnection();
			sql = "select *,DATE_FORMAT(regdate, '%y-%m-%d') from content where id=? order by regdate desc";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			
			while(rs.next()){
				ContentDto dto = new ContentDto();
				
				dto.setUpNo(rs.getInt("upNo"));
				dto.setImg_route(rs.getString("img_route"));
				dto.setRegdate(rs.getString("DATE_FORMAT(regdate, '%y-%m-%d')"));
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
			con = pool.getConnection();
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
			con = pool.getConnection();
			sql = "select *,DATE_FORMAT(regdate, '%y-%m-%d') from content c, friends f where privacy = 'friends' and ((f.get_id = ? and c.id = f.send_id) or (f.send_id = ? and c.id = f.get_id)) order by regdate desc";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, id);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				ContentDto dto = new ContentDto();
				
				dto.setUpNo(rs.getInt("upNo"));
				dto.setImg_route(rs.getString("img_route"));
				dto.setRegdate(rs.getString("DATE_FORMAT(regdate, '%y-%m-%d')"));
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
			con = pool.getConnection();
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
			con = pool.getConnection();
			sql = "select *,DATE_FORMAT(regdate, '%y-%m-%d') from content where privacy = 'contest' and regdate>=(select max(regdate) from contest_topic) order by regdate desc";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				ContentDto dto = new ContentDto();
				
				dto.setUpNo(rs.getInt("upNo"));
				dto.setImg_route(rs.getString("img_route"));
				dto.setRegdate(rs.getString("DATE_FORMAT(regdate, '%y-%m-%d')"));
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
			con = pool.getConnection();
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
	
	// 마이페이지에 리플 불러오는 쿼리
		public Vector selectReply(Mypage_replyDto dto){
			Vector v = new Vector();
			String sql = null;
			
			try{
				con = pool.getConnection();
				sql = "select *,DATE_FORMAT(regdate, '%y-%m-%d') from reply where upNo = ? order by regdate desc";
				
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, dto.getUpNo());
				rs = stmt.executeQuery();
				
				while(rs.next()){
					Mypage_replyDto dto2 = new Mypage_replyDto();
					
					dto2.setId(rs.getString("id"));
					dto2.setRe(rs.getString("re"));
					dto2.setRegdate(rs.getString("DATE_FORMAT(regdate, '%y-%m-%d')"));
					dto2.setUpNo(rs.getInt("upNo"));
					dto2.setName(rs.getString("name"));
					
					v.add(dto2);
				}
			}
			catch(Exception err){
				System.out.println("selectReply : " + err);
			}
			finally{
				pool.freeConnection(con, stmt, rs);
			}
			return v;
		}

		
		// 자랑하기 리플 전송
		public void InsertContestReply(Contest_replyDto dto){
			String sql = null;
			try{
				con = pool.getConnection();
				sql = "insert into reply_contest(id, regdate, re, upNo, name) values(?, now(), ?, ?, ?)";
				
				stmt = con.prepareStatement(sql);
				stmt.setString(1, dto.getId());
				stmt.setString(2, dto.getRe());
				stmt.setInt(3, dto.getUpno());
				stmt.setString(4, dto.getName());
				
				stmt.executeUpdate();
				
			}
			catch(Exception err){
				System.out.println("ContestDao InsertContestReply : " + err);
			}
			finally{
				pool.freeConnection(con, stmt, rs);
			}
		}
				
				
		// 자랑하기 리플 불러오기
		public Vector SelectContestReply(Contest_replyDto dto){
			Vector v = new Vector();
			String sql = null;
			
			try{
				con = pool.getConnection();
				sql = "select *,DATE_FORMAT(regdate, '%y-%m-%d') from reply_contest where upNo = ? order by regdate desc";
				
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, dto.getUpno());
				rs = stmt.executeQuery();
				
				while(rs.next()){
					dto = new Contest_replyDto();
					
					dto.setId(rs.getString("id"));
					dto.setRegdate(rs.getString("DATE_FORMAT(regdate, '%y-%m-%d')"));
					dto.setRe(rs.getString("re"));
					dto.setUpno(rs.getInt("upNo"));
					dto.setName(rs.getString("name"));
					dto.setGet_id(rs.getString("get_id"));
					dto.setRe_no(rs.getInt("re_no"));
					
					v.add(dto);	
				}
			}
			catch(Exception err){
				System.out.println("replySelectContest : " + err);
			}
			finally{
				pool.freeConnection(con, stmt, rs);
			}
			return v;
		}
				
		
		//마이페이지 글 삭제
	      public void deleteMypage(int num){
	         try{
	        	 con = pool.getConnection();
	            String sql ="delete from content where upno=?";
	            
	            stmt = con.prepareStatement(sql);
	            stmt.setInt(1, num);
	            stmt.executeUpdate();
	         }
	         catch(Exception err){
	            System.out.println("deleteMypage : " + err);
	         }
	         finally{
	            pool.freeConnection(con, stmt, rs);
	         }
	      }
	      
	      
	      // 공개설정 확인
	      public String SelectPrivacy(int upNo){
	    	  String sql = null;
	    	  String privacy = null;
				
				try{
					con = pool.getConnection();
					sql = "select privacy from content where upNo = ?";
					
					stmt = con.prepareStatement(sql);
					stmt.setInt(1, upNo);
					rs = stmt.executeQuery();
					
					while(rs.next()){
						privacy = rs.getString("privacy");
					}
				}
				catch(Exception err){
					System.out.println("ContentDao SelectPrivacy : " + err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return privacy;
	      }
	      
	      
	      // 공개설정 변경
	      public void ChangePrivacy(String privacy, int upNo){
		         try{
		        	 con = pool.getConnection();
		            String sql ="update content set privacy=? where upNo=?;";
		            
		            stmt = con.prepareStatement(sql);
		            stmt.setString(1, privacy);
		            stmt.setInt(2, upNo);
		            stmt.executeUpdate();
		         }
		         catch(Exception err){
		            System.out.println("ContentDao ChangePrivacy : " + err);
		         }
		         finally{
		            pool.freeConnection(con, stmt, rs);
		         }
	      }
	      
}
