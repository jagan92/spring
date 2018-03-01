package com.sample.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "Trans")
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

}
