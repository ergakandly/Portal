package com.hris.portal.model;

import java.io.Serializable;

public class PortalDepartmentBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String departmentId="";
	private String msDepartmentName="";
	private String locationId;
	private String deptEmployeeName;
	private String dateOfBirth;
	private String description="";
	private String msDepartmentNameTemp="";
	
	public String getMsDepartmentNameTemp() {
		return msDepartmentNameTemp;
	}
	public void setMsDepartmentNameTemp(String msDepartmentNameTemp) {
		this.msDepartmentNameTemp = msDepartmentNameTemp;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getDeptEmployeeName() {
		return deptEmployeeName;
	}
	public void setDeptEmployeeName(String deptEmployeeName) {
		this.deptEmployeeName = deptEmployeeName;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public String getMsDepartmentName() {
		return msDepartmentName;
	}
	public void setMsDepartmentName(String msDepartmentName) {
		this.msDepartmentName = msDepartmentName;
	}
}
