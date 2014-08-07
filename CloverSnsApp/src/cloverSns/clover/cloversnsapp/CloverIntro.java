package cloverSns.clover.cloversnsapp;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.view.Window;

import com.clover.sns.MainFirst;
import com.example.cloversns.R;

public class CloverIntro extends Activity {
	
	Handler h;
	String autoId = null;
	String autoPw = null;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);// Ÿ��Ʋ�� ���ֱ�
		
		setContentView(R.layout.intro);

		h = new Handler();
		h.postDelayed(run, 2000); // 2�ʵ��� ��Ʈ��
		
		
	}

	Runnable run = new Runnable() {

		@Override
		public void run() {
			autoLogin();
			finish();
			// fade in���� �����ؼ� fade out���� ��Ʈ�� ȭ���� ����
			overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
		}
	};
	
	public void autoLogin(){
		SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
		autoId = prefs.getString("autoId", "");
		
		System.out.println("���İ� !!! " + autoId + ", " + prefs.getAll());
		
		if(!autoId.equals("")){
			finish();
			startActivity(new Intent(CloverIntro.this, MainFirst.class));
		}
		else if(autoId.equals("") || autoId.isEmpty()){
			finish();
			startActivity(new Intent(CloverIntro.this, MainActivity.class));
		}
	}
	
	// ��Ʈ�� ȭ�� �߰��� �ڷΰ��� ��ư�� ������ ������ �� 4���� ������������ �ߴ� ���� ����
	@Override
	public void onBackPressed() {
		super.onBackPressed();
		h.removeCallbacks(run);
	}
}
