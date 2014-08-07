package com.clover.sns;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.clover.function.ThirdpageListViewAdapter;
import com.clover.function.Thirdpage_Sub_ListItem;
import com.example.cloversns.R;

public class Thirdpage_Sub extends Fragment implements OnItemClickListener{
	
	//주제
	String contest_topic=null;
	//콘테스트 받아오는 변수
	String contest_img=null;
	String contest_subject=null;
	String contest_name=null;
	int contest_upno = 0;
	
private MemAsyncTask memAsyncTask;

	ImageView conImg;
	TextView conName, conSub, ctTopic;
	Bitmap contest_bitmap;
	
	private ListView contest_listView;
	private List<Thirdpage_Sub_ListItem> contest_list;
	private ArrayAdapter adapter;
	private View rootView;
	
	private String name, subject, img, content;
	private Bitmap con_img;
	
	private List<HashMap<String, String>> list = null;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		rootView = inflater.inflate(R.layout.contest, container, false);
		
		conImg = (ImageView)rootView.findViewById(R.id.contest_img);
		conName = (TextView)rootView.findViewById(R.id.contest_name);
		conSub = (TextView)rootView.findViewById(R.id.contest_subject);
		ctTopic = (TextView)rootView.findViewById(R.id.contest_topic);
		
		
		memAsyncTask = new MemAsyncTask();
		memAsyncTask.execute();
		
		//list = new ArrayList<HashMap<String,String>>();
		//proImg.setImageBitmap(bitmap);
			
		return rootView;
	}
	
	
	
	public class MemAsyncTask extends AsyncTask<Void, String, Void> {

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			ctTopic.setText("이번 주제는 " + contest_topic + "입니다!");
			
			contest_listView = (ListView) rootView.findViewById(R.id.contest_list);
			ThirdpageListViewAdapter adapter = 
					new ThirdpageListViewAdapter(Thirdpage_Sub.this.getActivity(), 
							R.layout.contest_listitem, contest_list);
			contest_listView.setAdapter(adapter);
			contest_listView.setOnItemClickListener(Thirdpage_Sub.this);
		}
		
		@Override
		protected Void doInBackground(Void... params) {

			try {				
				HttpClient client = new DefaultHttpClient();

				String url = "http://192.168.10.21:8080/CloverSns/android/android_contest.jsp";

				HttpPost post = new HttpPost(url);

				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();

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
				
				String object = page;
				System.out.println("오브젝트 : " + object);
				String []ct = object.split("/");
				
				//토픽
				JSONObject ctObj = new JSONObject(ct[0]);
				contest_topic = ctObj.getString("contest_topic");
				
				contest_list = new ArrayList<Thirdpage_Sub_ListItem>();
				//업로드 내용
				for(int i=1; i<ct.length; i++){			
					System.out.println("ct : " + ct[i]);
					JSONObject conObj = new JSONObject(ct[i]);
					System.out.println("콘 오비제 : " + conObj);
					contest_name = conObj.getString("contest_name");
					contest_subject = conObj.getString("contest_subject");
					contest_img = conObj.getString("contest_img");
					contest_upno = conObj.getInt("contest_upno");
					
					System.out.println("test1");
					URL con_url = new URL("http://192.168.10.21:8080/CloverSns/img/" + contest_img);
		            HttpURLConnection conn =  (HttpURLConnection)con_url.openConnection(); 
		            conn.setDoInput(true); 
		            conn.connect(); 
		            System.out.println("test2");
		            
		            InputStream is = conn.getInputStream();
		            contest_bitmap = BitmapFactory.decodeStream(is);
		            System.out.println("test3");
	            
		            Thirdpage_Sub_ListItem fsItem = new Thirdpage_Sub_ListItem
		            		(contest_bitmap, contest_subject, contest_name, contest_upno);
		            contest_list.add(fsItem);
		            System.out.println("test4");
				}
			
			} catch (JSONException e) {
				e.printStackTrace();
			}
			catch(Exception e){
				e.printStackTrace();
			}

			return null;
		}
	}



	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		contest_upno = contest_list.get(position).getContest_upno();
		contestRead conRead = new contestRead();
		conRead.execute();	
	}

	public class contestRead extends AsyncTask<Void, String, Void>{
		
		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			
			AlertDialog.Builder ourdialog = new AlertDialog.Builder(Thirdpage_Sub.this.getActivity());
			LayoutInflater inflater = (LayoutInflater) Thirdpage_Sub.this.getActivity().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			
			View layout = inflater.inflate(R.layout.ourclover_readdialog, null);
			TextView our_subject = (TextView) layout.findViewById(R.id.our_subject);
			ImageView our_img = (ImageView) layout.findViewById(R.id.our_img);
			TextView our_content = (TextView) layout.findViewById(R.id.our_content);
			
			our_subject.setText(subject);
			our_img.setImageBitmap(con_img);
			our_content.setText(content);
			ourdialog.setView(layout);
			ourdialog.setTitle(name);
			ourdialog.show();
		}

		@Override
		protected Void doInBackground(Void... params) {
			try{
				HttpClient client = new DefaultHttpClient();
				
				String url = "http://192.168.10.21:8080/CloverSns/android/android_contest_read.jsp";
				HttpPost post = new HttpPost(url);
				
				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
				param.add(new BasicNameValuePair("contest_upno", String.valueOf(contest_upno)));
				
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
				
				System.out.println(page);
				
				JSONObject ourread = new JSONObject(page);
				
				name = ourread.getString("contest_name");
				subject = ourread.getString("contest_subject");
				img = ourread.getString("contest_imgroute");
				content = ourread.getString("contest_content");
				
				System.out.println();
				
				URL img_url = new URL("http://192.168.10.21:8080/CloverSns/img/" + img);
				HttpURLConnection conn = (HttpURLConnection) img_url.openConnection();
				conn.setDoInput(true);
				conn.connect();
				
				InputStream is = conn.getInputStream();
				con_img = BitmapFactory.decodeStream(is);
			}
			catch(Exception err){}
			
			return null;
		}
	}
	
}
