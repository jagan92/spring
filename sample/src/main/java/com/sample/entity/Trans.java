package com.sample.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "trans")
public class Trans {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "trans_id")
	private Long trans_id;
	
	
	@Column(name = "trans_date")
	private String trans_date;
	
	public String gettrans_date() {
		return trans_date;
	}

	public void settrans_date(String trans_date) {
		this.trans_date = trans_date;
	}

	@Column(name = "take_home")
	private String take_home;
	
	public String gettake_home() {
		return take_home;
	}

	public void settake_home(String take_home) {
		this.take_home = take_home;
	}
	
	@Column(name = "consultant_id")
	private String consultantId;
	
	public String getconsultantId() {
		return consultantId;
	}

	public void setconsultantId(String consultantId) {
		this.consultantId = consultantId;
	}
	
	@Column(name = "name")
	private String first_name;
	
	public String getfirst_name() {
		return first_name;
	}

	public void setfirst_name(String first_name) {
		this.first_name = first_name;
	}
	
	@Column(name = "is_paid")
	private char is_paid = 'N';

	public char getIs_paid() {
		return is_paid;
	}

	public void setIs_paid(char is_paid) {
		this.is_paid = is_paid;
	}
	
	@Column(name = "no_days")
	private String no_days;
	
	public String getno_days() {
		return no_days;
	}

	public void setno_days(String no_days) {
		this.no_days = no_days;
	}
	
	@Column(name = "no_hours")
	private String no_hours;
	
	public String getno_hours() {
		return no_hours;
	}

	public void setno_hours(String no_hours) {
		this.no_hours = no_hours;
	}

	
	@Column(name = "tds")
	private String tds;
	
	public String gettds() {
		return tds;
	}

	public void settds(String tds) {
		this.tds = tds;
	}
	
	@Column(name = "gross")
	private String gross;
	
	public String getgross() {
		return gross;
	}

	public void setgross(String gross) {
		this.gross = gross;
	}
}
