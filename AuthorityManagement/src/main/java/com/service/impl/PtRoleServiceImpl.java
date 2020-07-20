package com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.PtPageBean;
import com.bean.PtRole;
import com.bean.PtRoleRes;
import com.dao.PtRoleMapper;
import com.helpbean.RoleResVO;
import com.helpbean.RolesVO;
import com.service.PtRoleService;

@Service
public class PtRoleServiceImpl implements PtRoleService{
	
	@Autowired
	private PtRoleMapper ptRoleMapper;

	//增加角色信息
	public int addPtRole(PtRole ptRole) {
		PtRole ptRoles=new PtRole();
		ptRoles.setRoleId(ptRole.getRoleId());
		ptRoles.setRoleName(ptRole.getRoleName());
		ptRoleMapper.insert(ptRoles);
		return 1;
	}

	//删除角色信息
	public int deletePtRole(int id) {
		ptRoleMapper.deleteByPrimaryKey(id);
		return 1;
	}

	//更新角色信息
	public int updatePtRole(PtRole ptRole) {
		PtRole ptRoles=new PtRole();
		ptRoles.setRoleUuid(ptRole.getRoleUuid());
		ptRoles.setRoleId(ptRole.getRoleId());
		ptRoles.setRoleName(ptRole.getRoleName());
		ptRoleMapper.updateByPrimaryKey(ptRoles);
		return 1;
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
	
	//提供可以分配的角色
	public List<PtRole> getRoles2(){
		return ptRoleMapper.selectPtRole();
	}
	
	//根据id获取角色信息
	public PtRole getRole(int uuid) {
		return ptRoleMapper.selectByPrimaryKey(uuid);
	}

	//保存关联资源
    public int linkResource(RoleResVO roleRes) {
    	ptRoleMapper.deleteResourceByRoleId(roleRes.getRoleId());
    	String[] s=roleRes.getResources().split(",");
    	PtRoleRes ptRoleRes=new PtRoleRes();
    	for(int i=1;i<s.length;i++) {
    		
    		ptRoleRes.setRoleUuid(roleRes.getRoleId());
    		ptRoleRes.setResUuid(s[i]);
    		ptRoleMapper.linkResource(ptRoleRes);
    	}
		return 1;
    }
    
  //获得关联资源
    public List<String> getResource(int id){
    	List<PtRoleRes> ptRoleRes=ptRoleMapper.getResource(id);
    	List<String> list=new ArrayList<String>();
    	for(PtRoleRes p:ptRoleRes) {
    		list.add(p.getResUuid());
    	}
		return list;
    }
}
