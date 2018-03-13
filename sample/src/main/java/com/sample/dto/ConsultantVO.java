package com.sample.dto;

import org.apache.commons.beanutils.BeanUtils;

import com.sample.entity.Consultant;

public class ConsultantVO {

	private Long id;
	private String email;
	private String first_name;
	private String middle_name;
	private String last_name;
	private String a_first_name;
	private String a_middle_name;
	private String a_last_name;
	private String add_street;
	private String add_lane;
	private String add_city;
	private String add_state;
	private String add_pin;
	private String add_country;
	private String ph_number;
	private String alter_ph_number;
	private String aadhar_number;
	private String pan_number;
	private String rate_per;
	private String salary;
	private String bank_name;
	private String ac_holder_name;
	private String acc_number;
	private String ifsc_code;
	private String branch;
	private String skill;
	private String client;
	private String location;
	private String vendor;
	private String hour_day;

	private String day;
	
	
	public ConsultantVO() {
		
	}
	
	public ConsultantVO(Consultant consultant) {
		try {
			BeanUtils.copyProperties(this, consultant);
		} catch(Exception e) {
			
		}
	}

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

	public String getA_first_name() {
		return a_first_name;
	}

	public void setA_first_name(String a_first_name) {
		this.a_first_name = a_first_name;
	}

	public String getA_middle_name() {
		return a_middle_name;
	}

	public void setA_middle_name(String a_middle_name) {
		this.a_middle_name = a_middle_name;
	}

	public String getA_last_name() {
		return a_last_name;
	}

	public void setA_last_name(String a_last_name) {
		this.a_last_name = a_last_name;
	}

	public String getAdd_street() {
		return add_street;
	}

	public void setAdd_street(String add_street) {
		this.add_street = add_street;
	}

	public String getAdd_lane() {
		return add_lane;
	}

	public void setAdd_lane(String add_lane) {
		this.add_lane = add_lane;
	}

	public String getAdd_city() {
		return add_city;
	}

	public void setAdd_city(String add_city) {
		this.add_city = add_city;
	}

	public String getAdd_state() {
		return add_state;
	}

	public void setAdd_state(String add_state) {
		this.add_state = add_state;
	}

	public String getAdd_pin() {
		return add_pin;
	}

	public void setAdd_pin(String add_pin) {
		this.add_pin = add_pin;
	}

	public String getAdd_country() {
		return add_country;
	}

	public void setAdd_country(String add_country) {
		this.add_country = add_country;
	}

	public String getPh_number() {
		return ph_number;
	}

	public void setPh_number(String ph_number) {
		this.ph_number = ph_number;
	}

	public String getAlter_ph_number() {
		return alter_ph_number;
	}

	public void setAlter_ph_number(String alter_ph_number) {
		this.alter_ph_number = alter_ph_number;
	}

	public String getAadhar_number() {
		return aadhar_number;
	}

	public void setAadhar_number(String aadhar_number) {
		this.aadhar_number = aadhar_number;
	}

	public String getPan_number() {
		return pan_number;
	}

	public void setPan_number(String pan_number) {
		this.pan_number = pan_number;
	}

	public String getRate_per() {
		return rate_per;
	}

	public void setRate_per(String rate_per) {
		this.rate_per = rate_per;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAc_holder_name() {
		return ac_holder_name;
	}

	public void setAc_holder_name(String ac_holder_name) {
		this.ac_holder_name = ac_holder_name;
	}

	public String getAcc_number() {
		return acc_number;
	}

	public void setAcc_number(String acc_number) {
		this.acc_number = acc_number;
	}

	public String getIfsc_code() {
		return ifsc_code;
	}

	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getvendor() {
		return vendor;
	}

	public void setvendor(String vendor) {
		this.vendor = vendor;
	}

	
	public String getHour_day() {
		return hour_day;
	}

	public void sethour_day(String hour_day) {
		this.hour_day = hour_day;
	}
	
	
	public String getDay() {
		return day;
	}

	public void setday(String day) {
		this.day = day;
	}

	}

