package com.clover.sns;

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

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.SearchView;
import android.support.v7.widget.SearchView.OnQueryTextListener;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;
import cloverSns.clover.cloversnsapp.CustomServices;
import cloverSns.clover.cloversnsapp.MemberEdit;

import com.example.cloversns.R;

public class MainFirst extends Activity implements OnQueryTextListener {
	
	public ActionBar.Tab tab1, tab2, tab3, tab4, sub1;
	
	public Fragment fTab1 = new Firstpage_Sub();
	public Fragment fTab2 = new Secondpage_Sub();
	public Fragment fTab3 = new Thirdpage_Sub();
	private Fragment fTab4 = new Myfriends();
	public SearchView sv;
	
	public String autoId, name, email, birth, gender;
	public MemEditAsyncTask memedit;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main_first);
		
		// 위에 메뉴
		ActionBar actionBar = getActionBar();
		actionBar.setDisplayShowHomeEnabled(false);
		actionBar.setDisplayShowTitleEnabled(false);
		actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
		
		tab1 = actionBar.newTab().setIcon(R.drawable.mypage).setText(" 마이페이지");
		tab2 = actionBar.newTab().setIcon(R.drawable.newsfeed).setText(" 클로버");
		tab3 = actionBar.newTab().setIcon(R.drawable.contest).setText(" 자랑하기");
		tab4 = actionBar.newTab().setIcon(R.drawable.mypage).setText("내 친구");
		
		tab1.setTabListener(new TabListener(fTab1));
		tab2.setTabListener(new TabListener(fTab2));
		tab3.setTabListener(new TabListener(fTab3));
		tab4.setTabListener(new TabListener(fTab4));

		actionBar.addTab(tab1);
		actionBar.addTab(tab2);
		actionBar.addTab(tab3);
		actionBar.addTab(tab4);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		menu.add("고객 서비스");
		menu.add("회원정보");
		
		MenuInflater mi = getMenuInflater();
		mi.inflate(R.menu.main, menu);
		
		SearchView searchView = (SearchView) menu.findItem(R.id.action_search).getActionView();
		searchView.setOnQueryTextListener(MainFirst.this);

		return true;
	}

	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
		return super.onPrepareOptionsMenu(menu);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		
		if(item.getTitle().equals("업로드")){
			Toast.makeText(getBaseContext(), "업로드", 0).show();
			finish();
			startActivity(new Intent(MainFirst.this, SubUpload.class));
		}
		else if(item.getTitle().equals("감상평 알림")){
			Toast.makeText(getBaseContext(), "감상평 알림", 0).show();
			startActivity(new Intent(MainFirst.this, SubReAlarm.class));
		}
		else if(item.getTitle().equals("친구신청 알림")){
			Toast.makeText(getBaseContext(), "친구 알림", 0).show();
			startActivity(new Intent(MainFirst.this, SubFriendAlarm.class));
		}
		else if(item.getTitle().equals("Settings")){
			Toast.makeText(getBaseContext(), "셋팅", 0).show();
			startActivity(new Intent(MainFirst.this, SubSettings.class));
		}
		else if(item.getTitle().equals("회원정보")){
			memedit = new MemEditAsyncTask();
			memedit.execute();
		}
		else if(item.getTitle().equals("고객 서비스")){
			startActivity(new Intent(MainFirst.this, CustomServices.class));
		}
		
		return super.onOptionsItemSelected(item);
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if(keyCode == KeyEvent.KEYCODE_BACK){
			AlertDialog.Builder ab = new AlertDialog.Builder(MainFirst.this);
			ab.setMessage("종료 하시겠습니까?")
			.setCancelable(false)
			.setPositiveButton("예", 
			new DialogInterface.OnClickListener() {
				@Override
				public void onClick(DialogInterface dialog, int which) {
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
		
		return super.onKeyDown(keyCode, event);
	}
		
	public class MemEditAsyncTask extends AsyncTask<Void, String, Void>{
		
		@Override
		protected void onPostExecute(Void result) {
			Intent intent = new Intent(MainFirst.this, MemberEdit.class);
			intent.putExtra("name", name);
			intent.putExtra("email", email);
			intent.putExtra("gender", gender);
			intent.putExtra("birth", birth);
			startActivity(intent);
			finish();
		}

		@Override
		protected Void doInBackground(Void... params) {
			try{
				//로그인 된 아이디 값 가져오기
				SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
				autoId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();
				
				String url = "http://192.168.10.21:8080/CloverSns/android/android_member.jsp";
				
				HttpPost post = new HttpPost(url);
				
				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
				
				param.add(new BasicNameValuePair("id", autoId));
				
				UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
				post.setEntity(ent);
				
				HttpResponse respPost = client.execute(post);
				HttpEntity reEntity = respPost.getEntity();
				
				String line = null;
				String page = "";
				
				BufferedReader read = new BufferedReader(
						new InputStreamReader(reEntity.getContent(), "euc-kr"));
				
				while((line = read.readLine()) != null){
					page += line;
				}
				read.close();
				
				JSONObject list = new JSONObject(page);
				
				name = list.getString("name");
				email = list.getString("email");
				gender = list.getString("gender");
				birth = list.getString("birth");
			}
			catch(JSONException e){
				e.printStackTrace();
			}
			catch(Exception err){
				err.printStackTrace();
			}
			return null;
		}
		
	}

	// Submit을 누르면 onQueryTextSubmit 메소드가 호출된다.
	@Override
	public boolean onQueryTextSubmit(String query) {
		Intent intent = new Intent().setClass(MainFirst.this, SearchResult.class);
		intent.putExtra("keyword", query);
		startActivity(intent);
	 
		return true;
	}
	
	@Override
	public boolean onQueryTextChange(String newText) {
		return false;
	}

}
