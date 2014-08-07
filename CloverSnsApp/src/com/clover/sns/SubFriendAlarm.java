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
import org.json.JSONObject;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.example.cloversns.R;

public class SubFriendAlarm extends Activity {
	
	private ListView FriendAlarm_listView;
	private ArrayList alarmList;
	private ArrayAdapter adapter;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
	    setContentView(R.layout.sub_friend_alarm);
	    
	    FriendAlarmAsyncTask friendAlarm = new FriendAlarmAsyncTask();
	    friendAlarm.execute();

	}
	
	public class FriendAlarmAsyncTask extends AsyncTask<Void, String, Void> {

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			
			adapter = new ArrayAdapter(SubFriendAlarm.this, android.R.layout.simple_list_item_1, alarmList);
		    
		    FriendAlarm_listView = (ListView)findViewById(R.id.FriendAlarm_listView);
		    FriendAlarm_listView.setAdapter(adapter);
		    FriendAlarm_listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		    
		    FriendAlarm_listView.setOnItemClickListener(
		    	new OnItemClickListener() {

					@Override
					public void onItemClick(AdapterView<?> parent, View view,
							int position, long id) {
						String str = (String)adapter.getItem(position);
						Toast.makeText(getBaseContext(), str, Toast.LENGTH_SHORT).show();
					}
		    		
				}
		    );
		
		}

		@Override
		protected Void doInBackground(Void... params) {

			try {
				SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
				String autoId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();

				String url = "http://192.168.10.21:8080/CloverSns/android/android_friend_alarm.jsp";

				HttpPost post = new HttpPost(url);

				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();

				param.add(new BasicNameValuePair("id", autoId));

				UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
				post.setEntity(ent);
				
				HttpResponse respPost = client.execute(post);
				HttpEntity reEntity = respPost.getEntity();
				
				/*
				if (reEntity != null) {
					Log.i("RESPONSE", EntityUtils.toString(reEntity));
				}*/
				
				BufferedReader bufreader = new BufferedReader(
						new InputStreamReader(
							reEntity.getContent(), "euc-kr"	
						)
				);
				
				String line = null;
				String page = "";
				
				
				//버퍼의 웹문서 소스를 줄단위로 읽어 (line), page에 저장함
				while((line = bufreader.readLine()) != null){
					page += line;
				}
				
				String object = page;
				
				
				String alarm[] = object.split("/");
				
				alarmList = new ArrayList();
				
				for(int i=0; i<alarm.length; i++){
					JSONObject AlarmObj = new JSONObject(alarm[i]);
					
					String send_name = AlarmObj.getString("send_name");
					
					alarmList.add(send_name);
				}

			}
			catch(Exception e){
				e.printStackTrace();
			}

			return null;
		}
		

	}


}
