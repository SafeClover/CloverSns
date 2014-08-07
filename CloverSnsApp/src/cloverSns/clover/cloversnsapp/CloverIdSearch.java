package cloverSns.clover.cloversnsapp;

/*
import android.app.Activity;
import android.os.Bundle;
import android.widget.TabHost;
import android.widget.TabHost.TabSpec;
*//** Called when the activity is first created. *//*

public class CloverIdSearch extends Activity {
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.clover_idfind);

		TabHost tabHost = (TabHost) findViewById(R.id.tab_host);
		tabHost.setup();

		// 아이디 찾기 Setting

		TabSpec tabSpec1 = tabHost.newTabSpec("Tab1");
		tabSpec1.setIndicator("아이디 찾기"); // 탭이름
		tabSpec1.setContent(R.id.idSearch); // 탭 내용
		tabHost.addTab(tabSpec1);

		// 비밀번호 찾기 Setting

		TabSpec tabSpec2 = tabHost.newTabSpec("Tab2");
		tabSpec2.setIndicator("비밀번호 찾기"); // 두번째 탭 이름
		tabSpec2.setContent(R.id.pwSearch); // 두번째 탭 내용
		tabHost.addTab(tabSpec2);

		// show First Tab Content

		tabHost.setCurrentTab(0);

	}
	*/

import com.example.cloversns.R;

import android.app.ActionBar;
import android.app.Fragment;
import android.os.Bundle;
import android.view.View;
import android.app.Activity;
import android.content.Intent;
 
public class CloverIdSearch extends Activity {
    // Declare Tab Variable
    ActionBar.Tab Tab1, Tab2;
    Fragment fragmentTab1 = new IdSearchTab();
    Fragment fragmentTab2 = new PwSearchTab();
 
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.clover_idfind);
 
        ActionBar actionBar = getActionBar();
 
        // Hide Actionbar Icon
        actionBar.setDisplayShowHomeEnabled(false);
 
        // Hide Actionbar Title
        actionBar.setDisplayShowTitleEnabled(false);
 
        // Create Actionbar Tabs
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
        
        // Set Tab Icon and Titles
        Tab1 = actionBar.newTab().setText("아이디 찾기");
        Tab2 = actionBar.newTab().setText("비밀번호 찾기");

        // Set Tab Listeners
        Tab1.setTabListener(new TabListener(fragmentTab1));
        Tab2.setTabListener(new TabListener(fragmentTab2));
 
        // Add tabs to actionbar
        actionBar.addTab(Tab1);
        actionBar.addTab(Tab2);
    }
    //아이디 찾기에서 취소버튼 누르면 메인으로 
    public void idCancel(View v){
    	Intent intent = new Intent(this, MainActivity.class);
    	startActivity(intent);
    }
    //비밀번호 찾기에서 취소버튼 누르면 메인으
    public void pwCancel(View v){
    	Intent intent = new Intent(this, MainActivity.class);
    	startActivity(intent);
    }
}



