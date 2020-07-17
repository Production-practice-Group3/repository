package com.helpbean;

import java.util.Date;
import java.util.List;

import com.bean.PtOrgan;
import com.bean.PtRRoleOrgan;

public class UsersVO {

    private Integer userUuid;
 
    private String username;
    
    private String password;

    private String email;

    private String mobile;

    private PtOrgan organ;
    
    private List<PtRRoleOrgan> duties;
    
    public List<PtRRoleOrgan> getDuties() {
		return duties;
	}

	public void setDuties(List<PtRRoleOrgan> duties) {
		this.duties = duties;
	}

	private String niceName;

    private String remark;


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public PtOrgan getOrgan() {
		return organ;
	}

	public void setOrgan(PtOrgan organ) {
		this.organ = organ;
	}

    private Date modtime;

    public Integer getUserUuid() {
		return userUuid;
	}

	public void setUserUuid(Integer userUuid) {
		this.userUuid = userUuid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getNiceName() {
		return niceName;
	}

	public void setNiceName(String niceName) {
		this.niceName = niceName;
	}

	public Date getModtime() {
		return modtime;
	}

	public void setModtime(Date modtime) {
		this.modtime = modtime;
	}

	

}
