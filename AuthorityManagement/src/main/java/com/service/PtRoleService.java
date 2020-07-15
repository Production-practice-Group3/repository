package com.service;

import com.bean.PtRole;

public interface PtRoleService {
	int deleteByPrimaryKey(Integer roleUuid);

    int insert(PtRole record);

    int insertSelective(PtRole record);

    PtRole selectByPrimaryKey(Integer roleUuid);

    int updateByPrimaryKeySelective(PtRole record);

    int updateByPrimaryKey(PtRole record);

}
