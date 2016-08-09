package com.rns.healthplease.web.dao.domain;

// Generated 1 May, 2016 3:04:07 AM by Hibernate Tools 3.4.0.CR1

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * Labs generated by hbm2java
 */
@Entity
@Table(name = "labs")
public class Labs implements java.io.Serializable {

	private Integer id;
	private String mobileNo;
	private String address;
	private String labName;
	private String associateLocation;
	private String associateUsers;
	private String labDetails;
	private short pickCharge;
	private byte bookAppPerSlot;
	private String labEmail;
	private Integer createdBy;
	private Date createdDate;
	private Date updatedBy;
	private Date updatedDate;
	private Integer isDeleted;
	private int deletedBy;
	private Date deletedOn;
	private Set<LabLocations> labses = new HashSet<LabLocations>(0);
	private Set<TestLabs> testLabs = new HashSet<TestLabs>(0);
	private Set<Appointments> appointments = new HashSet<Appointments>(0);
	private Set<LabBlockedSlots> blockedSlots = new HashSet<LabBlockedSlots>(0);
	//private Set<LabActiveDaysStatus> labActiveDaysStatus = new HashSet<LabActiveDaysStatus>(0);
	private Locations location;
	private Integer labDiscount;

	public Labs() {
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "mobile_no", nullable = false, length = 100)
	public String getMobileNo() {
		return this.mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	@Column(name = "address", nullable = false, length = 250)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "lab_name", nullable = false, length = 100)
	public String getLabName() {
		return this.labName;
	}

	public void setLabName(String labName) {
		this.labName = labName;
	}

	@Column(name = "associate_location", nullable = false, length = 50)
	public String getAssociateLocation() {
		return this.associateLocation;
	}

	public void setAssociateLocation(String associateLocation) {
		this.associateLocation = associateLocation;
	}

	@Column(name = "associate_users", nullable = false, length = 50)
	public String getAssociateUsers() {
		return this.associateUsers;
	}

	public void setAssociateUsers(String associateUsers) {
		this.associateUsers = associateUsers;
	}

	@Column(name = "lab_details", nullable = false, length = 250)
	public String getLabDetails() {
		return this.labDetails;
	}

	public void setLabDetails(String labDetails) {
		this.labDetails = labDetails;
	}

	@Column(name = "pick_charge", nullable = false)
	public short getPickCharge() {
		return this.pickCharge;
	}

	public void setPickCharge(short pickCharge) {
		this.pickCharge = pickCharge;
	}

	@Column(name = "book_app_per_slot", nullable = false)
	public byte getBookAppPerSlot() {
		return this.bookAppPerSlot;
	}

	public void setBookAppPerSlot(byte bookAppPerSlot) {
		this.bookAppPerSlot = bookAppPerSlot;
	}

	@Column(name = "lab_email", nullable = false, length = 500)
	public String getLabEmail() {
		return this.labEmail;
	}

	public void setLabEmail(String labEmail) {
		this.labEmail = labEmail;
	}

	@Column(name = "created_by")
	public Integer getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	@Column(name = "created_date", length = 19)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "updated_by", length = 19)
	public Date getUpdatedBy() {
		return this.updatedBy;
	}

	public void setUpdatedBy(Date updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Column(name = "updated_date", length = 19)
	public Date getUpdatedDate() {
		return this.updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	@Column(name = "is_deleted")
	public Integer getIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Column(name = "deleted_by", nullable = false)
	public int getDeletedBy() {
		return this.deletedBy;
	}

	public void setDeletedBy(int deletedBy) {
		this.deletedBy = deletedBy;
	}

	@Column(name = "deleted_on", nullable = false, length = 19)
	public Date getDeletedOn() {
		return this.deletedOn;
	}

	public void setDeletedOn(Date deletedOn) {
		this.deletedOn = deletedOn;
	}

	@OneToMany(mappedBy = "labs")
	@NotFound(action = NotFoundAction.IGNORE)
	public Set<LabLocations> getLabses() {
		return labses;
	}

	public void setLabses(Set<LabLocations> labses) {
		this.labses = labses;
	}

	@OneToMany(mappedBy = "lab")
	@NotFound(action = NotFoundAction.IGNORE)
	public Set<TestLabs> getTestLabs() {
		return testLabs;
	}

	public void setTestLabs(Set<TestLabs> testLabs) {
		this.testLabs = testLabs;
	}
	
	@OneToMany(mappedBy = "lab")
	@OrderBy(value="id DESC")
	public Set<Appointments> getAppointments() {
		return appointments;
	}

	public void setAppointments(Set<Appointments> appointments) {
		this.appointments = appointments;
	}

	@OneToMany(mappedBy = "lab")
	public Set<LabBlockedSlots> getBlockedSlots() {
		return blockedSlots;
	}

	public void setBlockedSlots(Set<LabBlockedSlots> blockedSlots) {
		this.blockedSlots = blockedSlots;
	}

	@ManyToOne(cascade = CascadeType.MERGE)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "lab_location_id")
	public Locations getLocation() {
		return location;
	}

	public void setLocation(Locations location) {
		this.location = location;
	}

	@Column(name = "lab_discount")
	public Integer getLabDiscount() {
		return labDiscount;
	}

	public void setLabDiscount(Integer labDiscount) {
		this.labDiscount = labDiscount;
	}

	/*@OneToMany(mappedBy = "labs", cascade = CascadeType.ALL)
	public Set<LabActiveDaysStatus> getLabActiveDaysStatus() {
		return labActiveDaysStatus;
	}

	public void setLabActiveDaysStatus(Set<LabActiveDaysStatus> labActiveDaysStatus) {
		this.labActiveDaysStatus = labActiveDaysStatus;
	}*/

}
