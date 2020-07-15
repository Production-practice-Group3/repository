package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.PtPageBean;
import com.bean.PtRole;
import com.dao.PtRoleMapper;
import com.helpbean.DutiesVO;
import com.helpbean.RolesVO;
import com.service.PtRoleService;

@Service
public class PtRoleServiceImpl implements PtRoleService{
	
	@Autowired
	private PtRoleMapper ptRoleMapper;

	//增加角色信息
	public int addPtRole(PtRole ptRole) {
		return ptRoleMapper.addPtRole(ptRole);
	}

	//删除角色信息
	public int deletePtRole(int id) {
		return ptRoleMapper.deletePtRole(id);
	}

	//更新角色信息
	public int updatePtRole(PtRole ptRole) {
		return ptRoleMapper.updatePtRole(ptRole);
	}

	//查询全部的角色信息(分页查询)
	public PtPageBean<RolesVO> getRolesVO(int pageSize, int pageNumber) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int startIndex=(pageNumber-1)*pageSize;//找到上一批寻找的最后一个是第几个
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		List<PtRole> ptRoles=ptRoleMapper.getRoleByPage(map);
		List<RolesVO> rolesVOs=new ArrayList<RolesVO>();
		for(PtRole ptRole:ptRoles) {
			RolesVO rolesVO=new RolesVO();
			rolesVO.setRoleId(ptRole.getRoleId());
			rolesVO.setRoleName(ptRole.getRoleName());
			rolesVO.setRoleUuid(ptRole.getRoleUuid());
			rolesVOs.add(rolesVO);
		}
		PtPageBean<RolesVO> pageBean=new PtPageBean<RolesVO>();
		pageBean.setRows(rolesVOs);//放置数据
		int total=ptRoleMapper.getRoleCount();//找到总数
		pageBean.setTotal(total);//设置总数
		return pageBean;
	}

	
	

	
	

}
