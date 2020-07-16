package com.dao;

import java.util.HashMap;
import java.util.List;

import com.bean.PtMenuDirectory;

public interface PtMenuDirectoryMapper {
    int deleteByPrimaryKey(Integer menuId);

    int insert(PtMenuDirectory record);

    int insertSelective(PtMenuDirectory record);

    PtMenuDirectory selectByPrimaryKey(Integer menuId);

    int updateByPrimaryKeySelective(PtMenuDirectory record);

    int updateByPrimaryKey(PtMenuDirectory record);
    
    /**
     * 获取分页岗位信息
     * @return
     */
    List<PtMenuDirectory> getPtMenuDirectoryByPage(HashMap<String, Integer> map);
    /**
     * 获取数据总数
     * @return
     */
    int getPtMenuDirectoryCount();
}