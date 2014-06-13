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
			System.out.println("DB ���� ����");
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
			
			System.out.println("ȸ������ ����");
			
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

			if(rs.next()){ // �ش� ���̵� ���� ��
				if(!mem_pw.equals(rs.getString("mem_pw"))){	// ���̵�� �ִµ� ���̵�� ��й�ȣ�� ��ġ���� ���� ��
					confirm = "false";
				}
				else{	// ���̵� �ְ� ���̵�� ��й�ȣ�� ��ġ �� �� 
					confirm = "true";
				}
				
			}else{	// �ش� ���̵� ���� ��
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
				dto.setMem_name(rs.getString("mem_name"));
			}
			
		}
		catch(Exception err){
			System.out.println("MemberSelect : " + err);
		}
		
		return dto;
		
	}

	
	
	public Vector<MemberDto> SearchFriends(String keyword, String id){
	      Vector<MemberDto> v = new Vector<MemberDto>();
	     
	      Vector total = new Vector();
	      
	      try{
	    	  //�����ڿ� �ڱ��ڽ� ���� �˻�
	         String sql = "select mem_name, mem_id, mem_img from member where mem_name like '%"+keyword+"%' and mem_id != 'admin' and mem_id != ?";
	         
	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, id);
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
	                  dto.setMem_img(rs.getString("mem_img"));
	                  v.add(dto);
	                  i++;
	                  
	               }
	         }
	         System.out.println("�˻��� ���̵� ���� : "+v.size());
	         int count =0;
	         for(int i = 0; i<v.size();i++){
	        	 Vector list = new Vector();
	        	 MemberDto dto =v.get(i);
	        	 count++;
	        	 String list_id = dto.getMem_id();
	        	
	        	 //�̹� ģ�� ���� �˻�
		         sql="select count(get_id) from friends where (send_id=? or get_id=?) and (send_id=? or get_id=?)";
		         stmt = con.prepareStatement(sql);
		         stmt.setString(1, id);
		         stmt.setString(2, id);
		         stmt.setString(3, list_id);
		         stmt.setString(4, list_id);
		         rs = stmt.executeQuery();
		         rs.next();
		         int isfriend = rs.getInt(1);
		         System.out.println("isfriend"+isfriend);
		         
		         //�̹� ģ�� ��û������ �˻�
		         sql="select count(get_id) from alarm where (send_id=? or get_id=?) and (send_id=? or get_id=?)";
		         stmt = con.prepareStatement(sql);
		         stmt.setString(1, id);
		         stmt.setString(2, id);
		         stmt.setString(3, list_id);
		         stmt.setString(4, list_id);
		         rs = stmt.executeQuery();
		         rs.next();
		         int havealarm = rs.getInt(1);
		         System.out.println("havealarm : "+havealarm);
		         list.add(dto.getMem_id());
		         list.add(dto.getMem_name());
		         if(isfriend>0){ //ģ�� �϶�
		        	 list.add("3");
		         }
		         else if(havealarm>0){ //ģ�� ��û �˶��� ���� ���
		        	 list.add("2");
		         }
		         else{
		        	 list.add("1");
		         }
		         list.add(dto.getMem_img());
		         total.add(list);
	         }
	      }
	      catch(Exception err){
	         System.out.println("searchFriends : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt, rs);
	      }
	      System.out.println("�˻��� ���̵� ���� : " + total.size());
	      return total;
	        
	      
	   }
	   
	 public static int getResultSetSize(ResultSet resultSet) { //resultset size �����ϴ� �޼���
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
	   
	   public void friendRequest(String id_get, String id_req){ //ģ����û
		      System.out.println(id_get+","+id_req);
		      
		      
		      try{
		    	 String sql = "INSERT INTO alarm(get_id, send_id) "
		               +"VALUES(?, ?)";

		         stmt = con.prepareStatement(sql);
		         stmt.setString(1, id_get);
		         stmt.setString(2, id_req);
		         stmt.executeUpdate();
		         
		         System.out.println("ģ����û�Ϸ�");
		         
		         }
		      catch(Exception err){
		         System.out.println("AlarmInsert() : " + err);
		      }
		      finally{
		         pool.freeConnection(con, stmt, rs);
		      }
	   }
	   
	   public Vector getFriendAlarm(String get_id){	// ģ�� ��û �˸�
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
	   
	   public void FriendInsert(String send_id, String get_id){   //ģ�� ���� �� ģ����Ͽ� �߰�
		      try{
		         String sql = "INSERT INTO friends(get_id, send_id) "+"VALUES(?,?)";

		         stmt = con.prepareStatement(sql);
		         stmt.setString(1, get_id);
		         stmt.setString(2, send_id);
		         stmt.executeUpdate();
		         System.out.println("ģ����û�Ϸ�");
		         
		         sql = "delete from alarm where send_id=? and get_id=?";
		         stmt = con.prepareStatement(sql);
		         stmt.setString(1, send_id);
		         stmt.setString(2, get_id);
		         stmt.executeUpdate();
		         
		         System.out.println("�˶� ���� �Ϸ�");
		         
		         }
		      catch(Exception err){
		         System.out.println("FriendInsert() : " + err);
		      }
		      finally{
		         pool.freeConnection(con, stmt, rs);
		      }
		   }
	
	public void InfomationEdit(MemberDto dto){ //ȸ�� ���� ����
		try{
			String sql = "UPDATE member SET mem_pw=?, mem_img=?, mem_email=? where mem_id=?";

			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getMem_pw());
			stmt.setString(2, dto.getMem_img());
			stmt.setString(3, dto.getMem_email());
			stmt.setString(4, dto.getMem_id());
			
			stmt.executeUpdate();

			}
		catch(Exception err){
			System.out.println("FriendInsert() : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	}
	
	public Vector getMyfriends(String id){ //�� ģ�� �ҷ�����
		Vector<MemberDto> myfriends = new Vector<MemberDto>();
		try{
	         String sql = "select mem_img, mem_id, mem_name, mem_birth from member m, friends f where ((f.get_id=?) and (f.send_id=m.mem_id)) or ((f.send_id=?) and (f.get_id=m.mem_id))";
	         
	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, id);
	         stmt.setString(2, id);
	         rs = stmt.executeQuery();
	         int size = getResultSetSize(rs);
	         System.out.println("myfriends:"+size);
	         if(size == 0){
	            return null;
	         }else{
	            int i = 0;
	            while(rs.next()){
	            	  MemberDto dto = new MemberDto();
	                  dto.setMem_img(rs.getString("mem_img"));
	                  dto.setMem_id(rs.getString("mem_id"));
	                  dto.setMem_name(rs.getString("mem_name"));
	                  dto.setMem_birth(rs.getString("mem_birth"));
	                  myfriends.add(dto);
	                  i++;
	               }
	         }
	         
	      }
	      catch(Exception err){
	         System.out.println("myfriends : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt, rs);
	      }
		return myfriends;
	}
	
	public Vector getInfo(MemberDto dto){
		Vector v = new Vector();
		try{
	         String sql = "select * from member where mem_id = ?";
	         
	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, dto.getMem_id());
	         rs = stmt.executeQuery();
	         
            while(rs.next()){
                  
            	  dto.setMem_id(rs.getString("mem_id"));
            	  dto.setMem_name(rs.getString("mem_name"));
            	  dto.setMem_birth(rs.getString("mem_birth"));
            	  dto.setMem_email(rs.getString("mem_email"));
            	  dto.setMem_gender(rs.getString("mem_gender"));
            	  dto.setMem_img(rs.getString("mem_img"));
            	  
                  v.add(dto);
            }
            
		 }	
	      catch(Exception err){
	         System.out.println("myfriends : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt, rs);
	      }
		return v;
	}


}
