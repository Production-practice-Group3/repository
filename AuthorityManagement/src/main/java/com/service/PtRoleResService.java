package com.service;

import com.bean.PtRoleRes;

public interface PtRoleResService {
	int deleteByPrimaryKey(Integer roleResid);

    int insert(PtRoleRes record);

    int insertSelective(PtRoleRes record);

    PtRoleRes selectByPrimaryKey(Integer roleResid);

    int updateByPrimaryKeySelective(PtRoleRes record);

    int updateByPrimaryKey(PtRoleRes record);
}
