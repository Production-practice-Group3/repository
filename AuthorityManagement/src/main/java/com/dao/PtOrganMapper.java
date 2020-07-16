package com.dao;

import java.util.HashMap;
import java.util.List;

import com.bean.PtOrgan;

public interface PtOrganMapper {
    int deleteByPrimaryKey(Integer organUuid);

    int insert(PtOrgan record);

    int insertSelective(PtOrgan record);

    PtOrgan selectByPrimaryKey(Integer organUuid);

    int updateByPrimaryKeySelective(PtOrgan record);

    int updateByPrimaryKey(PtOrgan record);
    
    String getParentName(PtOrgan organ);
    
    List<PtOrgan> selectByPage(HashMap<String, Integer> map);
    
    int getOrganCount();
}