package cloverSns.clover.cloversnsapp;

import java.util.ArrayList;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.clover.sns.MainFirst;
import com.example.cloversns.R;

public class MemberOut extends Activity {

	public MemOutAsyncTask memout;
	
	public LinearLayout mout;
	public EditText out_pw, out_pwCheck;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
		setContentView(R.layout.mem_out);
		
		out_pw = (EditText) findViewById(R.id.out_pw);
		out_pwCheck = (EditText) findViewById(R.id.out_pwCheck);
		
		mout = (LinearLayout) findViewById(R.id.mout);
		mout.setOnTouchListener(new OnTouchListener() {
			
			@Override
			public boolean onTouch(View v, MotionEvent event) {
				InputMethodManager imm = (InputMethodManager)getSystemService(Context.INPUT_METHOD_SERVICE);
				imm.hideSoftInputFromWindow(mout.getWindowToken(), 0);
				
				return false;
			}
		});
		
	}
	//탈퇴하기
	public void memOut(View v){
		if(out_pw.getText().toString().equals(out_pwCheck.getText().toString())){
			AlertDialog.Builder ab = new AlertDialog.Builder(MemberOut.this);
			ab.setMessage("탈퇴하시겠습니까?")
			.setCancelable(false)
			.setPositiveButton("예", 
			new DialogInterface.OnClickListener() {
				@Override
				public void onClick(DialogInterface dialog, int which) {
					// 자동로그인으로 저장된 아이디 비번 지우기
					SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
					SharedPreferences.Editor editor = prefs.edit();
					editor.clear();
					editor.remove("PreName");
					editor.commit();
					
					System.out.println("실행 되냐?");
					
					android.os.Process.killProcess(android.os.Process.myPid());
				}
			}).setNegativeButton("아니오", 
			new DialogInterface.OnClickListener() {
				@Override
				public void onClick(DialogInterface dialog, int which) {
					dialog.cancel();	
				}
			});
			AlertDialog alert = ab.create();
			alert.show();
		}
		else{
			Toast.makeText(MemberOut.this, "비밀번호를 다시 입력하여 주세요.", Toast.LENGTH_SHORT).show();
		}
	}
	//취소
	public void cancel(View v){
		startActivity(new Intent(getBaseContext(), MainFirst.class));
		finish();
	}
	
	public class MemOutAsyncTask extends AsyncTask<Void, String, Void>{

		@Override
		protected Void doInBackground(Void... params) {
			
			try{
				SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
				String outid = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();
				
				String url = "http://192.168.10.21:8080/CloverSns/android/android_member.jsp"; 
	
				HttpPost post = new HttpPost(url);
				
				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
				
				param.add(new BasicNameValuePair("outid", outid));
				
				UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
				post.setEntity(ent);
				
				client.execute(post);
			}
			catch(Exception err){
				err.printStackTrace();
			}
			
			
			return null;
		}
		
	}
	
}
