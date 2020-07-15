package com.helpbean;

import java.util.Date;

import com.bean.PtOrgan;

public class UsersVO {

    private Integer userUuid;

    private String username;

    private String email;

    private String mobile;

    private PtOrgan organ;

    public PtOrgan getOrgan() {
		return organ;
	}

	public void setOrgan(PtOrgan organ) {
		this.organ = organ;
	}

	private String niceName;
    
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
