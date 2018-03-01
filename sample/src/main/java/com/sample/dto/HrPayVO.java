package com.sample.dto;

public class HrPayVO {

	private Long consultantId;
	private String email;
	private String first_name;
	private String middle_name;
	private String last_name;
	private String rate_per;
	private String hour_day;
	private String day;
	private int salary;
	private Long trans_id;
	private String trans_date;
	private String take_home;


	public Long getConsultantId() {
		return consultantId;
	}

	public void setConsultantId(Long consultantId) {
		this.consultantId = consultantId;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getMiddle_name() {
		return middle_name;
	}

	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	
	
	public int getsalary() {
		return salary;
	}

	public void setsalary(int salary) {
		this.salary = salary;
	}
	
	
	public String getrate_per() {
		return rate_per;
	}

	public void setrate_per(String rate_per) {
		this.rate_per = rate_per;
	}

	
	public String gethour_day() {
		return hour_day;
	}

	public void sethour_day(String hour_day) {
		this.hour_day = hour_day;
	}
	
	
	public String getday() {
		return day;
	}

	public void setday(String day) {
		this.day = day;
	}
	
	
	
	
	
	public Long gettrans_id() {
		return trans_id;
	}

	public void settrans_id(Long trans_id) {
		this.trans_id = trans_id;
	}



	public String gettrans_date() {
		return trans_date;
	}

	public void settrans_date(String trans_date) {
		this.trans_date = trans_date;
	}
	
	public String gettake_home() {
		return take_home;
	}

	public void settake_home(String take_home) {
		this.take_home = take_home;
	}
	
	
	
	
	
	
	
	
	
	
}
