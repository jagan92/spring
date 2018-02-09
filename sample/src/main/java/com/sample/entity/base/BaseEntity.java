package com.sample.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.Version;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.joda.time.DateTime;
import org.springframework.data.domain.Auditable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.sample.entity.User;
import com.sample.utils.EncryptionUtils;

@MappedSuperclass
@EntityListeners({ AuditingEntityListener.class })
public class BaseEntity implements Auditable<User, Long> {

  private static final long serialVersionUID = 8061880944976007326L;

  @Id
  @GeneratedValue
  private Long id;

  @Transient
  private String encryptedId;

  @Version
  @Column(name = "optlock_version")
  private Integer optLockVersion;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "created_by", nullable = false)
  private User createdBy;

  @Temporal(TemporalType.TIMESTAMP)
  @Column(name = "created_date", nullable = false)
  private Date createdDate;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "modified_by", nullable = false)
  private User lastModifiedBy;

  @Temporal(TemporalType.TIMESTAMP)
  @Column(name = "modified_date", nullable = false)
  private Date lastModifiedDate;

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
    BaseEntity other = (BaseEntity) obj;
    return new EqualsBuilder().append(this.getId(), other.getId()).isEquals();
  }

  /********************** toString methods **********************/

  @Override
  public String toString() {
    return String.format("%s [id = %d]", this.getClass().getName(), this.getId());
  }

  /********************** Transient **********************/

  @Transient
  public boolean isNew() {
    return null == getId();
  }

  /********************** Getters and Setters **********************/

  public Long getId() {
    return id;
  }

  protected void setId(final Long id) {
    this.id = id;
  }

  public String getEncryptedId() {
    if (encryptedId == null) {
      setEncryptedId(EncryptionUtils.encryptId(id));
    }
    return encryptedId;
  }

  protected void setEncryptedId(final String encryptedId) {
    this.encryptedId = encryptedId;
  }

  public Integer getOptLockVersion() {
    return optLockVersion;
  }

  public void setOptLockVersion(final Integer optLockVersion) {
    this.optLockVersion = optLockVersion;
  }

  public User getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(final User createdBy) {
    this.createdBy = createdBy;
  }

  public DateTime getCreatedDate() {
    return null == createdDate ? null : new DateTime(createdDate);
  }

  public void setCreatedDate(final DateTime createdDate) {
    this.createdDate = null == createdDate ? null : createdDate.toDate();
  }

  public User getLastModifiedBy() {
    return lastModifiedBy;
  }

  public void setLastModifiedBy(final User lastModifiedBy) {
    this.lastModifiedBy = lastModifiedBy;
  }

  public DateTime getLastModifiedDate() {
    return null == lastModifiedDate ? null : new DateTime(lastModifiedDate);
  }

  public void setLastModifiedDate(final DateTime lastModifiedDate) {
    this.lastModifiedDate = null == lastModifiedDate ? null : lastModifiedDate.toDate();
  }

}
