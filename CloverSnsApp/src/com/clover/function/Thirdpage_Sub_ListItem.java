package com.clover.function;

import android.graphics.Bitmap;

public class Thirdpage_Sub_ListItem {
	private Bitmap contest_img;
	private String contest_subject;
	private String contest_name;
	private int contest_upno;
	
	public int getContest_upno() {
		return contest_upno;
	}

	public void setContest_upno(int contest_upno) {
		this.contest_upno = contest_upno;
	}

	public Thirdpage_Sub_ListItem(Bitmap contest_img, String contest_subject, 
			String contest_name, int contest_upno){
		this.contest_img = contest_img;
		this.contest_subject = contest_subject;
		this.contest_name = contest_name;
		this.contest_upno = contest_upno;
	}

	public Bitmap getContest_img() {
		return contest_img;
	}


	public void setContest_img(Bitmap contest_img) {
		this.contest_img = contest_img;
	}


	public String getContest_subject() {
		return contest_subject;
	}


	public void setContest_subject(String contest_subject) {
		this.contest_subject = contest_subject;
	}


	public String getContest_name() {
		return contest_name;
	}


	public void setContest_name(String contest_name) {
		this.contest_name = contest_name;
	}
	
}
