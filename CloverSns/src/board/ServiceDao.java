package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import clover.db.DBConnectionMgr;

public class ServiceDao {
   private Connection con = null;
   private PreparedStatement stmt = null;
   private ResultSet rs = null;
   private DBConnectionMgr pool = null;

   public ServiceDao(){
      try{
  		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();

      }
      catch(Exception err){
         System.out.println("DB���� ���� : " + err);
      }
   }


   // �� ����Ʈ ��������(list.jsp)
   public Vector getQuestionList(String keyField, String keyWord){
      Vector v = new Vector();
      String sql;
      try{
         if(keyWord == null || keyWord.isEmpty() || keyWord.equals("null")){
            sql = "select * from service where division = 'question' order by pos";
         }
         else{
            sql = "select * from service where " + keyField + 
               " like '%" + keyWord + "%' order by pos";
         }


         stmt = con.prepareStatement(sql);
         rs = stmt.executeQuery();


         while(rs.next()){
            ServiceDto dto = new ServiceDto();
            dto.setBoardUpNo(rs.getInt("boardUpNo"));
            dto.setBoardContent(rs.getString("boardContent"));
            dto.setCount(rs.getInt("count"));
            dto.setDepth(rs.getInt("depth"));
            dto.setId(rs.getString("id"));
            dto.setPos(rs.getInt("pos"));
            dto.setPw(rs.getString("pw"));
            dto.setTitle(rs.getString("title"));
            dto.setDivision(rs.getString("division"));
            dto.setRegDate(rs.getString("regdate"));
            
            v.add(dto);
         }
      }
      catch(Exception err){
         System.out.println("getQuestionList : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);
      }

      return v;
   }
   
   public Vector getNoticeList(String keyField, String keyWord){
	      Vector v = new Vector();
	      String sql;
	      try{
	         if(keyWord == null || keyWord.isEmpty() || keyWord.equals("null")){
	            sql = "select * from service where division = 'notice' order by pos";
	         }
	         else{
	            sql = "select * from service where " + keyField + 
	               " like '%" + keyWord + "%' order by pos";
	         }


	         stmt = con.prepareStatement(sql);
	         rs = stmt.executeQuery();


	         while(rs.next()){
	            ServiceDto dto = new ServiceDto();
	            dto.setBoardUpNo(rs.getInt("boardUpNo"));
	            dto.setBoardContent(rs.getString("boardContent"));
	            dto.setCount(rs.getInt("count"));
	            dto.setDepth(rs.getInt("depth"));
	            dto.setId(rs.getString("id"));
	            dto.setPos(rs.getInt("pos"));
	            dto.setPw(rs.getString("pw"));
	            dto.setTitle(rs.getString("title"));
	            dto.setDivision(rs.getString("division"));
	            dto.setRegDate(rs.getString("regdate"));
	            
	            v.add(dto);
	         }
	      }
	      catch(Exception err){
	         System.out.println("getNoticeList : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt, rs);;
	      }

	      return v;
	   }
   
   // �� �����ϱ�
   public void updatePos(Connection con){
      try{
         String sql = "update service set pos = pos + 1";
         stmt = con.prepareStatement(sql);
         stmt.executeUpdate();
      }
      catch(Exception err){
         System.out.println("updatePos : " + err);
      }
   }
   
   // �������� insert
   public void insertNotice(ServiceDto dto){
		String sql = "INSERT INTO service(title, boardContent, regDate, count, pos, division) VALUES(?, ?, now(), 0, 0, ?)";
		try{
			updatePos(con);
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getTitle());
			stmt.setString(2, dto.getBoardContent());
			stmt.setString(3, dto.getDivision());
			
			stmt.executeUpdate();
			
		}
		catch(Exception err){
			System.out.println("insertNotice : " + err);
		}
	}
   
   // ���ǰԽ��� insert
   public void insertQuestion(ServiceDto dto){
      String sql = "insert into service(title, id, boardContent, regDate, "
         + "count, pos, depth, pw, division) "
         + "values(?,?,?,now(),?,?,?,?,?)";


      try{
         updatePos(con);
         stmt = con.prepareStatement(sql);
         stmt.setString(1, dto.getTitle());
         stmt.setString(2, dto.getId());
         stmt.setString(3, dto.getBoardContent());
         stmt.setInt(4, dto.getCount());
         stmt.setInt(5, dto.getPos());
         stmt.setInt(6, dto.getDepth());
         stmt.setString(7, dto.getPw());
         stmt.setString(8,dto.getDivision());

         stmt.executeUpdate();
      }
      catch(Exception err){
         System.out.println("insertQuestion : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);;
      }
   }
   
   
   
   // �� ���� ����(read.jsp, update.jsp)
   public ServiceDto getBoard(int num){
      ServiceDto dto = new ServiceDto();
      String sql = "";
      try{        
         
         sql = "update service set count=count+1 where boardUpNo = ?";
         stmt = con.prepareStatement(sql);
         stmt.setInt(1, num);
         stmt.executeUpdate();
         
         sql = "select * from service where boardUpNo = ?";
         stmt = con.prepareStatement(sql);
         stmt.setInt(1, num);
         rs = stmt.executeQuery();
         
         if(rs.next()){
        	 dto.setBoardUpNo(rs.getInt("boardUpNo"));
             dto.setBoardContent(rs.getString("boardContent"));
             dto.setCount(rs.getInt("count"));
             dto.setDepth(rs.getInt("depth"));
             dto.setId(rs.getString("id"));
             dto.setPos(rs.getInt("pos"));
             dto.setPw(rs.getString("pw"));
             dto.setTitle(rs.getString("title"));
             dto.setRegDate(rs.getString("regDate"));
         }
      }
      catch(Exception err){
         System.out.println("getBoard : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);;
      }
      return dto;
   }
   
   // �� ����(UpdateProc.jsp)
   public void updateBoard(ServiceDto dto){
      try{
         String sql = "update service set id=?, title=?, boardContent=? where boardUpNo=?";
         stmt = con.prepareStatement(sql);
         stmt.setString(1, dto.getId());
         stmt.setString(2, dto.getTitle());
         stmt.setString(3, dto.getBoardContent());
         stmt.setInt(4, dto.getBoardUpNo());
         stmt.executeUpdate();
      }
      catch(Exception err){
         System.out.println("updateBoard : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);;
      }
   }
   
   // �� ����
   public void deleteBoard(int num){
      try{
         String sql = "delete from service where boardUpNo=?";
         stmt = con.prepareStatement(sql);
         stmt.setInt(1, num);
         stmt.executeUpdate();
      }
      catch(Exception err){
         System.out.println("deleteBoard : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);;
      }
   }
   
   // �亯 �ޱ�
   // �θ���� �������� �޼���
   public void replyUpdatePos(ServiceDto dto){
      try{
         String sql = "update service set pos=pos+1 where pos>? and division='question'";
         stmt = con.prepareStatement(sql);
         stmt.setInt(1, dto.getPos());
         
         stmt.executeUpdate();
         
      }
      catch(Exception err){
         System.out.println("replyUpdatePos : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);;
      }
   }
   
// ���� ������ �亯��
   public void replyBoard(ServiceDto dto) {
      try {
         String sql = "insert into service(title, id, boardContent, regDate, "
               + "count, pos, depth, pw, division) " + "values(?,?,?,now(),?,?,?,?,'question')";
         
         stmt = con.prepareStatement(sql);
         stmt.setString(1, dto.getTitle());
         stmt.setString(2, dto.getId());
         stmt.setString(3, dto.getBoardContent());
         stmt.setInt(4, dto.getCount());
         stmt.setInt(5, dto.getPos() + 1);
         stmt.setInt(6, dto.getDepth() + 1);
         stmt.setString(7, dto.getPw());
         
         stmt.executeUpdate();
         
      } catch (Exception err) {
         System.out.println("replyBoard : " + err);
      } finally {
         pool.freeConnection(con, stmt, rs);;
      }
   }
   
   // �鿩 ����
   public String useDepth(int depth){
      String result = "";
      for(int i=0; i<depth*3; i++){
         result += "&nbsp;";
      }
      return result;
   }
}