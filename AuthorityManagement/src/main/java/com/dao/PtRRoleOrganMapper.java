package com.dao;

import java.util.HashMap;
import java.util.List;

import com.bean.PtRRoleOrgan;

public interface PtRRoleOrganMapper {
    int deleteByPrimaryKey(Integer dutyid);

    int insert(PtRRoleOrgan record);

    int insertSelective(PtRRoleOrgan record);

    PtRRoleOrgan selectByPrimaryKey(Integer dutyid);

    int updateByPrimaryKeySelective(PtRRoleOrgan record);

    int updateByPrimaryKey(PtRRoleOrgan record);
    
    /**
     * 获取分页岗位信息
     * @return
     */
    List<PtRRoleOrgan> getRRoleOrgansByPage(HashMap<String, Integer> map);
    
    /**
     * 获取数据总数
     * @return
     */
    int getRRoleOrganCount();
    
    /**
	 * 根据组织id查找岗位
	 * @param organId
	 * @return
	 */
    List<PtRRoleOrgan> getDutyByOrganId(int organId);
    
}