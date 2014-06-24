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
	
	// ������
	public FindIdPw(){}
	
	// ���̵� ã�� �޼���
	public String FindId(String name, String email){
		String id = null;
		ArrayList find = dao.FindIdPw();
		
		for(int i=0; i<find.size(); i++){
			dto = (MemberDto)find.get(i);
			if(name.equals(dto.getMem_name()) && email.equals(dto.getMem_email())){
				id = dto.getMem_id();
			}
		}
		
		return id;
	}
	
	// ��� ã�� �޼���
	public String FindPw(String id, String email){
		String pw = null;
		ArrayList find = dao.FindIdPw();
		
		for(int i=0; i<find.size(); i++){
			dto = (MemberDto) find.get(i);
			
			// �Է��� ���̵�� ������ ��� ������ ����
			if(id.equals(dto.getMem_id()) && email.equals(dto.getMem_email())){
				String rndpw = RandomPw();
				pw = rndpw;
			}
		}
		
		return pw;
	}
	
	// 12�ڸ��� �ӽú�й�ȣ ���� �߻� �޼���
	public String RandomPw(){
		String rndpw = "";
		int rnd = 0;
		
		for(int i=0; i<12; i++){
			rnd = (int)(Math.random() * 10);
			if(rnd < 10){
				rndpw += rnd;
			}
		}
		TmpPwMailService tpms = new TmpPwMailService(); // ��й�ȣ ���� ������ Ŭ����
		tpms.SendEmail(dto.getMem_email(), rndpw); // �̸����̶� ��� ������
		
		Encrypt encrypt = new Encrypt();
		rndpw = encrypt.encrypt(rndpw); // �ӽ� ��й�ȣ ��ȣȭ ��Ŵ
		dao.UpdatePw(rndpw, dto.getMem_email()); // �ӽ� ��й�ȣ db�� update ������
		
		return rndpw;
	}	
}
