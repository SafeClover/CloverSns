package cloverSns.clover.cloversnsapp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.AlertDialog.Builder;
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
import android.widget.TextView;
import android.widget.Toast;

import com.clover.sns.MainFirst;
import com.example.cloversns.R;

public class MemberEdit extends Activity {

	public MemEditAsyncTask memeditAsyncTask;
	
	public LinearLayout edit;
	public TextView editname, editgender, editbirth;
	public EditText editpw, editpwCheck, editemail;
	
	public String editId, name, email, gender, birth;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
		setContentView(R.layout.mem_edit);
		
		edit = (LinearLayout) findViewById(R.id.edit);
		edit.setOnTouchListener(new OnTouchListener() {
			
			@Override
			public boolean onTouch(View v, MotionEvent event) {
				InputMethodManager imm = (InputMethodManager)getSystemService(Context.INPUT_METHOD_SERVICE);
				imm.hideSoftInputFromWindow(edit.getWindowToken(), 0);
				
				return false;
			}
		});
		
		Intent intent = getIntent();
		name = intent.getStringExtra("name");
		email = intent.getStringExtra("email");
		gender = intent.getStringExtra("gender");
		birth = intent.getStringExtra("birth");
		
		editname = (TextView) findViewById(R.id.edit_name);
		editemail = (EditText) findViewById(R.id.edit_email);
		editgender = (TextView) findViewById(R.id.edit_sung);
		editbirth = (TextView) findViewById(R.id.edit_birth);
		editpw = (EditText) findViewById(R.id.edit_pw);
		editpwCheck = (EditText) findViewById(R.id.edit_pwCheck);
		
		editname.setText(name);
		editemail.setHint(email);
		editgender.setText(gender);
		editbirth.setText(birth);
	}
	//확인 버튼
	public void check(View v){
		if(editpw.getText().toString().equals(editpwCheck.getText().toString())){
			memeditAsyncTask = new MemEditAsyncTask();
			memeditAsyncTask.execute();
			finish();
			startActivity(new Intent(MemberEdit.this, MainFirst.class));
		}
		else{
			Toast.makeText(MemberEdit.this, "비밀번호를 다시 입력하여 주세요.", Toast.LENGTH_SHORT).show();
		}
		
	}
	
	//취소 버튼
	public void cancel(View v){
		startActivity(new Intent(MemberEdit.this, MainFirst.class));
		finish();
	}
	
	//탈퇴 버튼
	public void memberOut(View v){
		System.out.println("dddddddddddd");
		startActivity(new Intent(MemberEdit.this, MemberOut.class));
		finish();
	}
	
	public class MemEditAsyncTask extends AsyncTask<Void, String, Void>{

		@Override
		protected Void doInBackground(Void... params) {
			try{
				SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
				editId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();
				
				String url = "http://192.168.10.21:8080/CloverSns/android/android_member.jsp";
				
				HttpPost post = new HttpPost(url);
				
				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
				
				param.add(new BasicNameValuePair("editId", editId));
				param.add(new BasicNameValuePair("editpw", editpw.getText().toString()));
				param.add(new BasicNameValuePair("editemail", editemail.getText().toString()));
				
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
