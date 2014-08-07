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
import org.apache.http.util.EntityUtils;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.inputmethod.InputMethodManager;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import com.example.cloversns.R;

public class CloverRegistration extends Activity implements OnClickListener {
	public static final int DIALOG_DATE = 0;
     
	public MemAsyncTask memAsyncTask;
	
	public LinearLayout regi;
	public TextView mDateText;
	public EditText name, id, pw, email;
	public RadioButton male, female;
	public String gender = null;
	public String date, year, monthOfYear, dayOfMonth;
    
    @Override
    public void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.clover_registration);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        
        regi = (LinearLayout) findViewById(R.id.regi_layout);
        
        Button btnDate = (Button)findViewById(R.id.btnDate); //달력 버튼
        mDateText = (TextView)findViewById(R.id.dateText); //날짜 텍스트
        
        btnDate.setOnClickListener(this);
        
        name = (EditText) findViewById(R.id.tv_name);
        id = (EditText) findViewById(R.id.tv_id);
        pw = (EditText) findViewById(R.id.tv_pw);
        email = (EditText) findViewById(R.id.tv_email);
        male = (RadioButton) findViewById(R.id.male);
        female = (RadioButton) findViewById(R.id.female);

        if(male.isChecked() == true){
        	gender = male.getText().toString();
        }
        else if(female.isChecked() == true){
        	gender = female.getText().toString();
        }
        
        regi.setOnTouchListener(new OnTouchListener() {
			
			@Override
			public boolean onTouch(View v, MotionEvent event) {
				InputMethodManager imm = (InputMethodManager)getSystemService(Context.INPUT_METHOD_SERVICE);
				imm.hideSoftInputFromWindow(regi.getWindowToken(), 0);
				
				return false;
			}
		});
        
    }
    
    @Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if(keyCode == KeyEvent.KEYCODE_BACK){
			startActivity(new Intent(CloverRegistration.this, MainActivity.class));
			finish();
		}
    	return false;
	}
    
	private DatePickerDialog.OnDateSetListener dateListener = 
        new DatePickerDialog.OnDateSetListener() {
         
        @Override
        public void onDateSet(DatePicker view, int year, int monthOfYear,
                int dayOfMonth) {
            mDateText.setText(year+"년 "+(monthOfYear+1)+"월 "+dayOfMonth+"일");
            date = year+"_"+monthOfYear+"_"+dayOfMonth;
        	}
    	};
    
	    @Override
	    public void onClick(View v) {
	        if(v.getId() == R.id.btnDate){
	        	showDialog(DIALOG_DATE);
	        }
	    }
	     
	    @Override
	    protected Dialog onCreateDialog(int id){
	        if(id == DIALOG_DATE){
	            return new DatePickerDialog(this, dateListener, 2010, 0, 15);
	        }
	        return null;
	    }
	    
	    public void Cancel(View v){
	    	Intent intent = new Intent(this, MainActivity.class);
	    	startActivity(intent);
	    	finish();
	    }
	    
	    public void fnRegOk(View v){
	    	
	    	Toast.makeText(getBaseContext(), "회원가입이 완료되었습니다.", Toast.LENGTH_SHORT).show();
	    	System.out.println(String.valueOf(id.getText()) + ", " + String.valueOf(pw.getText()) + ", " + String.valueOf(email.getText()));
	    	System.out.println(male.isChecked());
	    	System.out.println(female.isChecked());
	    	
	    	memAsyncTask = new MemAsyncTask();
	    	memAsyncTask.execute();
	    	
	    	Intent intent = new Intent(this, MainActivity.class);
	    	startActivity(intent);
	    	finish();
	    }
	    
	    public class MemAsyncTask extends AsyncTask<Void, String, Void>{

			@Override
			protected Void doInBackground(Void... params) {
				
				try{
			    	HttpClient client = new DefaultHttpClient();
			    	
			    	String url = "http://192.168.10.21:8080/CloverSns/android/android_member.jsp";
			    	
			    	HttpPost post = new HttpPost(url);
			    	
			    	ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
			    	
			    	param.add(new BasicNameValuePair("reg_name", name.getText().toString()));
			    	param.add(new BasicNameValuePair("reg_id", id.getText().toString()));
			    	param.add(new BasicNameValuePair("reg_pw", pw.getText().toString()));
			    	param.add(new BasicNameValuePair("reg_email", email.getText().toString()));
			    	param.add(new BasicNameValuePair("reg_gender", gender));
			    	param.add(new BasicNameValuePair("reg_date", date));
			    	
			    	UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
			    	post.setEntity(ent);
			    	
			    	client.execute(post);
			    }
			    catch(Exception e){
			    	e.printStackTrace();
			    }
				
				return null;
			}
			
	    }
	    
}
