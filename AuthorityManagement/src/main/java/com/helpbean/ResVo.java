package com.helpbean;

import com.bean.PtMenuDirectory;

public class ResVo {

	private Integer menu_id;

	private String dir_name;

	private Integer dir_level_number;

	private String isitem;

	private String locale;
	
	private Integer res_uuid;
	
	PtMenuDirectory parent;

	public Integer getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(Integer menu_id) {
		this.menu_id = menu_id;
	}

	public String getDir_name() {
		return dir_name;
	}

	public void setDir_name(String dir_name) {
		this.dir_name = dir_name;
	}

	public Integer getDir_level_number() {
		return dir_level_number;
	}

	public void setDir_level_number(Integer dir_level_number) {
		this.dir_level_number = dir_level_number;
	}

	public String getIsitem() {
		return isitem;
	}

	public void setIsitem(String isitem) {
		this.isitem = isitem;
	}

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public PtMenuDirectory getParent() {
		return parent;
	}

	public void setParent(PtMenuDirectory parent) {
		this.parent = parent;
	}

	public Integer getRes_uuid() {
		return res_uuid;
	}

	public void setRes_uuid(Integer res_uuid) {
		this.res_uuid = res_uuid;
	}

	

}
