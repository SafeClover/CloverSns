package com.clover.function;

import android.graphics.Bitmap;

public class Secondpage_Sub_ListItem {
	private int ourclover_upno;
	private Bitmap ourclover_img;
	private String ourclover_subject;
	private String ourclover_name;
	
	public int getOurclover_upno() {
		return ourclover_upno;
	}

	public void setOurclover_upno(int ourclover_upno) {
		this.ourclover_upno = ourclover_upno;
	}

	public Secondpage_Sub_ListItem(Bitmap mypage_img, String mypage_subject, String mypage_name, int ourclover_upno){
		this.ourclover_img = mypage_img;
		this.ourclover_subject = mypage_subject;
		this.ourclover_name = mypage_name;
		this.ourclover_upno = ourclover_upno;
	}

	public Bitmap getOurclover_img() {
		return ourclover_img;
	}

	public void setOurclover_img(Bitmap ourclover_img) {
		this.ourclover_img = ourclover_img;
	}

	public String getOurclover_subject() {
		return ourclover_subject;
	}

	public void setOurclover_subject(String ourclover_subject) {
		this.ourclover_subject = ourclover_subject;
	}

	public String getOurclover_name() {
		return ourclover_name;
	}

	public void setOurclover_name(String ourclover_name) {
		this.ourclover_name = ourclover_name;
	}
	
}
