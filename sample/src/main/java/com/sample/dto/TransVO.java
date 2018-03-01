package com.sample.dto;

public class TransVO {

	private Long consultantId;
	private Long trans_id;
	private String first_name;
	private String trans_date;
	private String take_home;

	
	public Long getConsultantId() {
		return consultantId;
	}

	public void setConsultantId(Long consultantId) {
		this.consultantId = consultantId;
	}
	
	public Long gettrans_id() {
		return trans_id;
	}

	public void settrans_id(Long trans_id) {
		this.trans_id = trans_id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
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
