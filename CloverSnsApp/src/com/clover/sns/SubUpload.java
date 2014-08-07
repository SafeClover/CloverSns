package com.clover.sns;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;

import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.net.http.AndroidHttpClient;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.Toast;

import com.example.cloversns.R;

public class SubUpload extends Activity{
	
	private static final String DEFAULT_ENCODING = "euc-kr";
	private static final String TEMP_PHOTO_FILE = "temp.jpg";       // 임시 저장파일
	private static int TAKE_GALLERY = 0;
	private String filePath = null;
	
	private LinearLayout subup;
	private Bitmap selectedImage;
	private RadioGroup radioGroup;
	private EditText title, content;
	private String checked = null;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.sub_upload);
		
		subup = (LinearLayout) findViewById(R.id.subup);
		
		subup.setOnTouchListener(new OnTouchListener() {
			@Override
			public boolean onTouch(View v, MotionEvent event) {
				InputMethodManager imm = (InputMethodManager)getSystemService(Context.INPUT_METHOD_SERVICE);
				imm.hideSoftInputFromWindow(subup.getWindowToken(), 0);
				
				return false;
			}
		});
		
		title = (EditText) findViewById(R.id.title);
		content = (EditText) findViewById(R.id.content);
		
		radioGroup = (RadioGroup)findViewById(R.id.radioGroup);
		radioGroup.setOnCheckedChangeListener(
			new OnCheckedChangeListener() {
				
				@Override
				public void onCheckedChanged(RadioGroup group, int checkedId) {
					if(checkedId == R.id.radio_mypage){
						Toast.makeText(getBaseContext(), "mypage", Toast.LENGTH_SHORT).show();
						checked = "privacy";
					}
					else if(checkedId == R.id.radio_clover){
						Toast.makeText(getBaseContext(), "clover", Toast.LENGTH_SHORT).show();
						checked = "friends";
					}
					else if(checkedId == R.id.radio_contest){
						Toast.makeText(getBaseContext(), "contest", Toast.LENGTH_SHORT).show();
						checked = "contest";
					}
				}
			}
		);
	}
	
	public void onFindImg(View v){
		Intent intent = new Intent(
                Intent.ACTION_PICK,      // 또는 ACTION_PICK
                android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
        intent.setType("image/*");              // 모든 이미지
        intent.putExtra("crop", "true");        // Crop기능 활성화
        intent.putExtra(MediaStore.EXTRA_OUTPUT, getTempUri());     // 임시파일 생성
        intent.putExtra("outputFormat",         // 포맷방식
                Bitmap.CompressFormat.JPEG.toString());

        startActivityForResult(intent, TAKE_GALLERY);
        // REQ_CODE_PICK_IMAGE == requestCode
	}
	
	/** 임시 저장 파일의 경로를 반환 */
    private Uri getTempUri() {
        return Uri.fromFile(getTempFile());
    }
    
    /** 외장메모리에 임시 이미지 파일을 생성하여 그 파일의 경로를 반환  */
    private File getTempFile() {
        if (isSDCARDMOUNTED()) {
            File f = new File(Environment.getExternalStorageDirectory(), // 외장메모리 경로
                    TEMP_PHOTO_FILE);
            try {
                f.createNewFile();      // 외장메모리에 temp.jpg 파일 생성
            } catch (IOException e) {
            }
 
            return f;
        } else
            return null;
    }
    
    /** SD카드가 마운트 되어 있는지 확인 */
    private boolean isSDCARDMOUNTED() {
        String status = Environment.getExternalStorageState();
        if (status.equals(Environment.MEDIA_MOUNTED)){
            return true;
        }
 
        return false;
    }
    
    /** 다시 액티비티로 복귀하였을때 이미지를 셋팅 */
    protected void onActivityResult(int requestCode, int resultCode,
            Intent imageData) {
        super.onActivityResult(requestCode, resultCode, imageData);

    	if(requestCode == TAKE_GALLERY){    
            if (resultCode == RESULT_OK) {
                if (imageData != null) {
                    filePath = Environment.getExternalStorageDirectory()
                            + "/temp.jpg";
 
                    System.out.println("path : " + filePath); // logCat으로 경로확인.
 
                    selectedImage = BitmapFactory.decodeFile(filePath);
                    // temp.jpg파일을 Bitmap으로 디코딩한다.
 
                    ImageView upImage = (ImageView) findViewById(R.id.upimg);
                    upImage.setImageBitmap(selectedImage);
                    // temp.jpg파일을 이미지뷰에 씌운다.
                }
            }
            return;
        }
    }
    
    /** 업로드 버튼 클릭 */
    public void onUpload(View v){
    	contentUpload conUp = new contentUpload();
    	conUp.execute();
    	
    	imageUpload imgUp = new imageUpload();
    	imgUp.execute();
    	
    	finish();
    	startActivity(new Intent(SubUpload.this, MainFirst.class));
    }
    
    public class contentUpload extends AsyncTask<Void, String, Void>{

		@Override
		protected Void doInBackground(Void... params) {
			try{
				SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
				String autoId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();
				HttpPost post = new HttpPost("http://192.168.10.21:8080/CloverSns/android/android_upload0.jsp");
				
				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
				
				param.add(new BasicNameValuePair("upId", autoId));
				param.add(new BasicNameValuePair("title", title.getText().toString()));
				param.add(new BasicNameValuePair("content", content.getText().toString()));
				param.add(new BasicNameValuePair("checked", checked));
				
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
    
    public class imageUpload extends AsyncTask<Void, String, Void>{
    	
		@Override
		protected Void doInBackground(Void... params) {
			try {
				SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
				String upId = prefs.getString("autoId", "");
				
				HttpClient client = AndroidHttpClient.newInstance("Android");
				HttpPost post = new HttpPost("http://192.168.10.21:8080/CloverSns/android/android_upload1.jsp");
				post.setHeader("Connection", "Keep-Alive");
	            post.setHeader("Accept-Charset", "UTF-8");
				
				MultipartEntityBuilder meb = MultipartEntityBuilder.create()
				.setCharset(Charset.forName("EUC-KR"))
				.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
				
				File file = new File(filePath);
				meb.addBinaryBody("upload", file);
				meb.addTextBody("upId", upId);
				meb.addTextBody("checked", checked);
	
				post.setEntity(meb.build());
				client.execute(post);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
    	
    }
}
