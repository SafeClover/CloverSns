package com.clover.sns;


public class FriendData {
	public String id;
	String image="";
	String name="";
	String birth="";
	
	public FriendData(){}
	
	public FriendData(String id, String name, String image, String birth){
		this.id = id;
		this.image = image;
		this.name = name;
		this.birth = birth;
	}
}
