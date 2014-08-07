package cloverSns.clover.cloversnsapp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.clover.function.LoadingProgressbar;
import com.example.cloversns.R;

public class MainActivity extends ActionBarActivity {
	
	public LoginAsyncTask loginAsyncTask;
	
	public LinearLayout main_layout;
	public EditText login_id, login_pw;
	
	public String line = null;
	public String page = "";
	
	public SharedPreferences prefs;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_main);
		//getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
		
		main_layout = (LinearLayout) findViewById(R.id.main_layout);
		login_id = (EditText) findViewById(R.id.et_id);
		login_pw = (EditText) findViewById(R.id.et_pw);
		
		main_layout.setOnTouchListener(new OnTouchListener() {
			
			@Override
			public boolean onTouch(View v, MotionEvent event) {
				InputMethodManager imm = (InputMethodManager)getSystemService(Context.INPUT_METHOD_SERVICE);
				imm.hideSoftInputFromWindow(main_layout.getWindowToken(), 0);
				return false;
			}
		});		
	}
	
	public void onLogin(View v){		
		autoLogin();
		loginAsyncTask = new LoginAsyncTask();
		loginAsyncTask.execute();
		
		if("true".equals(page)){
			startActivity(new Intent(getBaseContext(), LoadingProgressbar.class));
		}
		else if(page.equals(null)){
			Toast.makeText(getBaseContext(), "입력하여 주세요.", Toast.LENGTH_SHORT).show();			
		}
		else if("false".equals(page)){
			Toast.makeText(getBaseContext(), "비밀번호가 틀렸습니다.", Toast.LENGTH_SHORT).show();
		}
		else if("no id".equals(page)){
			Toast.makeText(getBaseContext(), "아이디가 틀렸습니다.", Toast.LENGTH_SHORT).show();
		}
	}
	
	
	// 회원 가입
	public void onSignin(View v){
		finish();
		Intent intent = new Intent(getBaseContext(), CloverRegistration.class);
		startActivity(intent);
	}
	
	// 자동 로그인 autoLogin	
	public void autoLogin(){
		prefs = getSharedPreferences("PreName", MODE_PRIVATE);
		SharedPreferences.Editor editor = prefs.edit();
		
		editor.putString("autoId", login_id.getText().toString());
		editor.commit();
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if(keyCode == KeyEvent.KEYCODE_MENU){
			return true;
		}
		
		return super.onKeyDown(keyCode, event);
	}
	
	public class LoginAsyncTask extends AsyncTask<Void, String, Void>{

		@Override
		protected Void doInBackground(Void... params) {
			try{
				HttpClient client = new DefaultHttpClient();
		    	
		    	String url = "http://192.168.10.21:8080/CloverSns/android/android_login.jsp";
		    	
		    	HttpPost post = new HttpPost(url);
		    	
		    	ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();

		    	param.add(new BasicNameValuePair("login_id", login_id.getText().toString()));
		    	param.add(new BasicNameValuePair("login_pw", login_pw.getText().toString()));
		    	
		    	UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
		    	post.setEntity(ent);
		    	
		    	HttpResponse respPost = client.execute(post);
		    	
		    	BufferedReader bReader = new BufferedReader(
		    			new InputStreamReader(respPost.getEntity().getContent()));
		    	
		    	line = null;
		    	page = "";
		    	
		    	while((line = bReader.readLine()) != null){
		    		page += line;
		    	}
		    	System.out.println(page);
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			return null;
		}
		
	}
	
}
