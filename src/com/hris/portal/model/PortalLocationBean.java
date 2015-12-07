package com.hris.portal.model;

import java.io.Serializable;

public class PortalLocationBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String locationId="";
	private String locationName="";
	private String description="";
	private String locationNameTemp="";
	
	public String getLocationNameTemp() {
		return locationNameTemp;
	}
	public void setLocationNameTemp(String locationNameTemp) {
		this.locationNameTemp = locationNameTemp;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	
	
}
