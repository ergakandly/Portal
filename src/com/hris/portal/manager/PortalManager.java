package com.hris.portal.manager;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hris.portal.exception.PortalException;
import com.hris.portal.ibatis.IbatisHelper;
import com.hris.portal.model.PortalBankBean;
import com.hris.portal.model.PortalBean;
import com.hris.portal.model.PortalCityBean;
import com.hris.portal.model.PortalDepartmentBean;
import com.hris.portal.model.PortalLocationBean;
import com.hris.portal.model.PortalMajorBean;
import com.hris.portal.model.PortalMasterRoleBean;
import com.hris.portal.model.PortalModulBean;
import com.hris.portal.model.PortalPositionBean;
import com.hris.portal.model.PortalPrivilegeBean;
import com.hris.portal.model.PortalProvinceBean;
import com.hris.portal.model.PortalUserBean;
import com.ibatis.sqlmap.client.SqlMapClient;

public class PortalManager {
	private SqlMapClient ibatis;

	public PortalManager() {
		ibatis = new IbatisHelper().getSqlMapInstance();
	}

	// ASSIGN ROLE

	public List<PortalBean> getEmployee(String searchName, String departmentId) {
		List<PortalBean> list = null;

		Map<String,String> map = new HashMap<String,String>();
		map.put("searchName", searchName);
		map.put("departmentId", departmentId);

		System.out.println("Search Name: " + searchName);
		System.out.println("Department ID: " + departmentId);

		try {
			list = ibatis.queryForList("employees.getEmployee", map);
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public PortalDepartmentBean getOneEmployee(String empId) {
		PortalDepartmentBean portalDeptBean = null;

		try {
			portalDeptBean = (PortalDepartmentBean) ibatis.queryForObject("employees.getOneEmp", empId);
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return portalDeptBean;
	}

	public List<PortalBean> getRoleName() {
		List<PortalBean> list = null;

		try {
			list = ibatis.queryForList("employees.getRoleName", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<PortalUserBean> getUserList() {
		List<PortalUserBean> list = null;

		try {
			list = ibatis.queryForList("employees.getUserList", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<PortalDepartmentBean> getDepartmentName() {
		List<PortalDepartmentBean> list = null;

		try {
			list = ibatis.queryForList("employees.getDepartmentName", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<PortalBean> getRoleList() {
		List<PortalBean> list = null;

		try {
			list = ibatis.queryForList("employees.getRoleList", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void insertUser(String userName, String pass, String empId, String roleId) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("userName", userName);
		map.put("pass", pass);
		map.put("empId", empId);
		map.put("roleId", roleId);

		System.out.println("\n\nDi manager Insert");
		System.out.println(userName);
		System.out.println(pass);
		System.out.println(empId);
		System.out.println(roleId);

		try {
			ibatis.startTransaction();
			ibatis.insert("employees.insertUser", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// MASTER ROLE
	public List<PortalMasterRoleBean> getMasterRoleName() {
		List<PortalMasterRoleBean> list = null;

		try {
			list = ibatis.queryForList("employees.getMasterRoleName", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Menu ROLE
	public List<PortalMasterRoleBean> getMenuRoleName(String roleId) {
		List<PortalMasterRoleBean> list = null;

		try {
			list = ibatis.queryForList("employees.getMenuRoleName", roleId);
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Privilage ROLE
	public List<PortalMasterRoleBean> getPrivRoleName(String roleId) {
		List<PortalMasterRoleBean> list = null;

		try {
			list = ibatis.queryForList("employees.getPrivRoleName", roleId);
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// MASTER MENU
	public List<PortalMasterRoleBean> getMasterMenuName() {
		List<PortalMasterRoleBean> list = null;

		try {
			list = ibatis.queryForList("employees.getMasterMenuName", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// MASTER PRIVILAGES
	public List<PortalMasterRoleBean> getMasterPrivilegeName() {
		List<PortalMasterRoleBean> list = null;

		try {
			list = ibatis.queryForList("employees.getMasterPrivilegeName", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// INSERT NEW ROLE Name
	public void insertNewRoleName(String addRoleName, String description) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("addRoleName", addRoleName);
		map.put("description", description);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("employees.insertNewRoleName", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// INSERT NEW ROLE MENU
	public void insertNewRoleMenu(String insertRoleMenuId) {

		try {
			ibatis.startTransaction();
			ibatis.insert("employees.insertNewRoleMenu", insertRoleMenuId);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// INSERT NEW ROLE PRIV
	public void insertNewRolePriv(String insertRolePrivId) {

		try {
			ibatis.startTransaction();
			ibatis.insert("employees.insertNewRolePriv", insertRolePrivId);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// Delete Role
	public void deleteRole(String roleId) {

		try {
			ibatis.startTransaction();
			ibatis.delete("employees.deleteRoleMenu", roleId);
			ibatis.delete("employees.deleteRolePriv", roleId);
			ibatis.delete("employees.deleteRoleUser", roleId);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// MASTER MODUL
	public List<PortalModulBean> getMasterModul() {
		List<PortalModulBean> list = null;

		try {
			list = ibatis.queryForList("employees.getMasterModul", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// INSERT NEW MODUL
	public void insertNewModul(String menuName, String urlMenu, String icon) {

		icon = "glyphicon " + icon;

		Map<String,String> map = new HashMap<String,String>();
		map.put("menuName", menuName);
		map.put("urlMenu", urlMenu);
		map.put("icon", icon);

		System.out.println("MenuName= " + menuName);
		System.out.println("URLMenu= " + urlMenu);
		System.out.println("Icon= " + icon);

		try {
			ibatis.startTransaction();
			ibatis.insert("employees.insertNewModul", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// EDIT MODUL
	public void editModul(String menuIdModul,String menuName, String urlMenu, String icon) {

		icon = "glyphicon " + icon;

		Map<String,String> map = new HashMap<String,String>();
		map.put("menuIdModul", menuIdModul);
		map.put("menuName", menuName);
		map.put("urlMenu", urlMenu);
		map.put("icon", icon);
		
		System.out.println("menuIdModul= " + menuIdModul);
		System.out.println("MenuName= " + menuName);
		System.out.println("URLMenu= " + urlMenu);
		System.out.println("Icon= " + icon);

		try {
			ibatis.startTransaction();
			ibatis.update("employees.editModul", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// Delete Role
	public void deleteMenu(String menuIdModul) {

		try {
			ibatis.startTransaction();
			ibatis.delete("employees.deleteMenu", menuIdModul);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/*BEGIN MASTER OTHERS*/
	//GET
	
	//PROVINCE
	public List<PortalProvinceBean> getAllProvince() {
		List<PortalProvinceBean> list = null;

		try {
			list = ibatis.queryForList("list.getProvince", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//CITY
	public List<PortalCityBean> getAllCity() {
		List<PortalCityBean> list = null;

		try {
			list = ibatis.queryForList("list.getCity", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//MAJOR
	public List<PortalMajorBean> getAllMajor() {
		List<PortalMajorBean> list = null;

		try {
			list = ibatis.queryForList("list.getMajor", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//DEPARTMENT
	public List<PortalDepartmentBean> getAllDepartment() {
		List<PortalDepartmentBean> list = null;

		try {
			list = ibatis.queryForList("list.getDepartment", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
		
	//LOCATION
	public List<PortalLocationBean> getAllLocation() {
		List<PortalLocationBean> list = null;

		try {
			list = ibatis.queryForList("list.getLocation", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//PRIVILEGE
	public List<PortalPrivilegeBean> getAllPrivilege() {
		List<PortalPrivilegeBean> list = null;

		try {
			list = ibatis.queryForList("list.getPrivilege", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//POSITION
	public List<PortalPositionBean> getAllPosition() {
		List<PortalPositionBean> list = null;

		try {
			list = ibatis.queryForList("list.getPosition", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//BANK
	public List<PortalBankBean> getAllBank() {
		List<PortalBankBean> list = null;

		try {
			list = ibatis.queryForList("list.getBank", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	//INSERT
	
	//PROVINCE
	public void insertNewProvince(String provinceName, String createdBy) {
		System.out.println("MANAGER province dalam jalan loohh");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("provinceName", provinceName);
		map.put("createdBy", createdBy);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("list.insertProvince", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//CITY
	public void insertNewCity(String cityName, String cityProvinceId, String createdBy) {
		System.out.println("MANAGER CITY dalam jalan loohh");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("cityName", cityName);
		map.put("cityProvinceId", cityProvinceId);
		map.put("createdBy", createdBy);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("list.insertCity", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//MAJOR
	public void insertNewMajor(String majorName, String description, String createdBy) {
		System.out.println("MANAGER MAJOR dalam jalan loohh");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("majorName", majorName);
		map.put("description", description);
		map.put("createdBy", createdBy);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("list.insertMajor", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//DEPARTMENT
	public void insertNewDepartment(String msDepartmentName, String description, String createdBy) {
		System.out.println("MANAGER Department dalam jalan loohh");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("msDepartmentName", msDepartmentName);
		map.put("description", description);
		map.put("createdBy", createdBy);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("list.insertDepartment", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//LOCATION
	public void insertNewLocation(String locationName, String description, String createdBy) {
		System.out.println("MANAGER location dalam jalan loohh");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("locationName", locationName);
		map.put("description", description);
		map.put("createdBy", createdBy);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("list.insertLocation", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//PRIVILEGE
	public void insertNewPrivilege(String privilegeName, String description, String createdBy) {
		System.out.println("MANAGER PRIVILEGE dalam jalan loohh");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("privilegeName", privilegeName);
		map.put("description", description);
		map.put("createdBy", createdBy);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("list.insertPrivilege", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}
	}
	
	//POSITION
	public void insertNewPosition(String positionName, String description, String createdBy) {
		System.out.println("MANAGER POSITION dalam jalan loohh");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("positionName", positionName);
		map.put("description", description);
		map.put("createdBy", createdBy);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("list.insertPosition", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//BANK
	public void insertNewBank(String bankName, String description, String createdBy) {
		System.out.println("MANAGER BANK dalam jalan loohh");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("bankName", bankName);
		map.put("description", description);
		map.put("createdBy", createdBy);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("list.insertBank", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//DELETE
	
	//PROVINCE
	public void deleteProvince(String id) {
		System.out.println("Delete Province");
		try {
			ibatis.startTransaction();
			ibatis.delete("list.deleteProvince", id);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//CITY
	public void deleteCity(String id) {
		System.out.println("Delete City");
		
		try {
			ibatis.startTransaction();
			ibatis.delete("list.deleteCity", id);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//MAJOR
	public void deleteMajor(String id) {
		System.out.println("Delete Major");

		try {
			ibatis.startTransaction();
			ibatis.delete("list.deleteMajor", id);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//DEPARTMENT
	public void deleteDepartment(String id) {
		System.out.println("Delete Department");

		try {
			ibatis.startTransaction();
			ibatis.delete("list.deleteDepartment", id);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		}
	
	//LOCATION
	public void deleteLocation(String id) {
		System.out.println("Delete Location");

		try {
			ibatis.startTransaction();
			ibatis.delete("list.deleteLocation", id);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//PRIVILEGE
	public void deletePrivilege(String id) {
		System.out.println("Delete Privilege");

		try {
			ibatis.startTransaction();
			ibatis.delete("list.deletePrivilege", id);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//POSITION
	public void deletePosition(String id) {
		System.out.println("Delete Position");

		try {
			ibatis.startTransaction();
			ibatis.delete("list.deletePosition", id);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//BANK
	public void deleteBank(String id) {
		System.out.println("Delete Bank");

		try {
			ibatis.startTransaction();
			ibatis.delete("list.deleteBank", id);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//EDIT PASSWORD
	
	public void editPassword(String userName, String newPass, String updatedBy) {

		Map<String,String> map = new HashMap<String,String>();
		map.put("userName", userName);
		map.put("newPass", newPass);
		map.put("updatedBy", updatedBy);

		try {
			ibatis.startTransaction();
			ibatis.update("list.editPassword", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//EDIT PROVINCE
	public void editProvince(String id, String provinceName, String updatedBy) {

		System.out.println("id "+id);
		System.out.println("provname "+provinceName);
		System.out.println("Updated By: "+updatedBy);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("provinceName", provinceName);
		map.put("updatedBy", updatedBy);

		try {
			ibatis.startTransaction();
			ibatis.update("list.editProvince", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//EDIT CITY
	public void editCity(String id, String cityProvinceId, String cityName, String updatedBy) {

		System.out.println("id "+id);
		System.out.println("cityProvinceId "+cityProvinceId);
		System.out.println("cityName "+cityName);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("cityProvinceId", cityProvinceId);
		map.put("cityName", cityName);
		map.put("updatedBy", updatedBy);


		try {
			ibatis.startTransaction();
			ibatis.update("list.editCity", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
		
	//EDIT MAJOR
	public void editMajor(String id, String majorName, String description, String updatedBy) {

		System.out.println("id "+id);
		System.out.println("majorName "+majorName);
		System.out.println("description "+description);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("majorName", majorName);
		map.put("description", description);
		map.put("updatedBy", updatedBy);

		try {
			ibatis.startTransaction();
			ibatis.update("list.editMajor", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
		
	//EDIT DEPARTMENT
	public void editDepartment(String id, String msDepartmentName, String description, String updatedBy) {

		System.out.println("id "+id);
		System.out.println("msDepartmentName "+msDepartmentName);
		System.out.println("description "+description);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("msDepartmentName", msDepartmentName);
		map.put("description", description);
		map.put("updatedBy", updatedBy);

		try {
			ibatis.startTransaction();
			ibatis.update("list.editDepartment", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
		
	//EDIT LOCATION
	public void editLocation(String id, String locationName, String description, String updatedBy) {

		System.out.println("id "+id);
		System.out.println("locationName "+locationName);
		System.out.println("description "+description);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("locationName", locationName);
		map.put("description", description);
		map.put("updatedBy", updatedBy);

		try {
			ibatis.startTransaction();
			ibatis.update("list.editLocation", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//EDIT PRIVILEGE
	public void editPrivilege(String id, String privilegeName, String description, String updatedBy) {

		System.out.println("id "+id);
		System.out.println("privilegeName "+privilegeName);
		System.out.println("description "+description);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("privilegeName", privilegeName);
		map.put("description", description);
		map.put("updatedBy", updatedBy);

		try {
			ibatis.startTransaction();
			ibatis.update("list.editPrivilege", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
		
	//EDIT POSITION
	public void editPosition(String id, String positionName, String description, String updatedBy) {

		System.out.println("id "+id);
		System.out.println("positionName "+positionName);
		System.out.println("description "+description);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("positionName", positionName);
		map.put("description", description);
		map.put("updatedBy", updatedBy);

		try {
			ibatis.startTransaction();
			ibatis.update("list.editPosition", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//EDIT BANK
	public void editBank(String id, String bankName, String description, String updatedBy) {

		System.out.println("id "+id);
		System.out.println("bankName "+bankName);
		System.out.println("description "+description);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("bankName", bankName);
		map.put("description", description);
		map.put("updatedBy", updatedBy);

		try {
			ibatis.startTransaction();
			ibatis.update("list.editBank", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	//END MASTER OTHERS

	// SELECT PRIVILEGE FROM ROLE_ID
	public List<PortalMasterRoleBean> getPrivilegeRoleList(String id) {
		List<PortalMasterRoleBean> list = null;

		try {
			list = ibatis.queryForList("employees.getPrivilegeRoleList", id);
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// SELECT MENU FROM ROLE_ID
	public List<PortalMasterRoleBean> getMenuRoleList(String id) {
		List<PortalMasterRoleBean> list = null;

		try {
			list = ibatis.queryForList("employees.getMenuRoleList", id);
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//DELETE EXIST MENU 
	public void deleteExistMenu(String id, String menuId) {
		System.out.println("DELETE EXIST MENU ");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("menuId", menuId);
		
		try {
			ibatis.startTransaction();
			ibatis.delete("employees.deleteExistMenu", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//DELETE EXIST PRIVILEGE 
	public void deleteExistPriv(String id, String privilegeId) {
		System.out.println("DELETE EXIST PRIVILEGE ");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("privilegeId", privilegeId);
		
		try {
			ibatis.startTransaction();
			ibatis.delete("employees.deleteExistPriv", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// UPDATE NEW ROLE Name
	public void updateNewRoleName(String id, String roleName, String description) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("roleName", roleName);
		map.put("description", description);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("employees.updateNewRoleName", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// UPDATE-INSERT NEW ROLE TR_MENU
	public void updateNewRoleMenu(String id, String menuId) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("menuId", menuId);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("employees.updateNewRoleMenu", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// UPDATE-INSERT NEW ROLE TR_PRIVILEGE 
	public void updateNewRolePriv(String id, String privilegeId) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("privilegeId", privilegeId);
		
		try {
			ibatis.startTransaction();
			ibatis.insert("employees.updateNewRolePriv", map);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public boolean isAuthorized(String username, String password){
		Map<String,String> user = new HashMap<String,String>();
		user.put("username", username);
		user.put("password", password);
		
		Integer result;
		try {
			result = (Integer) ibatis.queryForObject("users.isAuthorized", user);
			if (result == null)
				return false;
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;	
	}
	
	public void updateStatusLogin(String username, int status) {
		Map<String,String> user = new HashMap<String,String>();
		user.put("username", username);
		user.put("status", String.valueOf(status));
		
		try {
			ibatis.startTransaction();
			ibatis.update("users.updateStatusLogin", user);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void resetStatusLogin() {
		try {
			ibatis.startTransaction();
			ibatis.update("users.resetStatusLogin", "");
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public PortalUserBean checkLogin(String username, String password) {
		Map<String,String> user = new HashMap<String,String>();
		user.put("username", username);
		user.put("password", password);

		PortalUserBean bean = null;
		try {
			bean = (PortalUserBean) ibatis.queryForObject("users.checkLogin", user);
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public PortalUserBean getEmailData(String username) {
		PortalUserBean bean = new PortalUserBean();
		try {
			bean = (PortalUserBean) ibatis.queryForObject("users.getEmailData", username);
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public boolean checkUserExist(String username, String password) {
		Map<String,String> user = new HashMap<String,String>();
		user.put("username", username);
		user.put("password", password);
		
		Integer result = null;
		try {
			result = (Integer) ibatis.queryForObject("users.checkUserExist", user);
			if (null == result)
				return false;
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public String getPortalUrl() {
		String url = null;
		try {
			url = (String) ibatis.queryForObject("users.getPortalUrl", "");
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	public void updatePassword(String password, String employeeId) {
		Map<String,String> user = new HashMap<String,String>();
		user.put("password", password);
		user.put("employeeId", employeeId);
		
		try {
			ibatis.startTransaction();
			ibatis.update("users.updatePassword", user);
			ibatis.commitTransaction();
		} catch (SQLException s) {
			s.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
