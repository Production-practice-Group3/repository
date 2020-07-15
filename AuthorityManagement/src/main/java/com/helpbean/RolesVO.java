package com.helpbean;

public class RolesVO {//角色列表

	private String roleId;
	
	private String roleName;
	
	private int roleUuid;

	public int getRoleUuid() {
		return roleUuid;
	}

	public void setRoleUuid(int roleUuid) {
		this.roleUuid = roleUuid;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}
