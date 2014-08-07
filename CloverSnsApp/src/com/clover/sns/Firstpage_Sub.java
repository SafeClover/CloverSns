package com.clover.sns;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
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
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import com.clover.function.FirstpageListViewAdapter;
import com.clover.function.Firstpage_Sub_ListItem;
import com.example.cloversns.R;

public class Firstpage_Sub extends Fragment implements OnItemClickListener{
	
	// 프로필 받아오는 변수
	String MemId = null;
	String MemName = null;
	String MemEmail = null;
	String MemBirth = null;
	String MemImg = null;

	// 리스트 받아오는 변수
	String ConImg = null;
	String ConSub = null;
	String ConName = null;
	String ConDate = null;
	String ConContent = null;
	int ConUpno = 0;
	
	// 리플 받아오는 변수
	String reply_name = null, reply_re = null;
	String name, re;
	List<String> reply_list;
	ArrayAdapter<String> reply_adapter;
	
	String line = null;
	StringBuilder page = new StringBuilder();
	
	JSONObject reply;		
	JSONArray aReply;
	
	// 리플 Dialog xml
	ListView readinfo_replylist;
	EditText readinfo_editreply;
	
	//리스트의 글을 눌렀을때 db에 upno로 상세 정보 가져올려고 upno구하는 변수
	int mypage_list_upno;
	String mypage_reply_text;
	
	String path = "D:\\test\\EclipseWebApps\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\CloverSns_v2\\img\\";
	
	private MemAsyncTask memAsyncTask;
	
	ImageView proImg, upImg;
	TextView proId, proName, proEmail, proBirth, upName, upDate, upSub;
	Bitmap profile_bitmap, content_bitmap;
	
	
	private ListView mypage_listView;
	private List<Firstpage_Sub_ListItem> mypage_list;
	private ArrayAdapter adapter;
	private View rootView;
	
	private List<HashMap<String, String>> list = null;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		rootView = inflater.inflate(R.layout.mypage, container, false);
		
		proImg = (ImageView) rootView.findViewById(R.id.proImg);
		proId = (TextView) rootView.findViewById(R.id.proId);
		proName = (TextView) rootView.findViewById(R.id.proName);
		proEmail = (TextView) rootView.findViewById(R.id.proEmail);
		proBirth = (TextView) rootView.findViewById(R.id.proBirth);
		
		memAsyncTask = new MemAsyncTask();
		memAsyncTask.execute();
		
		return rootView;
	}
	
	
	
	public class MemAsyncTask extends AsyncTask<Void, String, Void> {

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			System.out.println("test1");
			proId.setText(MemId);
			proName.setText(MemName);
			proEmail.setText(MemEmail);
			proBirth.setText(MemBirth);
			proImg.setImageBitmap(profile_bitmap);
			
			mypage_listView = (ListView) rootView.findViewById(R.id.mypage_list);
			FirstpageListViewAdapter adapter = 
					new FirstpageListViewAdapter(Firstpage_Sub.this.getActivity(), 
							R.layout.mypage_listitem, mypage_list);
			mypage_listView.setAdapter(adapter);
			mypage_listView.setOnItemClickListener(Firstpage_Sub.this);
		}
		
		@Override
		protected Void doInBackground(Void... params) {

			try {
				SharedPreferences prefs = Firstpage_Sub.this.getActivity().getSharedPreferences("PreName", Context.MODE_PRIVATE);
				String mypageId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();

				String url = "http://192.168.10.21:8080/CloverSns/android/android_mypage.jsp";

				HttpPost post = new HttpPost(url);

				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();

				
				param.add(new BasicNameValuePair("id", mypageId));

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
			
				String []mem = object.split("/");
				
				JSONObject memObj = new JSONObject(mem[0]);
				
				//프로필
				MemId = memObj.getString("MemId");
				MemName = memObj.getString("MemName");
				MemEmail = memObj.getString("MemEmail");
				MemBirth = memObj.getString("MemBirth");
				MemImg = memObj.getString("MemImg");
				
				mypage_list = new ArrayList<Firstpage_Sub_ListItem>();
				//업로드 내용
				for(int i=1; i<mem.length; i++){				
					JSONObject conObj = new JSONObject(mem[i]);
					ConName = conObj.getString("ConName");
					ConDate = conObj.getString("ConDate");
					ConSub = conObj.getString("ConSubject");
					ConImg = conObj.getString("ConImg");
					ConUpno = conObj.getInt("ConUpno");
					ConContent = conObj.getString("ConContent");
							
					URL con_url = new URL("http://192.168.10.21:8080/CloverSns/img/" + ConImg);
		            HttpURLConnection conn =  (HttpURLConnection)con_url.openConnection(); 
		            conn.setDoInput(true); 
		            conn.connect(); 
		            
		            InputStream is = conn.getInputStream();
		            content_bitmap = BitmapFactory.decodeStream(is);
		            
		            Firstpage_Sub_ListItem fsItem = new Firstpage_Sub_ListItem
		            		(content_bitmap, ConSub, ConName, ConDate, ConUpno, ConContent);
		            mypage_list.add(fsItem);
				}
				
				
				URL pro_url = new URL("http://192.168.10.21:8080/CloverSns/img/" + MemImg);
	            HttpURLConnection conn =  (HttpURLConnection)pro_url.openConnection(); 
	            conn.setDoInput(true); 
	            conn.connect(); 
	            
	            InputStream is = conn.getInputStream(); 
	            profile_bitmap = BitmapFactory.decodeStream(is);
	            
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
	public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
		mypage_list_upno = mypage_list.get(arg2).getMypage_upno();
		ReplyAsyncTask reply = new ReplyAsyncTask();
		reply.execute();
		System.out.println("들어오나?");
		
		AlertDialog.Builder listDialog = new AlertDialog.Builder(Firstpage_Sub.this.getActivity());
		
		ListView reply_listview = new ListView(Firstpage_Sub.this.getActivity());
		LinearLayout layout = new LinearLayout(Firstpage_Sub.this.getActivity());
		
		layout.setOrientation(LinearLayout.VERTICAL);
		layout.addView(reply_listview);
		listDialog.setView(layout);
		
		ArrayAdapter<String> adapter;
		try {
			adapter = new ArrayAdapter<String>(Firstpage_Sub.this.getActivity(),
					android.R.layout.simple_list_item_1, reply.get());
			
			if(adapter != null){
				reply_listview.setAdapter(adapter);
			}
			
			listDialog.setTitle("감상평 리스트");
			listDialog.setCancelable(true);
			listDialog.show();
			
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}

	}
	
	public class ReplyAsyncTask extends AsyncTask<List<String>, String, List<String>>{
		
		@Override
		protected List<String> doInBackground(List<String>... params) {
			try{
				HttpClient client = new DefaultHttpClient();
				
				String url = "http://192.168.10.21:8080/CloverSns/android/android_mypage_reply.jsp";
				
				HttpPost post = new HttpPost(url);
				
				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
				
				param.add(new BasicNameValuePair("mypage_list_upno", String.valueOf(mypage_list_upno)));

				UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
				post.setEntity(ent);
				
				HttpResponse respPost = client.execute(post);
				HttpEntity reEntity = respPost.getEntity();
				
				BufferedReader bufreader = new BufferedReader(
					new InputStreamReader(
						reEntity.getContent(), "euc-kr"	
					)
				);
				
				line = null;
				page = new StringBuilder();
				
				
				//버퍼의 웹문서 소스를 줄단위로 읽어 (line), page에 저장함
				while((line = bufreader.readLine()) != null){
					page.append(line + "\n");
				}
				
				reply = new JSONObject(page.toString());
				aReply = reply.getJSONArray("data");
				System.out.println("reply" + reply);
				
				reply_list = new ArrayList<String>();
				for(int i=0; i<aReply.length(); i++){
					name = aReply.getJSONObject(i).getString("reply_name");
					re = aReply.getJSONObject(i).getString("reply_re").trim().replace("\r\n", "");
					
					reply_list.add(name + "    " + re);
					
					System.out.println(i + " 어떤것? " + reply_list.get(i));
				}
			}
			catch(Exception err){
				err.printStackTrace();
			}
			
			return reply_list;
		}
	}
	
}
