package com.dao;

import java.util.HashMap;
import java.util.List;
import com.bean.PtRole;

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
    
    
    
}