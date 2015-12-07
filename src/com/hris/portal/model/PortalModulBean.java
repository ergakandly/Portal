package com.hris.portal.model;

import java.io.Serializable;

public class PortalModulBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String menuIdModul;
	private String menuName;
	private String urlMenu;
	private String icon;
	private String iconSubstr;


	public String getMenuIdModul() {
		return menuIdModul;
	}

	public void setMenuIdModul(String menuIdModul) {
		this.menuIdModul = menuIdModul;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getUrlMenu() {
		return urlMenu;
	}

	public void setUrlMenu(String urlMenu) {
		this.urlMenu = urlMenu;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getIconSubstr() {
		return iconSubstr;
	}

	public void setIconSubstr(String iconSubstr) {
		this.iconSubstr = iconSubstr;
	}
}
