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
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.example.cloversns.R;

public class SubReAlarm extends Activity {
	
	private ListView ReAlarm_listView;
	private ArrayList alarmList;
	private ArrayAdapter adapter;
	
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
	    setContentView(R.layout.sub_re_alarm);
	    
	    ReAlarmAsyncTask reAlarm = new ReAlarmAsyncTask();
	    reAlarm.execute();
	    
	}

	public class ReAlarmAsyncTask extends AsyncTask<Void, String, Void> {

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			
			adapter = new ArrayAdapter(SubReAlarm.this, android.R.layout.simple_list_item_1, alarmList);
			
		    ReAlarm_listView = (ListView)findViewById(R.id.ReAlarm_listView);
		    ReAlarm_listView.setAdapter(adapter);
		    ReAlarm_listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		
		    
		    ReAlarm_listView.setOnItemClickListener(
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

				String url = "http://192.168.10.21:8080/CloverSns/android/android_re_alarm.jsp";

				HttpPost post = new HttpPost(url);

				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();

				param.add(new BasicNameValuePair("id", autoId));

				UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
				post.setEntity(ent);
				
				HttpResponse respPost = client.execute(post);
				HttpEntity reEntity = respPost.getEntity();
				
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
	
				String alarm[] = page.split("/");
				
				alarmList = new ArrayList();
				
				if(alarm.length == 0){
					alarmList.add("감상평 없음");
				}
				else{
					for(int i=0; i<alarm.length; i++){
						
						Log.i("SubReAlarm", "내용 : " + alarm[i]);
						
						JSONObject AlarmObj = new JSONObject(alarm[i]);
						
						String name = AlarmObj.getString("name");
						int upNo = AlarmObj.getInt("upNo");
						String subject = AlarmObj.getString("subject");
						String send_id = AlarmObj.getString("send_id");
						
						alarmList.add(name + "님께서 '" + subject + "'에 감상평을 남기셨습니다.");
						
					}
					
				}
				
			}
			catch(Exception e){
				e.printStackTrace();
			}

			return null;
		}

	}

}
