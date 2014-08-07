package com.clover.function;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.Window;
import android.widget.ProgressBar;

import com.clover.sns.MainFirst;
import com.example.cloversns.R;

public class LoadingProgressbar extends Activity {
	
	private static int progress;
	private ProgressBar pb_loading;
	private int mProgStatus = 0;
	private Handler mHandler = new Handler();
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
	    requestWindowFeature(Window.FEATURE_NO_TITLE);
	    setContentView(R.layout.loading_progressbar);
		
		progress = 0;
		pb_loading = (ProgressBar) findViewById(R.id.pb_loading);
		pb_loading.setMax(50);
		
		new Thread(new Runnable(){
			public void run(){
				while(mProgStatus < 50){
					mProgStatus = doWork();
					mHandler.post(new Runnable(){
						public void run(){
							pb_loading.setProgress(mProgStatus);
						}
					});
				}
				mHandler.post(new Runnable(){
					public void run(){
						finish();
						startActivity(new Intent(getBaseContext(), MainFirst.class));
					}
				});
			}
			
			private int doWork(){
				try{
					Thread.sleep(100);
				}
				catch(Exception e){
					e.printStackTrace();
				}
				return ++progress;
			}
		}).start();
	}
}
