package com.clover.sns;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
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
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
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
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.clover.function.SecondpageListViewAdapter;
import com.clover.function.Secondpage_Sub_ListItem;
import com.example.cloversns.R;

public class Secondpage_Sub extends Fragment implements OnItemClickListener{
	
	private int ConUpno = 0;
	private String ConName = null;
	private String ConSubject = null;
	private String ConRegdate = null;
	private String ConImg = null;
	
	private List<Secondpage_Sub_ListItem> ourclover_list;
	private Bitmap content_bitmap;
	private ListView ourclover_listView;
	private View rootView;
	private OurcloverAsyncTask ourcloverAsyncTask;
	
	private InputStream is;
	private BufferedReader bufreader;	
	
	private String name, subject, content, img;
	private Bitmap bit_img;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		rootView = inflater.inflate(R.layout.sub_clover, container, false);
		
		ourcloverAsyncTask = new OurcloverAsyncTask();
		ourcloverAsyncTask.execute();
		
		return rootView;
	}
	
	
	public class OurcloverAsyncTask extends AsyncTask<Void, String, Void> {

		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			
			ourclover_listView = (ListView) rootView.findViewById(R.id.ourclover_list);
			SecondpageListViewAdapter adapter = 
					new SecondpageListViewAdapter(Secondpage_Sub.this.getActivity(), 
							R.layout.ourclover_listitem, ourclover_list);
			ourclover_listView.setAdapter(adapter);
			ourclover_listView.setOnItemClickListener(Secondpage_Sub.this);
		}
		
		
		@Override
		protected Void doInBackground(Void... params) {
			try {
				SharedPreferences prefs = Secondpage_Sub.this.getActivity().getSharedPreferences("PreName", Context.MODE_PRIVATE);
				String autoId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();

				String url = "http://192.168.10.21:8080/CloverSns/android/android_ourclover.jsp";

				HttpPost post = new HttpPost(url);

				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();

				
				param.add(new BasicNameValuePair("autoId", autoId));

				UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
				post.setEntity(ent);
				
				HttpResponse respPost = client.execute(post);
				HttpEntity reEntity = respPost.getEntity();
				
				bufreader = new BufferedReader(
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
				System.out.println("second object" + object);
			
				String []Con = object.split("/");
				
				ourclover_list = new ArrayList<Secondpage_Sub_ListItem>();
				
				//업로드 내용
				for(int i=0; i<Con.length; i++){
					content_bitmap = null;
					System.out.println("test1");
					JSONObject conObj = new JSONObject(Con[i]);
					System.out.println("test2 : " + Con[i]);
					ConName = conObj.getString("ConName");
					ConSubject = conObj.getString("ConSubject");
					ConImg = conObj.getString("ConImg");
					ConUpno = conObj.getInt("ConUpno");
					
					
					URL con_url = new URL("http://192.168.10.21:8080/CloverSns/img/" + ConImg);
		            HttpURLConnection conn =  (HttpURLConnection)con_url.openConnection();
		            conn.setDoInput(true); 
		            conn.connect();
		            
		            is = conn.getInputStream();
		            content_bitmap = BitmapFactory.decodeStream(is);
		            
		            Secondpage_Sub_ListItem fsItem = new Secondpage_Sub_ListItem(content_bitmap, ConSubject, ConName, ConUpno);
		            ourclover_list.add(fsItem);
				}
	            
			} catch (JSONException e) {
				e.printStackTrace();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				try {
					bufreader.close();
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			return null;
		}
		
	}
	
	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		ConUpno = ourclover_list.get(position).getOurclover_upno();
		ourcloverRead cloverRead = new ourcloverRead();
		cloverRead.execute();
	}
	
	public class ourcloverRead extends AsyncTask<Void, String, Void>{
		
		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			
			AlertDialog.Builder ourdialog = new AlertDialog.Builder(Secondpage_Sub.this.getActivity());
			LayoutInflater inflater = (LayoutInflater) Secondpage_Sub.this.getActivity().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			
			View layout = inflater.inflate(R.layout.ourclover_readdialog, null);
			TextView our_subject = (TextView) layout.findViewById(R.id.our_subject);
			ImageView our_img = (ImageView) layout.findViewById(R.id.our_img);
			TextView our_content = (TextView) layout.findViewById(R.id.our_content);
			
			our_subject.setText(subject);
			our_img.setImageBitmap(bit_img);
			our_content.setText(content);
			ourdialog.setView(layout);
			ourdialog.setTitle(name);
			ourdialog.show();
		}

		@Override
		protected Void doInBackground(Void... params) {
			try{
				SharedPreferences prefs = Secondpage_Sub.this.getActivity().getSharedPreferences("PreName", Context.MODE_PRIVATE);
				String autoId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();
				
				String url = "http://192.168.10.21:8080/CloverSns/android/android_ourclover_read.jsp";
				HttpPost post = new HttpPost(url);
				
				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
				param.add(new BasicNameValuePair("ConUpno", String.valueOf(ConUpno)));
				param.add(new BasicNameValuePair("autoId", autoId));
				
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
				
				System.out.println("ourread : " + ourread);
				
				name = ourread.getString("our_name");
				subject = ourread.getString("our_subject");
				img = ourread.getString("our_imgroute");
				content = ourread.getString("our_content");
				
				URL img_url = new URL("http://192.168.10.21:8080/CloverSns/img/" + img);
				HttpURLConnection conn = (HttpURLConnection) img_url.openConnection();
				conn.setDoInput(true);
				conn.connect();
				
				InputStream is = conn.getInputStream();
				bit_img = BitmapFactory.decodeStream(is);
			}
			catch(Exception err){}
			
			return null;
		}
	}
	
}
