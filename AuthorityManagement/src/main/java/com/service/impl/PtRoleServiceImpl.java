package com.service.impl;

import com.bean.PtRole;
import com.dao.PtRoleMapper;
import com.service.PtRoleService;

public class PtRoleServiceImpl implements PtRoleService{

	private PtRoleMapper ptRoleMapper;

	public PtRoleMapper getPtRoleMapper() {
		return ptRoleMapper;
	}

	public void setPtRoleMapper(PtRoleMapper ptRoleMapper) {
		this.ptRoleMapper = ptRoleMapper;
	}
	
	

	public int deleteByPrimaryKey(Integer roleUuid) {
		return ptRoleMapper.deleteByPrimaryKey(roleUuid);
	}

	public int insert(PtRole record) {
		return ptRoleMapper.insert(record);
	}

	public int insertSelective(PtRole record) {
		return ptRoleMapper.insertSelective(record);
	}

	public PtRole selectByPrimaryKey(Integer roleUuid) {
		return ptRoleMapper.selectByPrimaryKey(roleUuid);
	}

	public int updateByPrimaryKeySelective(PtRole record) {
		return ptRoleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(PtRole record) {
		return ptRoleMapper.updateByPrimaryKey(record);
	}
	

}
