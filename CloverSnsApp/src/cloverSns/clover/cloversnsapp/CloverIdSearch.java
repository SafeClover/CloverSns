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

		// ���̵� ã�� Setting

		TabSpec tabSpec1 = tabHost.newTabSpec("Tab1");
		tabSpec1.setIndicator("���̵� ã��"); // ���̸�
		tabSpec1.setContent(R.id.idSearch); // �� ����
		tabHost.addTab(tabSpec1);

		// ��й�ȣ ã�� Setting

		TabSpec tabSpec2 = tabHost.newTabSpec("Tab2");
		tabSpec2.setIndicator("��й�ȣ ã��"); // �ι�° �� �̸�
		tabSpec2.setContent(R.id.pwSearch); // �ι�° �� ����
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
        Tab1 = actionBar.newTab().setText("���̵� ã��");
        Tab2 = actionBar.newTab().setText("��й�ȣ ã��");

        // Set Tab Listeners
        Tab1.setTabListener(new TabListener(fragmentTab1));
        Tab2.setTabListener(new TabListener(fragmentTab2));
 
        // Add tabs to actionbar
        actionBar.addTab(Tab1);
        actionBar.addTab(Tab2);
    }
    //���̵� ã�⿡�� ��ҹ�ư ������ �������� 
    public void idCancel(View v){
    	Intent intent = new Intent(this, MainActivity.class);
    	startActivity(intent);
    }
    //��й�ȣ ã�⿡�� ��ҹ�ư ������ ������
    public void pwCancel(View v){
    	Intent intent = new Intent(this, MainActivity.class);
    	startActivity(intent);
    }
}



