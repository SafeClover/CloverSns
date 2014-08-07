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

import android.app.Fragment;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.SearchView.OnQueryTextListener;
import android.widget.TextView;

import com.example.cloversns.R;

public class Myfriends extends Fragment implements OnClickListener, OnQueryTextListener 
{
	

	String MemId = null;
	String MemName = null;
	String MemBirth = null;
	String MemImg = null;

	private MemAsyncTask memAsyncTask;
	
	ImageView proImg;
	TextView proId, proName, proEmail, proBirth;
	Bitmap bitmap;
	 
	EditText editText; //�˻�â
	Button bt;
    ListView listView; //ģ������ ��ü
    
	ArrayList<FriendData> list; //listview�� ������ �� ��ü
    FriendsAdapter adapter;
    FriendData data = null;
    
    String []mem = null;
    private SearchView sv;
    
	Context context;
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View rootView = inflater.inflate(R.layout.sub_myfriends, container, false);
		
		editText = (EditText)rootView.findViewById(R.id.edit_book2);
        listView = (ListView)rootView.findViewById(R.id.listView);
        list = new ArrayList<FriendData>();
        bt = (Button)rootView.findViewById(R.id.button_search2);
        bt.setOnClickListener((OnClickListener) this);
		
        listView.setOnItemClickListener(
        	new OnItemClickListener() {
				@Override
				public void onItemClick(AdapterView<?> parent, View view,
						int position, long id) {
					
				}
        	}
        );
        
		memAsyncTask = new MemAsyncTask();
		memAsyncTask.execute();
		
	
		System.out.println("adapter ��");
		 //����Ʈ�信 �𵨰�ü�� ������ �ƴ�Ÿ ��ü
		
		
			
		return rootView;
	}
	
	
	
	


	public class MemAsyncTask extends AsyncTask<Void, String, Void> {
		
		@Override
		protected void onPostExecute(Void result) {
			super.onPostExecute(result);
			System.out.println("post");
			 adapter = new FriendsAdapter(Myfriends.this.getActivity(), R.layout.listitem, list);

		        //adapter = new ArrayAhdapter<String>(this, android.R.layout.simple_list_item_1, list);
		        //����Ʈ�信 �ƴ�Ÿ �����ϱ�
		        listView.setAdapter(adapter);
		        listView.setDivider(new ColorDrawable(Color.YELLOW));
		        listView.setDividerHeight(1); //���м�
		}

		@Override
		protected Void doInBackground(Void... params) {
			try {
				SharedPreferences prefs = Myfriends.this.getActivity().getSharedPreferences("PreName", Context.MODE_PRIVATE);
				String autoId = prefs.getString("autoId", "");
				
				HttpClient client = new DefaultHttpClient();

				String url = "http://192.168.10.21:8080/CloverSns/android/android_myfriends.jsp";

				HttpPost post = new HttpPost(url);

				ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();

				
				param.add(new BasicNameValuePair("id", autoId));
				param.add(new BasicNameValuePair("command", "getfriends"));

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
				
				/*if(object.equals("ģ�� ����")){
					data = new FriendData();
					data.id = "���� ģ���� ���׿�:)";
					data.name= " ";
					
					data.birth = " ";
					list.add(data);
				}else{*/
					mem = object.split("/");
		
					for(int i=0; i<mem.length; i++){		
						data = new FriendData();
						JSONObject memObj = new JSONObject(mem[i]);
						data.id = memObj.getString("MemId");
						data.name = memObj.getString("MemName");
						data.birth = memObj.getString("MemBirth");
						data.image = memObj.getString("MemImg");
		 				list.add(data);
		 				System.out.println("list : "+ data.name);
					}
				/*}*/

 				System.out.println("�������ϳ�"+list.size());
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
		System.out.println("�˻���ư");
		if(mem != null){
			
	    //��û url �����
	    String keyWord = editText.getText().toString();
	    ArrayList<FriendData> result = new ArrayList<FriendData>();
	    try {
		    for(int i=0; i<mem.length; i++){		
				data = new FriendData();
				JSONObject memObj = new JSONObject(mem[i]);
				
				if(memObj.getString("MemName").contains(keyWord)){
					data = new FriendData();
					data.id = memObj.getString("MemId");
					data.name = memObj.getString("MemName");
					data.birth = memObj.getString("MemBirth");
					data.image = memObj.getString("MemImg");
					result.add(data);
				}
			}
	    } catch (JSONException e) {
	    	// TODO Auto-generated catch block
	    	e.printStackTrace();
	    }
	    
	    adapter = new FriendsAdapter(Myfriends.this.getActivity(), R.layout.listitem, result);

        //adapter = new ArrayAhdapter<String>(this, android.R.layout.simple_list_item_1, list);
        //����Ʈ�信 �ƴ�Ÿ �����ϱ�
        listView.setAdapter(adapter);
        listView.setDivider(new ColorDrawable(Color.YELLOW));
        listView.setDividerHeight(1); //���м�
		}
	}

	@Override
	public void onPrepareOptionsMenu(Menu menu) {
		// TODO Auto-generated method stub
		super.onPrepareOptionsMenu(menu);
		onQueryTextChange("");

	}

	@Override
	public boolean onQueryTextSubmit(String query) {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean onQueryTextChange(String newText) {
		// TODO Auto-generated method stub
		return false;
	}
}
