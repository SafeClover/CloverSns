package login_reg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
			String sql = "INSERT INTO member(mem_id, mem_pw, mem_name, mem_birth, mem_email, mem_gender, mem_regDate) "
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

			if(rs.next()){ //해당 아이디가 있을 때
				if(!mem_pw.equals(rs.getString("mem_pw"))){	// 아이디와 비밀번호가 일치하지 않을 때
					confirm = "false";
				}
				else{
					confirm = "true";
				}
				
			}else{	
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

}
