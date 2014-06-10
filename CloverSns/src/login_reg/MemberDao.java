package login_reg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import clover.db.DBConnectionMgr;

public class MemberDao {
	
	   private Connection con = null;
	   private PreparedStatement stmt = null;
	   private ResultSet rs = null;
	   private DBConnectionMgr pool = null;
	
	public MemberDao(){
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DB 연결 실패");
		}
		
	}

	
	public void MemberInsert(MemberDto dto){
		try{
			String sql = "INSERT INTO member(mem_id, mem_pw, mem_name, mem_birth, mem_email, mem_gender, regDate) "
					+"VALUES(?,?,?,?,?,?,now())";

			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getMem_id());
			stmt.setString(2, dto.getMem_pw());
			stmt.setString(3, dto.getMem_name());
			stmt.setString(4, dto.getMem_birth());
			stmt.setString(5, dto.getMem_email());
			stmt.setString(6, dto.getMem_gender());
			
			stmt.executeUpdate();
			
			System.out.println("회원가입 성공");
			
			}
		catch(Exception err){
			System.out.println("MemberInsert() : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		
	}
	
	public String LoginConfirm(String mem_id, String mem_pw){
		String confirm = null;

		try{
			
			String sql = "select mem_pw from member where mem_id=?";

			stmt = con.prepareStatement(sql);
			stmt.setString(1, mem_id);
			
			rs = stmt.executeQuery();

			if(rs.next()){ // 해당 아이디가 있을 때
				if(!mem_pw.equals(rs.getString("mem_pw"))){	// 아이디는 있는데 아이디와 비밀번호가 일치하지 않을 때
					confirm = "false";
				}
				else{	// 아이디가 있고 아이디와 비밀번호가 일치 할 때 
					confirm = "true";
				}
				
			}else{	// 해당 아이디가 없을 때
				confirm = "no id";
			}

		}
		catch(Exception err){
			System.out.println("LoginConfirm : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return confirm;
	}
	
	
	public Vector<MemberDto> MemberList(){
		Vector<MemberDto> mem_list = new Vector<MemberDto>();
      
		try{
			String sql = "select mem_id from member";
			 
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			 
			while(rs.next()){
				MemberDto mem_dto = new MemberDto();
				mem_dto.setMem_id(rs.getString("mem_id"));
				mem_list.add(mem_dto);
			}
			
		}
		catch(Exception err){
			System.out.println("MemberList : " + err);
		}
		  
		return mem_list;
	}
	
	
	public MemberDto MemberSelect(String id){
		MemberDto dto = new MemberDto();
		try{
			String sql = "select * from member where mem_id=?";
			 
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			 
			while(rs.next()){
				dto.setMem_regDate(rs.getString("regdate"));
			}
			
		}
		catch(Exception err){
			System.out.println("MemberSelect : " + err);
		}
		
		return dto;
		
	}

	
	
	public Vector<MemberDto> SearchFriends(String keyword){
	      Vector<MemberDto> v = new Vector<MemberDto>();
	      try{
	         //keyword가 null값인지 확인
	         String sql = "select mem_name, mem_id from member where mem_name like '%"+keyword+"%' and mem_id != 'admin'";
	         
	         stmt = con.prepareStatement(sql);

	         
	         rs = stmt.executeQuery();
	         int size = getResultSetSize(rs);
	         if(size == 0){
	            return null;
	         }else{
	            int i = 0;
	            while(rs.next()){
	               MemberDto dto = new MemberDto();
	                  dto.setMem_name(rs.getString("mem_name"));
	                  dto.setMem_id(rs.getString("mem_id"));
	                  v.add(dto);
	                  i++;
	               }
	            return v;
	         }
	      }
	      catch(Exception err){
	         System.out.println("LoginConfirm : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt, rs);
	      }
	      return null;
	        
	      
	   }
	   
	   public static int getResultSetSize(ResultSet resultSet) { //resultset size 리턴하는 메서드
	       int size = -1;

	       try {
	           resultSet.last(); 
	           size = resultSet.getRow();
	           resultSet.beforeFirst();
	       } catch(SQLException e) {
	           return size;
	       }

	       return size;
	   }
	   
	   public void friendRequest(String id_get, String id_req){ //친구신청
	      System.out.println(id_get+","+id_req);
	      try{
	         String sql = "INSERT INTO alarm(get_id, send_id) "
	               +"VALUES(?, ?)";

	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, id_get);
	         stmt.setString(2, id_req);
	         stmt.executeUpdate();
	         
	         System.out.println("친구신청완료");
	         
	         }
	      catch(Exception err){
	         System.out.println("AlarmInsert() : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt, rs);
	      }
	   }
	   
	   public Vector getFriendAlarm(String get_id){
	      Vector v = new Vector();
	      try{
	         String sql = "select send_id from alarm where get_id=?";
	         
	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, get_id);
	         rs = stmt.executeQuery();
	         
	         while(rs.next()){
	            v.add(rs.getString("send_id"));
	            
	         }
	         
	      }
	      catch(Exception err){
	         System.out.println("getFriendAlarm : " + err);
	      }finally{
	         pool.freeConnection(con, stmt, rs);
	      }
	      return v;
	   }
	   
	   public void FriendInsert(String send_id, String get_id){   //친구 수락 후 친구목록에 추가
	      try{
	         String sql = "INSERT INTO friends(get_id, send_id) "+"VALUES(?,?)";

	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, get_id);
	         stmt.setString(2, send_id);
	         stmt.executeUpdate();
	         System.out.println("친구신청완료");
	         
	         sql = "delete from alarm where send_id=? and get_id=?";
	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, send_id);
	         stmt.setString(2, get_id);
	         stmt.executeUpdate();
	         
	         System.out.println("알람 삭제 완료");
	         
	         }
	      catch(Exception err){
	         System.out.println("FriendInsert() : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt, rs);
	      }
	   }
	
	public void InfomationEdit(MemberDto dto){ //회원 정보 수정
		try{
			String sql = "UPDATE member SET mem_pw=?, mem_name=?, mem_birth=?, mem_email=?, mem_gender=?, mem_img=? where mem_id=?";

			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getMem_pw());
			stmt.setString(2, dto.getMem_name());
			stmt.setString(3, dto.getMem_birth());
			stmt.setString(4, dto.getMem_email());
			stmt.setString(5, dto.getMem_gender());
			stmt.setString(6, dto.getMem_img());
			stmt.setString(7, dto.getMem_id());
			
			stmt.executeUpdate();

			}
		catch(Exception err){
			System.out.println("FriendInsert() : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	}


}
