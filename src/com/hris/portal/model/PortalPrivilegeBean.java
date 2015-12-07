package com.hris.portal.model;

import java.io.Serializable;

public class PortalPrivilegeBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String privilegeId="";
	private String privilegeName="";
	private String description="";
	private String privilegeNameTemp="";
	
	public String getPrivilegeNameTemp() {
		return privilegeNameTemp;
	}
	public void setPrivilegeNameTemp(String privilegeNameTemp) {
		this.privilegeNameTemp = privilegeNameTemp;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrivilegeId() {
		return privilegeId;
	}
	public void setPrivilegeId(String privilegeId) {
		this.privilegeId = privilegeId;
	}
	public String getPrivilegeName() {
		return privilegeName;
	}
	public void setPrivilegeName(String privilegeName) {
		this.privilegeName = privilegeName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
