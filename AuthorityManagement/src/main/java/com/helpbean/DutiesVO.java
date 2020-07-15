package com.helpbean;

import com.bean.PtOrgan;
import com.bean.PtRole;

public class DutiesVO {//岗位列表

	private int dutyId;
	
	private String name;
	
	private PtOrgan organ;
	
	private PtRole role;

	public int getDutyId() {
		return dutyId;
	}

	public void setDutyId(int dutyId) {
		this.dutyId = dutyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public PtOrgan getOrgan() {
		return organ;
	}

	public void setOrgan(PtOrgan organ) {
		this.organ = organ;
	}

	public PtRole getRole() {
		return role;
	}

	public void setRole(PtRole role) {
		this.role = role;
	}
	
	
}
