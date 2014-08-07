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

import com.clover.sns.Myfriends.MemAsyncTask;
import com.example.cloversns.R;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class SearchResult extends Activity implements OnClickListener{
	public String keyword = null;
	String []mem = null;
	public static ArrayList<FriendData> list; //listview�� ������ �� ��ü
	FriendsAdapter adapter;
	 ListView listView; //ģ������ ��ü
	MemAsyncTask memAsyncTask;
	EditText editText; //�˻�â
	Button bt;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.sub_myfriends);
		list = new ArrayList<FriendData>();
		listView = (ListView)findViewById(R.id.listView);
		editText = (EditText)findViewById(R.id.edit_book2);
		bt = (Button)findViewById(R.id.button_search2);
	    bt.setOnClickListener((OnClickListener) this);
		
	    Intent intent = getIntent();
		keyword = intent.getStringExtra("keyword");
		

		memAsyncTask = new MemAsyncTask();
		memAsyncTask.execute();
	}
	  
	  

	public class MemAsyncTask extends AsyncTask<Void, String, Void> {
		
		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			System.out.println("post");
			 adapter = new FriendsAdapter(SearchResult.this.getApplicationContext(), R.layout.listitem, list, SearchResult.this);

	        //adapter = new ArrayAhdapter<String>(this, android.R.layout.simple_list_item_1, list);
	        //����Ʈ�信 �ƴ�Ÿ �����ϱ�
	        listView.setAdapter(adapter);
	        listView.setDivider(new ColorDrawable(Color.YELLOW));
	        listView.setDividerHeight(1); //���м�
		        
		}

		@Override
		protected Void doInBackground(Void... params) {
			try {
				SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
				String autoId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();
				
				String url = "http://192.168.10.21:8080/CloverSns/android/android_myfriends.jsp";

				HttpPost post = new HttpPost(url);

				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();

				
				param.add(new BasicNameValuePair("id", autoId));
				param.add(new BasicNameValuePair("command", "search"));
				param.add(new BasicNameValuePair("keyword", keyword));

				UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
				post.setEntity(ent);
				
				HttpResponse respPost = client.execute(post);
				HttpEntity reEntity = respPost.getEntity();
				System.out.println("�� �ȵǴ°ǵ� ");

				
				BufferedReader bufreader = new BufferedReader(new InputStreamReader(reEntity.getContent(), "euc-kr"));
				
				String line = null;
				String page = "";
				
				
				//������ ������ �ҽ��� �ٴ����� �о� (line), page�� ������
				while((line = bufreader.readLine()) != null){
					page += line;
				}
				
				String object = page;
				
				mem = object.split("/");
				String memState = null;
				System.out.println("mem size : "+ mem.length);
				for(int i=0; i<mem.length; i++){		
					FriendData data = new FriendData();
					JSONObject memObj = new JSONObject(mem[i]);
					data.id = memObj.getString("MemId");
					data.name = memObj.getString("MemName");
					memState = memObj.getString("MemState");
					if(memState.equals("3")){
						data.birth = "�츰 ģ������";
					}else if(memState.equals("2")){
						data.birth = "ģ�� ���� �����";
					}else if(memState.equals("1")){
						data.birth = "ģ���� �ƴ�";
					}
					data.image = memObj.getString("MemImg");
	 				
					System.out.println("list : "+  memObj.getString("MemId")+memObj.getString("MemName")+memObj.getString("MemState")+memObj.getString("MemImg"));
	 				list.add(data);
				}

			} catch (JSONException e) {
				System.out.println("jsonexception : "+e);
			}
			catch(Exception e){
				System.out.println("exception : "+e);
				e.printStackTrace();
			}

			return null;
		}

		
	}
	@Override
	public void onClick(View v) {
		list.clear();
		keyword = editText.getText().toString();
		

		memAsyncTask = new MemAsyncTask();
		memAsyncTask.execute();
	}

}
