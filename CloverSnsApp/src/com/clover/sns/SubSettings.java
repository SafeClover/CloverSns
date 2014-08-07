package com.clover.sns;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import cloverSns.clover.cloversnsapp.CloverIntro;

import com.example.cloversns.R;

public class SubSettings extends Activity implements OnItemClickListener{

	private String[] list = {"About", "로그아웃"};
	private ArrayAdapter<String> adapter;
	private ListView listview;

	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
	    setContentView(R.layout.sub_setttings);
	    
	    adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, list);
	    
	    listview = (ListView) findViewById(R.id.lv_set);
	    listview.setAdapter(adapter);
	    listview.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
	    listview.setOnItemClickListener(SubSettings.this);
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		if(position == 0){
			startActivity(new Intent(SubSettings.this, SubSettings_about.class));
		}
		else if(position == 1){
			AlertDialog.Builder ab = new AlertDialog.Builder(SubSettings.this);
			ab.setMessage("로그아웃 하시겠습니까?")
			.setCancelable(false)
			.setPositiveButton("예", 
			new DialogInterface.OnClickListener() {
				@Override
				public void onClick(DialogInterface dialog, int which) {
					SharedPreferences prefs = getSharedPreferences("PreName", MODE_PRIVATE);
					SharedPreferences.Editor editor = prefs.edit();
					editor.clear();
					editor.remove("PreName");
					editor.commit();
					startActivity(new Intent(SubSettings.this, CloverIntro.class));
				}
			}).setNegativeButton("아니오", 
			new DialogInterface.OnClickListener() {
				@Override
				public void onClick(DialogInterface dialog, int which) {
					dialog.cancel();
				}
			});
			AlertDialog alert = ab.create();
			alert.show();
		}
	}
}
