package com.sample.dto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.springframework.beans.BeanUtils;

import com.sample.dto.base.BaseVO;
import com.sample.entity.User;
import com.sample.entity.UserProfile;

public class UserVO extends BaseVO {

	private static final long serialVersionUID = 1L;

	private String firstName;
	private String lastName;
	private String loginId;
	private String password;
	private Long roleId;
	private String rolename;
	private Long userId;
	private Long tenantId;
	private String type;

	private String mobileNumber;
	private String aadharNumber;
	private String address;
	private String city;
	private String state;

	private String country;
	private Map<String, String> userTypes = null;
	private Map<String, String> tenantName = null;
	private Map<Long, String> userRole = null;

	public UserVO() {

	}
	
	public UserVO(User user) {
		BeanUtils.copyProperties(user, this);
		this.setId(user.getId());
	}

	/********************** HashCode, and equals methods **********************/

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(this.getId()).hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || obj.getClass() != getClass()) {
			return false;
		}
		UserVO other = (UserVO) obj;
		return new EqualsBuilder().append(this.getId(), other.getId()).isEquals();
	}

	/********************** Getters and Setters **********************/
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getTenantId() {
		return tenantId;
	}

	public void setTenantId(Long tenantId) {
		this.tenantId = tenantId;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getAadharNumber() {
		return aadharNumber;
	}

	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Map<String, String> getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(Map<String, String> userTypes) {
		this.userTypes = userTypes;
	}

	public Map<String, String> getTenantName() {
		return tenantName;
	}

	public void setTenantName(Map<String, String> tenantName) {
		this.tenantName = tenantName;
	}

	public Map<Long, String> getUserRole() {
		return userRole;
	}

	public void setUserRole(Map<Long, String> userRole) {
		this.userRole = userRole;
	}
}
