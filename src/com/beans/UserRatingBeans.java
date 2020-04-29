package com.beans;

public class UserRatingBeans {
	private int id=0;
	private int userid=0;
	private int judgeid=0;
	private int status=0;
	private String rating="0";
	private String jadgename="0";
	private String comment="0";
	private String userName="0";
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getJudgeid() {
		return judgeid;
	}
	public void setJudgeid(int judgeid) {
		this.judgeid = judgeid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getJadgename() {
		return jadgename;
	}
	public void setJadgename(String jadgename) {
		this.jadgename = jadgename;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
