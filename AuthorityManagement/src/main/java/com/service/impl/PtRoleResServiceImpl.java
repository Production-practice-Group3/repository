package com.service.impl;

import com.bean.PtRoleRes;
import com.dao.PtRoleResMapper;
import com.service.PtRoleResService;

public class PtRoleResServiceImpl implements PtRoleResService{

	private PtRoleResMapper ptRoleResMapper;
	
	public PtRoleResMapper getPtRoleResMapper() {
		return ptRoleResMapper;
	}

	public void setPtRoleResMapper(PtRoleResMapper ptRoleResMapper) {
		this.ptRoleResMapper = ptRoleResMapper;
	}

	
	
	public int deleteByPrimaryKey(Integer roleResid) {
		return ptRoleResMapper.deleteByPrimaryKey(roleResid);
	}

	public int insert(PtRoleRes record) {
		return ptRoleResMapper.insert(record);
	}

	public int insertSelective(PtRoleRes record) {
		return ptRoleResMapper.insertSelective(record);
	}

	public PtRoleRes selectByPrimaryKey(Integer roleResid) {
		return ptRoleResMapper.selectByPrimaryKey(roleResid);
	}

	public int updateByPrimaryKeySelective(PtRoleRes record) {
		return ptRoleResMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(PtRoleRes record) {
		return ptRoleResMapper.updateByPrimaryKey(record);
	}

}
