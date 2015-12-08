package com.hris.portal.form;

import java.util.List;

import org.apache.struts.action.ActionForm;

import com.hris.portal.model.PortalBankBean;
import com.hris.portal.model.PortalBean;
import com.hris.portal.model.PortalCityBean;
import com.hris.portal.model.PortalDepartmentBean;
import com.hris.portal.model.PortalLocationBean;
import com.hris.portal.model.PortalMajorBean;
import com.hris.portal.model.PortalModulBean;
import com.hris.portal.model.PortalPositionBean;
import com.hris.portal.model.PortalPrivilegeBean;
import com.hris.portal.model.PortalProvinceBean;
import com.hris.portal.model.PortalUserBean;
import com.hris.portal.model.PortalMasterRoleBean;

public class PortalForm extends ActionForm{
	
	private List<PortalBean> listPortal;
	private PortalBean portalBean = new PortalBean();
	
	private List<PortalDepartmentBean> listPortalDepartment;
	private PortalDepartmentBean portalDepartmentBean = new PortalDepartmentBean();
	
	private List<PortalUserBean> listUserDepartment;
	private PortalUserBean portalUserBean = new PortalUserBean();
	
	private List<PortalMasterRoleBean> listPortalMasterRole;
	private PortalMasterRoleBean PortalMasterRoleBean = new PortalMasterRoleBean();
	
	private List<PortalMasterRoleBean> listPortalMasterRoleMenu;
	private PortalMasterRoleBean PortalMasterRoleMenu = new PortalMasterRoleBean();
	
	private List<PortalMasterRoleBean> listPortalMasterRolePriv;
	private PortalMasterRoleBean PortalMasterRolePriv = new PortalMasterRoleBean();	

	private List<PortalMasterRoleBean> listPortalMasterRoleGetMenu;
	private PortalMasterRoleBean portalMasterRoleGetMenu = new PortalMasterRoleBean();	

	private List<PortalMasterRoleBean> listPortalMasterRoleGetPriv;
	private PortalMasterRoleBean portalMasterRoleGetPriv = new PortalMasterRoleBean();	
	
	private List<PortalModulBean> listPortalModulBean;
	private PortalModulBean portalModulBean = new PortalModulBean();
	
	private List<PortalBankBean> listPortalBank;
	private PortalBankBean portalBankBean = new PortalBankBean();
	
	private List<PortalCityBean> listPortalCity;
	private PortalCityBean portalCityBean = new PortalCityBean();
	
	private List<PortalLocationBean> listPortalLocation;
	private PortalLocationBean portalLocationBean = new PortalLocationBean();
	
	private List<PortalMajorBean> listPortalMajor;
	private PortalMajorBean portalMajorBean = new PortalMajorBean();
	
	private List<PortalPositionBean> listPortalPosition;
	private PortalPositionBean portalPositionBean = new PortalPositionBean();
	
	private List<PortalProvinceBean> listPortalProvince;
	private PortalProvinceBean portalProvinceBean = new PortalProvinceBean();
	
	private List<PortalPrivilegeBean> listPortalPrivilege;
	private PortalPrivilegeBean portalPrivilegeBean = new PortalPrivilegeBean();
	
	private String isDeleteMasterOthers="0";
	private String task;
	private String id="undefined";
	private String user;
	private String pass;
	private String oldPass;
	private String newPass;
	private String rePass;
	public String userExist;
	public String passExist;
	public String userIdExist;
	private String searchName;
	private String addRoleName;
	private String roleDescription;
	private String selectNewMenu;
	public String[] selectedNewMenu;
	public String[] selectedNewPriv;
	public List viewMenu;
	public List viewPriv;
	private String errorMessage;
	
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getRoleDescription() {
		return roleDescription;
	}
	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}
	public String getUserIdExist() {
		return userIdExist;
	}
	public void setUserIdExist(String userIdExist) {
		this.userIdExist = userIdExist;
	}
	public String getOldPass() {
		return oldPass;
	}
	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}
	public String getNewPass() {
		return newPass;
	}
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	public String getRePass() {
		return rePass;
	}
	public void setRePass(String rePass) {
		this.rePass = rePass;
	}
	public String getUserExist() {
		return userExist;
	}
	public void setUserExist(String userExist) {
		this.userExist = userExist;
	}
	public String getPassExist() {
		return passExist;
	}
	public void setPassExist(String passExist) {
		this.passExist = passExist;
	}
	public String getIsDeleteMasterOthers() {
		return isDeleteMasterOthers;
	}
	public void setIsDeleteMasterOthers(String isDeleteMasterOthers) {
		this.isDeleteMasterOthers = isDeleteMasterOthers;
	}
	public String[] getSelectedNewPriv() {
		return selectedNewPriv;
	}
	public void setSelectedNewPriv(String[] selectedNewPriv) {
		this.selectedNewPriv = selectedNewPriv;
	}
	public List getViewMenu() {
		return viewMenu;
	}
	public void setViewMenu(List viewMenu) {
		this.viewMenu = viewMenu;
	}
	
	public List getViewPriv() {
		return viewPriv;
	}
	public void setViewPriv(List viewPriv) {
		this.viewPriv = viewPriv;
	}
	public String getSelectNewMenu() {
		return selectNewMenu;
	}
	public void setSelectNewMenu(String selectNewMenu) {
		this.selectNewMenu = selectNewMenu;
	}
	public List<PortalMasterRoleBean> getListPortalMasterRoleMenu() {
		return listPortalMasterRoleMenu;
	}
	public String[] getSelectedNewMenu() {
		return selectedNewMenu;
	}
	public void setSelectedNewMenu(String[] selectedNewMenu) {
		this.selectedNewMenu = selectedNewMenu;
	}
	public void setListPortalMasterRoleMenu(
			List<PortalMasterRoleBean> listPortalMasterRoleMenu) {
		this.listPortalMasterRoleMenu = listPortalMasterRoleMenu;
	}
	public List<PortalMasterRoleBean> getListPortalMasterRole() {
		return listPortalMasterRole;
	}
	public void setListPortalMasterRole(
			List<PortalMasterRoleBean> listPortalMasterRole) {
		this.listPortalMasterRole = listPortalMasterRole;
	}
	public List<PortalBankBean> getListPortalBank() {
		return listPortalBank;
	}
	public void setListPortalBank(List<PortalBankBean> listPortalBank) {
		this.listPortalBank = listPortalBank;
	}
	public PortalBankBean getPortalBankBean() {
		return portalBankBean;
	}
	public List<PortalMasterRoleBean> getListPortalMasterRoleGetMenu() {
		return listPortalMasterRoleGetMenu;
	}
	public void setListPortalMasterRoleGetMenu(
			List<PortalMasterRoleBean> listPortalMasterRoleGetMenu) {
		this.listPortalMasterRoleGetMenu = listPortalMasterRoleGetMenu;
	}
	public PortalMasterRoleBean getPortalMasterRoleGetMenu() {
		return portalMasterRoleGetMenu;
	}
	public void setPortalMasterRoleGetMenu(
			PortalMasterRoleBean portalMasterRoleGetMenu) {
		this.portalMasterRoleGetMenu = portalMasterRoleGetMenu;
	}
	public List<PortalMasterRoleBean> getListPortalMasterRoleGetPriv() {
		return listPortalMasterRoleGetPriv;
	}
	public void setListPortalMasterRoleGetPriv(
			List<PortalMasterRoleBean> listPortalMasterRoleGetPriv) {
		this.listPortalMasterRoleGetPriv = listPortalMasterRoleGetPriv;
	}
	public PortalMasterRoleBean getPortalMasterRoleGetPriv() {
		return portalMasterRoleGetPriv;
	}
	public void setPortalMasterRoleGetPriv(
			PortalMasterRoleBean portalMasterRoleGetPriv) {
		this.portalMasterRoleGetPriv = portalMasterRoleGetPriv;
	}
	public void setPortalBankBean(PortalBankBean portalBankBean) {
		this.portalBankBean = portalBankBean;
	}
	public List<PortalCityBean> getListPortalCity() {
		return listPortalCity;
	}
	public void setListPortalCity(List<PortalCityBean> listPortalCity) {
		this.listPortalCity = listPortalCity;
	}
	public PortalCityBean getPortalCityBean() {
		return portalCityBean;
	}
	public void setPortalCityBean(PortalCityBean portalCityBean) {
		this.portalCityBean = portalCityBean;
	}
	public List<PortalLocationBean> getListPortalLocation() {
		return listPortalLocation;
	}
	public void setListPortalLocation(List<PortalLocationBean> listPortalLocation) {
		this.listPortalLocation = listPortalLocation;
	}
	public PortalLocationBean getPortalLocationBean() {
		return portalLocationBean;
	}
	public void setPortalLocationBean(PortalLocationBean portalLocationBean) {
		this.portalLocationBean = portalLocationBean;
	}
	public List<PortalMajorBean> getListPortalMajor() {
		return listPortalMajor;
	}
	public void setListPortalMajor(List<PortalMajorBean> listPortalMajor) {
		this.listPortalMajor = listPortalMajor;
	}
	public PortalMajorBean getPortalMajorBean() {
		return portalMajorBean;
	}
	public void setPortalMajorBean(PortalMajorBean portalMajorBean) {
		this.portalMajorBean = portalMajorBean;
	}
	public List<PortalPositionBean> getListPortalPosition() {
		return listPortalPosition;
	}
	public void setListPortalPosition(List<PortalPositionBean> listPortalPosition) {
		this.listPortalPosition = listPortalPosition;
	}
	public PortalPositionBean getPortalPositionBean() {
		return portalPositionBean;
	}
	public void setPortalPositionBean(PortalPositionBean portalPositionBean) {
		this.portalPositionBean = portalPositionBean;
	}
	public List<PortalProvinceBean> getListPortalProvince() {
		return listPortalProvince;
	}
	public void setListPortalProvince(List<PortalProvinceBean> listPortalProvince) {
		this.listPortalProvince = listPortalProvince;
	}
	public PortalProvinceBean getPortalProvinceBean() {
		return portalProvinceBean;
	}
	public void setPortalProvinceBean(PortalProvinceBean portalProvinceBean) {
		this.portalProvinceBean = portalProvinceBean;
	}
	public List<PortalPrivilegeBean> getListPortalPrivilege() {
		return listPortalPrivilege;
	}
	public void setListPortalPrivilege(List<PortalPrivilegeBean> listPortalPrivilege) {
		this.listPortalPrivilege = listPortalPrivilege;
	}
	public PortalPrivilegeBean getPortalPrivilegeBean() {
		return portalPrivilegeBean;
	}
	public void setPortalPrivilegeBean(PortalPrivilegeBean portalPrivilegeBean) {
		this.portalPrivilegeBean = portalPrivilegeBean;
	}
	public PortalMasterRoleBean getPortalMasterRoleBean() {
		return PortalMasterRoleBean;
	}
	public String getAddRoleName() {
		return addRoleName;
	}
	public void setAddRoleName(String addRoleName) {
		this.addRoleName = addRoleName;
	}
	public void setPortalMasterRoleBean(PortalMasterRoleBean portalMasterRoleBean) {
		PortalMasterRoleBean = portalMasterRoleBean;
	}
	public List<PortalUserBean> getListUserDepartment() {
		return listUserDepartment;
	}
	public void setListUserDepartment(List<PortalUserBean> listUserDepartment) {
		this.listUserDepartment = listUserDepartment;
	}
	public PortalUserBean getPortalUserBean() {
		return portalUserBean;
	}
	public void setPortalUserBean(PortalUserBean portalUserBean) {
		this.portalUserBean = portalUserBean;
	}
	public List<PortalDepartmentBean> getListPortalDepartment() {
		return listPortalDepartment;
	}
	public void setListPortalDepartment(
			List<PortalDepartmentBean> listPortalDepartment) {
		this.listPortalDepartment = listPortalDepartment;
	}
	public PortalDepartmentBean getPortalDepartmentBean() {
		return portalDepartmentBean;
	}
	public void setPortalDepartmentBean(PortalDepartmentBean portalDepartmentBean) {
		this.portalDepartmentBean = portalDepartmentBean;
	}

	public PortalMasterRoleBean getPortalMasterRoleMenu() {
		return PortalMasterRoleMenu;
	}
	public void setPortalMasterRoleMenu(PortalMasterRoleBean portalMasterRoleMenu) {
		PortalMasterRoleMenu = portalMasterRoleMenu;
	}
	public List<PortalMasterRoleBean> getListPortalMasterRolePriv() {
		return listPortalMasterRolePriv;
	}
	public void setListPortalMasterRolePriv(
			List<PortalMasterRoleBean> listPortalMasterRolePriv) {
		this.listPortalMasterRolePriv = listPortalMasterRolePriv;
	}
	public PortalMasterRoleBean getPortalMasterRolePriv() {
		return PortalMasterRolePriv;
	}
	public void setPortalMasterRolePriv(PortalMasterRoleBean portalMasterRolePriv) {
		PortalMasterRolePriv = portalMasterRolePriv;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public List<PortalBean> getListPortal() {
		return listPortal;
	}
	public void setListPortal(List<PortalBean> listPortal) {
		this.listPortal = listPortal;
	}
	public PortalBean getPortalBean() {
		return portalBean;
	}
	public void setPortalBean(PortalBean portalBean) {
		this.portalBean = portalBean;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public List<PortalModulBean> getListPortalModulBean() {
		return listPortalModulBean;
	}
	public void setListPortalModulBean(List<PortalModulBean> listPortalModulBean) {
		this.listPortalModulBean = listPortalModulBean;
	}
	public PortalModulBean getPortalModulBean() {
		return portalModulBean;
	}
	public void setPortalModulBean(PortalModulBean portalModulBean) {
		this.portalModulBean = portalModulBean;
	}

	
}
