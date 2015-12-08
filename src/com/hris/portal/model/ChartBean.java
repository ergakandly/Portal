package com.hris.portal.model;

import java.math.BigDecimal;

public class ChartBean {

	private String departmentName;
	private String totalPresence;
	private String totalEmployee;
	private Double average;
	private String description;
	
	public Double getAverage() {
		return average;
	}
	public void setAverage(Double average) {
		this.average = average;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getTotalPresence() {
		return totalPresence;
	}
	public void setTotalPresence(String totalPresence) {
		this.totalPresence = totalPresence;
	}
	public String getTotalEmployee() {
		return totalEmployee;
	}
	public void setTotalEmployee(String totalEmployee) {
		this.totalEmployee = totalEmployee;
	}
	
	
	
}
