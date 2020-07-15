package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.PtRRoleOrgan;
import com.bean.PtRole;

public interface PtRoleMapper {
    int deleteByPrimaryKey(Integer roleUuid);

    int insert(PtRole record);

    int insertSelective(PtRole record);

    PtRole selectByPrimaryKey(Integer roleUuid);

    int updateByPrimaryKeySelective(PtRole record);

    int updateByPrimaryKey(PtRole record);
    
    //增加角色信息
    int addPtRole(PtRole ptRole);
    
    //删除角色信息
    int deletePtRole(@Param("role_uuid") int id);
    
    //更新角色信息
    int updatePtRole(PtRole ptRole);
    
    
    //查询全部的角色信息
    List<PtRole> getRoleByPage(HashMap<String, Integer> map);
    
    //获取数据总数
    int getRoleCount();
    
}