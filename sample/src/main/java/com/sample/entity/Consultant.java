package com.sample.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "consultant")
public class Consultant {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "consultant_id")
	private Long id;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "first_name")
	private String first_name;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getfirst_name() {
		return first_name;
	}

	public void setfirst_name(String first_name) {
		this.first_name = first_name;
	}
	
	
	@Column(name = "middle_name")
	private String middle_name;
	
	public String getmiddle_name() {
		return middle_name;
	}

	public void setmiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	
	
	@Column(name = "last_name")
	private String last_name;
	
	public String getlast_name() {
		return last_name;
	}

	public void setlast_name(String last_name) {
		this.last_name = last_name;
	}
	
	
	@Column(name = "a_first_name")
	private String a_first_name;
	
	public String geta_first_name() {
		return a_first_name;
	}

	public void seta_first_name(String a_first_name) {
		this.a_first_name = a_first_name;
	}
	
	
	
	@Column(name = "a_middle_name")
	private String a_middle_name;
	
	public String geta_middle_name() {
		return a_middle_name;
	}

	public void seta_middle_name(String a_middle_name) {
		this.a_middle_name = a_middle_name;
	}
	
	
	@Column(name = "a_last_name")
	private String a_last_name;
	
	public String geta_last_name() {
		return a_last_name;
	}

	public void seta_last_name(String a_last_name) {
		this.a_last_name = a_last_name;
	}
	
	
	
	@Column(name = "add_street")
	private String add_street;
	
	public String getadd_street() {
		return add_street;
	}

	public void setadd_street(String add_street) {
		this.add_street = add_street;
	}
	
	
	@Column(name = "add_lane")
	private String add_lane;
	
	public String getadd_lane() {
		return add_lane;
	}

	public void setadd_lane(String add_lane) {
		this.add_lane = add_lane;
	}
	
	
	
	@Column(name = "add_city")
	private String add_city;
	
	public String getadd_city() {
		return add_city;
	}

	public void setadd_city(String add_city) {
		this.add_city = add_city;
	}
	
	
	
	@Column(name = "add_state")
	private String add_state;
	
	public String getadd_state() {
		return add_state;
	}

	public void setadd_state(String add_state) {
		this.add_state = add_state;
	}
	
	
	@Column(name = "add_pin")
	private String add_pin;
	
	public String getadd_pin() {
		return add_pin;
	}

	public void setadd_pin(String add_pin) {
		this.add_pin = add_pin;
	}
	
	@Column(name = "add_country")
	private String add_country;
	
	public String getadd_country() {
		return add_country;
	}

	public void setadd_country(String add_country) {
		this.add_country = add_country;
	}
	
	@Column(name = "ph_number")
	private String ph_number;
	
	public String getph_number() {
		return ph_number;
	}

	public void setph_number(String ph_number) {
		this.ph_number = ph_number;
	}
	
	

	@Column(name = "alter_ph_number")
	private String alter_ph_number;
	
	public String getalter_ph_number() {
		return alter_ph_number;
	}

	public void setalter_ph_number(String alter_ph_number) {
		this.alter_ph_number = alter_ph_number;
	}
	
	
@Column(name = "aadhar_number")
	private int aadhar_number;
	
	public int getaadhar_number() {
		return aadhar_number;
	}

	public void setaadhar_number(int aadhar_number) {
		this.aadhar_number = aadhar_number;
	}
	
	@Column(name = "pan_number")
	private int pan_number;
	
	public int getpan_number() {
		return pan_number;
	}

	public void setpan_number(int pan_number) {
		this.pan_number = pan_number;
	}
	
/*	@Column(name = "day")
	private int day;
	
	public int getday() {
		return day;
	}

	public void setday(int day) {
		this.day = day;
	}*/
	
	
	
	@Column(name = "rate_per")
	private String rate_per;
	
	public String getrate_per() {
		return rate_per;
	}

	public void setrate_per(String rate_per) {
		this.rate_per = rate_per;
	}
	
	@Column(name = "salary")
	private int salary;
	
	public int getsalary() {
		return salary;
	}

	public void setsalary(int salary) {
		this.salary = salary;
	}
	
	
	@Column(name = "bank_name")
	private String bank_name;
	
	public String getbank_name() {
		return bank_name;
	}

	public void setbank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	
	
	@Column(name = "ac_holder_name")
	private String ac_holder_name;
	
	public String getac_holder_name() {
		return ac_holder_name;
	}

	public void setac_holder_name(String ac_holder_name) {
		this.ac_holder_name = ac_holder_name;
	}
	
	
	@Column(name = "acc_number")
	private int acc_number;
	
	public int getacc_number() {
		return acc_number;
	}

	public void setacc_number(int acc_number) {
		this.acc_number = acc_number;
	}
	
	
	
	
	@Column(name = "ifsc_code")
	private int ifsc_code;
	
	public int getifsc_code() {
		return ifsc_code;
	}

	public void setifsc_code(int ifsc_code) {
		this.ifsc_code = ifsc_code;
	}
	
	@Column(name = "branch")
	private String branch;
	
	public String getbranch() {
		return branch;
	}

	public void setbranch(String branch) {
		this.branch = branch;
	}
	
	@Column(name = "skill")
	private String skill;
	
	public String getskill() {
		return skill;
	}

	public void setskill(String skill) {
		this.skill = skill;
	}
	
	@Column(name = "client")
	private String client;
	
	public String getclient() {
		return client;
	}

	public void setclient(String client) {
		this.client = client;
	}
	
	@Column(name = "locat")
	private String locat;
	
	public String getlocat() {
		return locat;
	}

	public void setlocat(String locat) {
		this.locat = locat;
	
	}
	@Column(name = "location")
	private String location;
	
	public String getlocation() {
		return location;
	}

	public void setlocation(String location) {
		this.location = location;
		
		
	}
	

	@Column(name = "vendor")
	private String vendor;
	
	public String getvendor() {
		return vendor;
	}

	public void setvendor(String vendor) {
		this.vendor = vendor;
		
		
	}
	
	
	@Column(name = "hour_day")
	private String hour_day;
	
	public String gethour_day() {
		return hour_day;
	}

	public void sethour_day(String hour_day) {
		this.hour_day = hour_day;
		
		
	}
	
	
	@Column(name = "day")
	private String day;
	
	public String getday() {
		return day;
	}

	public void setday(String day) {
		this.day = day;
		
		
	}
	
}
