package com.hris.portal.model;

import java.io.Serializable;

public class PortalBankBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String bankId="";
	private String bankName="";
	private String description="";
	private String bankNameTemp="";
	
	public String getBankNameTemp() {
		return bankNameTemp;
	}
	public void setBankNameTemp(String bankNameTemp) {
		this.bankNameTemp = bankNameTemp;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBankId() {
		return bankId;
	}
	public void setBankId(String bankId) {
		this.bankId = bankId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	
}
