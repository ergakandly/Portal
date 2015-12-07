package com.hris.portal.model;

import java.io.Serializable;

public class PortalPositionBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String positionId="";
	private String positionName="";
	private String description="";
	private String positionNameTemp="";
	
	public String getPositionNameTemp() {
		return positionNameTemp;
	}
	public void setPositionNameTemp(String positionNameTemp) {
		this.positionNameTemp = positionNameTemp;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
	
}
