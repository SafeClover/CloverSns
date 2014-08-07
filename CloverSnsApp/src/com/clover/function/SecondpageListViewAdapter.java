package com.clover.function;

import java.util.List;

import com.example.cloversns.R;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class SecondpageListViewAdapter extends ArrayAdapter<Secondpage_Sub_ListItem>{
	
	Context context;
	
	public SecondpageListViewAdapter(Context context, int resourceId,
			List<Secondpage_Sub_ListItem> objects) {
		super(context, resourceId, objects);
		this.context = context;
	}

	private class ViewHolder{
		ImageView ourclover_img;
		TextView ourclover_subject, ourclover_name;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		ViewHolder holder = null;
		Secondpage_Sub_ListItem secondItem = getItem(position);
		
		LayoutInflater inflater = (LayoutInflater) context
				.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
		
		if(convertView == null){
			convertView = inflater.inflate(R.layout.ourclover_listitem, null);
			holder = new ViewHolder();
			holder.ourclover_img = (ImageView) convertView.findViewById(R.id.ourclover_img);
			holder.ourclover_subject = (TextView) convertView.findViewById(R.id.ourclover_subject);
			holder.ourclover_name = (TextView) convertView.findViewById(R.id.ourclover_name);
			convertView.setTag(holder);
		}
		else{
			holder = (ViewHolder) convertView.getTag();
		}
		
		holder.ourclover_subject.setText(secondItem.getOurclover_subject());
		holder.ourclover_name.setText(secondItem.getOurclover_name());
		holder.ourclover_img.setImageBitmap(secondItem.getOurclover_img());
		
		return convertView;
	}
	
}
