package com.service;


import com.bean.PtPageBean;
import com.bean.PtRole;
import com.helpbean.RolesVO;

public interface PtRoleService {
	
	//增加角色信息
    int addPtRole(PtRole ptRole);
    
    //删除角色信息
    int deletePtRole(int id);
    
    //更新角色信息
    int updatePtRole(PtRole ptRole);
    
    //查询全部的角色信息
    public PtPageBean<RolesVO> getRolesVO(int pageSize,int pageNumber);

}
