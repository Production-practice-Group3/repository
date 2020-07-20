package com.service;


import java.util.List;

import com.bean.PtPageBean;
import com.bean.PtRole;
import com.bean.PtRoleRes;
import com.helpbean.RoleResVO;
import com.helpbean.RolesVO;

public interface PtRoleService {
	
	//增加角色信息
    int addPtRole(PtRole ptRole);
    
    //删除角色信息
    int deletePtRole(int id);
    
    //更新角色信息
    int updatePtRole(PtRole ptRole);
    
    //查询全部的角色信息(分页查询)
    public PtPageBean<RolesVO> getRolesVO(int pageSize,int pageNumber);
    
    //查询全部角色信息
    public List<PtRole> getRoles2();
    
    //根据id获取角色信息
    public PtRole getRole(int uuid);

    //保存关联资源
    public int linkResource(RoleResVO roleRes);
    
    //获得关联资源
    public List<String> getResource(int id);
    
}
