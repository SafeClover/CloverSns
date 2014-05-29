package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import clover.db.DBConnectionMgr;

public class QnaDao {
	private Connection con = null;
	   private PreparedStatement stmt = null;
	   private ResultSet rs = null;
	   private DBConnectionMgr pool = null;	
	
	public QnaDao(){
		try{
	  		pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}	
	
}
