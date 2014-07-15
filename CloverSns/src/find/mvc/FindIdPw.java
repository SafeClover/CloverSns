package find.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import com.mysql.fabric.Response;

import login_reg.Encrypt;
import login_reg.MemberDao;
import login_reg.MemberDto;

public class FindIdPw extends HttpServlet{
	MemberDto dto = new MemberDto();
	MemberDao dao = new MemberDao();
	
	// 생성자
	public FindIdPw(){}
	
	// 아이디 찾는 메서드
	public String FindId(String name, String email){
		String id = null;
		ArrayList find = dao.FindIdPw();
		
		for(int i=0; i<find.size(); i++){
			dto = (MemberDto)find.get(i);
			if(name.equals(dto.getMem_name()) && email.equals(dto.getMem_email())){
				id = dto.getMem_id();
			}
		}
		System.out.println("id : " + id);
		return id;
	}
	
	// 비번 찾는 메서드
	public String FindPw(String id, String email){
		String pw = null;
		ArrayList find = dao.FindIdPw();
		
		for(int i=0; i<find.size(); i++){
			dto = (MemberDto) find.get(i);
			
			// 입력한 아이디와 메일이 모두 같으면 실행
			if(id.equals(dto.getMem_id())){
				if(email.equals(dto.getMem_email())){					
					System.out.println("id1 : " + dto.getMem_id());
					System.out.println("email1 : " + dto.getMem_email());
					String rndpw = RandomPw(dto.getMem_email());
					pw = rndpw;
				}
				else{
					System.out.println("id2 : " + dto.getMem_id());
					System.out.println("email2 : " + dto.getMem_email());
					
					pw = "false";
				}
			}
		}
		
		return pw;
	}
	
	// 12자리의 임시비밀번호 난수 발생 메서드
	public String RandomPw(String email){
		String rndpw = "";
		int rnd = 0;
		
		for(int i=0; i<12; i++){
			rnd = (int)(Math.random() * 10);
			if(rnd < 10){
				rndpw += rnd;
			}
		}
		TmpPwMailService tpms = new TmpPwMailService(); // 비밀번호 메일 보내는 클래스
		tpms.SendEmail(email, rndpw); // 이메일이랑 비번 보내줌
		
		Encrypt encrypt = new Encrypt();
		rndpw = encrypt.encrypt(rndpw); // 임시 비밀번호 암호화 시킴
		dao.UpdatePw(rndpw, email); // 임시 비밀번호 db에 update 시켜줌
		
		return rndpw;
	}	
}
