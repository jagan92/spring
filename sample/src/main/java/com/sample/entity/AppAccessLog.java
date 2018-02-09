package com.sample.entity;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

import com.sample.entity.base.BaseEntity;

@Entity
@Table(name = "app_access_log")
@AttributeOverrides({ @AttributeOverride(name = "id", column = @Column(name = "app_access_log_id")) })
public class AppAccessLog extends BaseEntity{

	private static final long serialVersionUID = 3300477379575828483L;

	public static final String STATUS_SUCCESS = "Success";
	public static final String STATUS_BAD_CREDENTIALS = "Bad Credentials";

	@Column(name = "session_id", length = 50, nullable = false)
	private String sessionId = null;

	@Column(name = "login_id", length = 80, nullable = false)
	private String loginId = null;

	@Column(name = "client_ip", length = 20)
	private String clientIp = null;

	@Column(name = "client_local_ip", length = 20)
	private String clientLocalIp = null;

	@Column(name = "client_os", length = 50)
	private String clientOS = null;

	@Column(name = "client_browser", length = 50)
	private String clientBrowser = null;

	@Column(name = "status", length = 80, nullable = false)
	private String status = null;

	public AppAccessLog() {
	}

	public AppAccessLog(String sessionId, String loginId, String clientIp, String clientLocalIp, String clientOS,
			String clientBrowser, String status) {
		this.sessionId = sessionId;
		this.loginId = loginId;
		this.clientIp = clientIp;
		this.clientLocalIp = clientLocalIp;
		this.clientOS = clientOS;
		this.clientBrowser = clientBrowser;
		this.status = status;
	}

	/********************** hashcode, and equals methods **********************/

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(this.getId()).hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || obj.getClass() != getClass()) {
			return false;
		}
		AppAccessLog other = (AppAccessLog) obj;
		return new EqualsBuilder().append(this.getId(), other.getId()).isEquals();
	}

	/********************** Getters and Setters **********************/

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public String getClientLocalIp() {
		return clientLocalIp;
	}

	public void setClientLocalIp(String clientLocalIp) {
		this.clientLocalIp = clientLocalIp;
	}

	public String getClientOS() {
		return clientOS;
	}

	public void setClientOS(String clientOS) {
		this.clientOS = clientOS;
	}

	public String getClientBrowser() {
		return clientBrowser;
	}

	public void setClientBrowser(String clientBrowser) {
		this.clientBrowser = clientBrowser;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
