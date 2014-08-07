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

public class ThirdpageListViewAdapter extends ArrayAdapter<Thirdpage_Sub_ListItem>{
	
	Context context;
	
	public ThirdpageListViewAdapter(Context context, int resourceId,
			List<Thirdpage_Sub_ListItem> objects) {
		super(context, resourceId, objects);
		this.context = context;
	}

	private class ViewHolder{
		ImageView contest_img;
		TextView contest_subject, contest_name;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		ViewHolder holder = null;
		Thirdpage_Sub_ListItem fsItem = getItem(position);
		
		LayoutInflater inflater = (LayoutInflater) context
				.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
		
		System.out.println("test5");
		if(convertView == null){
			convertView = inflater.inflate(R.layout.contest_listitem, null);
			holder = new ViewHolder();
			holder.contest_img = (ImageView) convertView.findViewById(R.id.contest_img);
			holder.contest_subject = (TextView) convertView.findViewById(R.id.contest_subject);
			holder.contest_name = (TextView) convertView.findViewById(R.id.contest_name);
			convertView.setTag(holder);
			System.out.println("test6");
		}
		else{
			holder = (ViewHolder) convertView.getTag();
			System.out.println("test7");
		}
		
		holder.contest_subject.setText(fsItem.getContest_subject());
		holder.contest_name.setText(fsItem.getContest_name());
		holder.contest_img.setImageBitmap(fsItem.getContest_img());
		System.out.println("test8");
		
		return convertView;
	}
	
	
}
