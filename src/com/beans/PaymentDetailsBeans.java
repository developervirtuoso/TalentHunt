package com.beans;

public class PaymentDetailsBeans {
	private int id=0;
	private int userid=0;
	private String amount="0";
	private int status=0;
	private String date="0";
	private String payment_by="0";
	private String transition_id="0";
	private String datetime="0";
	private String username="0";
	private String token="0";
	private String paymentid="0";
	private String currency="0";
	private String stripeStatus="0";
	private String paymentMethod="0";
	
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getPaymentid() {
		return paymentid;
	}
	public void setPaymentid(String paymentid) {
		this.paymentid = paymentid;
	}
	
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getStripeStatus() {
		return stripeStatus;
	}
	public void setStripeStatus(String stripeStatus) {
		this.stripeStatus = stripeStatus;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPayment_by() {
		return payment_by;
	}
	public void setPayment_by(String payment_by) {
		this.payment_by = payment_by;
	}
	public String getTransition_id() {
		return transition_id;
	}
	public void setTransition_id(String transition_id) {
		this.transition_id = transition_id;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
	
}
