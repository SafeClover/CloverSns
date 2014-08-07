package com.clover.function;

import java.util.List;

import com.example.cloversns.R;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class FirstpageListViewAdapter extends ArrayAdapter<Firstpage_Sub_ListItem>{
	
	Context context;
	
	public FirstpageListViewAdapter(Context context, int resourceId,
			List<Firstpage_Sub_ListItem> objects) {
		super(context, resourceId, objects);
		this.context = context;
	}

	private class ViewHolder{
		ImageView my_img;
		TextView my_title, my_name, my_regdate, my_content;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		ViewHolder holder = null;
		Firstpage_Sub_ListItem fsItem = getItem(position);
		
		LayoutInflater inflater = (LayoutInflater) context
				.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
		
		if(convertView == null){
			convertView = inflater.inflate(R.layout.mypage_listitem, null);
			holder = new ViewHolder();
			holder.my_img = (ImageView) convertView.findViewById(R.id.mypage_img);
			holder.my_title = (TextView) convertView.findViewById(R.id.mypage_title);
			holder.my_name = (TextView) convertView.findViewById(R.id.mypage_name);
			holder.my_regdate = (TextView) convertView.findViewById(R.id.mypage_regdate);
			holder.my_content = (TextView) convertView.findViewById(R.id.mypage_content);
			convertView.setTag(holder);
		}
		else{
			holder = (ViewHolder) convertView.getTag();
		}
		
		holder.my_title.setText(fsItem.getMypage_title());
		holder.my_name.setText(fsItem.getMypage_name());
		holder.my_regdate.setText(fsItem.getMypage_regdate());
		holder.my_img.setImageBitmap(fsItem.getMypage_img());
		holder.my_content.setText(fsItem.getMypage_content());
		
		return convertView;
	}
	
	
}
