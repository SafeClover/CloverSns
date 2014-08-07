package com.clover.function;

import android.graphics.Bitmap;

public class Firstpage_Sub_ListItem {
	private Bitmap mypage_img;
	private String mypage_title;
	private String mypage_name;
	private String mypage_regdate;
	private int mypage_upno;
	private String mypage_content;
	
	public Firstpage_Sub_ListItem(Bitmap mypage_img, String mypage_title, 
			String mypage_name, String mypage_regdate, int mypage_upno, String mypage_content){
		this.mypage_img = mypage_img;
		this.mypage_title = mypage_title;
		this.mypage_name = mypage_name;
		this.mypage_regdate = mypage_regdate;
		this.mypage_upno = mypage_upno;
		this.mypage_content = mypage_content;
	}
	
	public Bitmap getMypage_img() {
		return mypage_img;
	}

	public void setMypage_img(Bitmap mypage_img) {
		this.mypage_img = mypage_img;
	}

	public String getMypage_title() {
		return mypage_title;
	}

	public void setMypage_title(String mypage_title) {
		this.mypage_title = mypage_title;
	}

	public String getMypage_name() {
		return mypage_name;
	}

	public void setMypage_name(String mypage_name) {
		this.mypage_name = mypage_name;
	}

	public String getMypage_regdate() {
		return mypage_regdate;
	}

	public void setMypage_regdate(String mypage_regdate) {
		this.mypage_regdate = mypage_regdate;
	}

	public int getMypage_upno() {
		return mypage_upno;
	}

	public void setMypage_upno(int mypage_upno) {
		this.mypage_upno = mypage_upno;
	}

	public String getMypage_content() {
		return mypage_content;
	}

	public void setMypage_content(String mypage_content) {
		this.mypage_content = mypage_content;
	}
}
