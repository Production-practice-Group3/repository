package com.helpbean;

import java.util.Date;

public class OrgansVO {
	private Integer organUuid;

    private String organCode;

    private String organName;

    private String parentName;
    
    private String shortname;
    
    private Date modtime;

	public Integer getOrganUuid() {
		return organUuid;
	}

	public void setOrganUuid(Integer organUuid) {
		this.organUuid = organUuid;
	}

	public String getOrganCode() {
		return organCode;
	}

	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}

	public String getOrganName() {
		return organName;
	}

	public void setOrganName(String organName) {
		this.organName = organName;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getShortname() {
		return shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}

	public Date getModtime() {
		return modtime;
	}

	public void setModtime(Date modtime) {
		this.modtime = modtime;
	}

    
   
}
