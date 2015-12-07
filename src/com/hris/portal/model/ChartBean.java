package com.hris.portal.model;

import java.math.BigDecimal;

public class ChartBean {

	private String departmentName;
	private String totalPresence;
	private String totalEmployee;
	private Double averageAttendance;
	


	public Double getAverageAttendance() {
		return averageAttendance;
	}
	public void setAverageAttendance(Double averageAttendance) {
		this.averageAttendance = averageAttendance;
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
