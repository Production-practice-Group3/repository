package com.dao;

import java.util.HashMap;
import java.util.List;
import com.bean.PtRole;
import com.bean.PtRoleRes;
import com.helpbean.RoleResVO;

public interface PtRoleMapper {
    int deleteByPrimaryKey(Integer roleUuid);

    int insert(PtRole record);

    int insertSelective(PtRole record);

    PtRole selectByPrimaryKey(Integer roleUuid);

    int updateByPrimaryKeySelective(PtRole record);

    int updateByPrimaryKey(PtRole record);
    
    
    //查询全部的角色信息(分页查询)
    List<PtRole> getRoleByPage(HashMap<String, Integer> map);
    
    //查询全部角色信息
    List<PtRole> selectPtRole();
    
    //获取数据总数
    int getRoleCount();
    
    //获取该角色关联的资源
    List<PtRoleRes> getResource(int id);
    
    //增加该角色关联的资源
    int linkResource(PtRoleRes ptRoleRes);
    
    //根据roleId删除该角色关联的资源
    int deleteResourceByRoleId(int roleId);
    
}