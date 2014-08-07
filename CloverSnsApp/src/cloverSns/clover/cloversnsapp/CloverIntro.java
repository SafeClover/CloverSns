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
		requestWindowFeature(Window.FEATURE_NO_TITLE);// 타이틀바 없애기
		
		setContentView(R.layout.intro);

		h = new Handler();
		h.postDelayed(run, 2000); // 2초동안 인트로
		
		
	}

	Runnable run = new Runnable() {

		@Override
		public void run() {
			autoLogin();
			finish();
			// fade in으로 시작해서 fade out으로 인트로 화면이 끝남
			overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
		}
	};
	
	public void autoLogin(){
		SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
		autoId = prefs.getString("autoId", "");
		
		System.out.println("뭐냐고 !!! " + autoId + ", " + prefs.getAll());
		
		if(!autoId.equals("")){
			finish();
			startActivity(new Intent(CloverIntro.this, MainFirst.class));
		}
		else if(autoId.equals("") || autoId.isEmpty()){
			finish();
			startActivity(new Intent(CloverIntro.this, MainActivity.class));
		}
	}
	
	// 인트로 화면 중간에 뒤로가기 버튼을 눌러서 꺼졌을 시 4초후 메인페이지가 뜨는 것을 방지
	@Override
	public void onBackPressed() {
		super.onBackPressed();
		h.removeCallbacks(run);
	}
}
