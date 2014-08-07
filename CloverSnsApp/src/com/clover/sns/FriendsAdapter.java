package com.clover.sns;
 
import java.util.ArrayList;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.text.Html;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.example.cloversns.R;


public class FriendsAdapter extends ArrayAdapter<Object>  implements OnClickListener{
private ArrayList<FriendData> list;
SearchResult sr = new SearchResult();
	View v;
	WebView image;
	Activity parentActivity;
	MemAsyncTask memAsyncTask;
	FriendData data;
	public FriendsAdapter(Context context, int textViewResourceId, ArrayList items){
		super(context, textViewResourceId, items);
		this.list = items;
	
	}
	public FriendsAdapter(Context context, int textViewResourceId, ArrayList items, Activity parentActivity){
		super(context, textViewResourceId, items);
		this.list = items;
		this.parentActivity = parentActivity;
	}
	@Override
    public FriendData getItem(int position)
    {
        return list.get(position);
    }

		public View getView(int position, View convertView, ViewGroup parent) {
		// TODO Auto-generated method stub
			
			v=convertView;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
			if( v == null)
			{
				LayoutInflater vi=(LayoutInflater)getContext().getSystemService(
						Context.LAYOUT_INFLATER_SERVICE);
				v= vi.inflate(R.layout.listitem, null);
			}
			
			FriendData item= list.get(position);
			System.out.println("���� ���"+item.image);
			if(item != null)
			{
				
				image=(WebView)v.findViewById(R.id.image);
				image.setInitialScale(15);
				if(!item.image.equals("���")){
					image.loadUrl("http://192.168.10.21:8080/CloverSns/img/" + item.image);
				}else{
					System.out.println("�� ������?");
					image.loadUrl("http://192.168.10.21:8080/CloverSns/style/img/noimage.jpg");
				}
				
				
				TextView v_name=(TextView)v.findViewById(R.id.name);
				TextView v_birth=(TextView)v.findViewById(R.id.birth);

				v_name.setText(Html.fromHtml(Html.fromHtml(item.name)
						.toString()));
				v_birth.setText(Html.fromHtml(Html.fromHtml(item.birth)
						.toString()));
			}
			// position�� tag�� �����Ѵ�.
	        v.setTag(position);
	         
	        // ������� ��(row)�� Ŭ���̺�Ʈ�� ����Ѵ�. �̺�Ʈ�� ó���� 123�� ������ onClick()���� �Ѵ�.
	        v.setOnClickListener(this);

			
			return v;
		}

		@Override
		public void onClick(View v) {
			 // 111�� ���ο��� ������ tag(position)�� �����´�.
	        int position = (Integer) v.getTag();
	         
	        // ����Ʈ���� position�� �´� �����͸� �޾ƿ´�.
	        data = getItem(position);
	        if(data.birth.equals("�츰 ģ������")||data.birth.equals("ģ�� ���� �����")){
				Toast toast = Toast.makeText(getContext(), data.birth, Toast.LENGTH_SHORT);
				toast.setGravity(Gravity.CENTER_HORIZONTAL|Gravity.CENTER_VERTICAL, 0, 0);
				toast.show();
			}else{
		        AlertDialog.Builder alertDlg = new AlertDialog.Builder(parentActivity);
		        alertDlg.setTitle("ģ�� ��û�Ͻðڽ��ϱ�?");
		     // '��' ��ư�� Ŭ���Ǹ�
		        alertDlg.setPositiveButton( "ģ�� ��û", new DialogInterface.OnClickListener() {
		    		
					public void onClick(DialogInterface dialog, int which) {
						
							memAsyncTask = new MemAsyncTask();
							memAsyncTask.execute();
						
					}
				});
		         
		         // '�ƴϿ�' ��ư�� Ŭ���Ǹ�
		        alertDlg.setNegativeButton( "no", null);
		         
		         
		         alertDlg.setMessage( String.format("�߰�",
		                    list.get(position)) );
	 
	
		      alertDlg.show();
		        // Toast.makeText(getContext(), "���ͷ�����", Toast.LENGTH_SHORT).show();
	//	        sr.alert(v, position);
			}
		}
		
		public class MemAsyncTask extends AsyncTask<Void, String, Void> {
			
			@Override
			protected void onPostExecute(Void result) {
				super.onPostExecute(result);
				Toast.makeText(getContext(), "ģ�� ��û �Ϸ�", Toast.LENGTH_SHORT).show();
			}

			@Override
			protected Void doInBackground(Void... params) {
				try {
					SharedPreferences prefs = FriendsAdapter.this.getContext().getSharedPreferences("PreName", Context.MODE_PRIVATE);
					String autoId = prefs.getString("autoId", "");
					
					HttpClient client = new DefaultHttpClient();

					String url = "http://192.168.10.21:8080/CloverSns/android/android_myfriends.jsp";
					
					HttpPost post = new HttpPost(url);

					ArrayList<NameValuePair> param = new ArrayList<NameValuePair>();
					
					
					param.add(new BasicNameValuePair("id", autoId));
					param.add(new BasicNameValuePair("command", "friendRequest"));
					param.add(new BasicNameValuePair("id_get", data.id));

					UrlEncodedFormEntity ent = new UrlEncodedFormEntity(param, "euc-kr");
					post.setEntity(ent);
					
					HttpResponse respPost = client.execute(post);
					HttpEntity reEntity = respPost.getEntity();
					

				} 
				catch(Exception e){
					System.out.println("exception : "+e);
					e.printStackTrace();
				}

				return null;
			}
		}
}
