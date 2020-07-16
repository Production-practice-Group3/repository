package com.dao;

import java.util.HashMap;
import java.util.List;

import com.bean.PtUser;

public interface PtUserMapper {
    int deleteByPrimaryKey(Integer userUuid);

    int insert(PtUser record);

    int insertSelective(PtUser record);

    PtUser selectByPrimaryKey(Integer userUuid);
    /**
     * 获取分页用户信息
     * @return
     */
    List<PtUser> selectByPage(HashMap<String, Integer> map);
    /**
     * 获取数据总数
     * @return
     */
    int getCount();

    int updateByPrimaryKeySelective(PtUser record);

    int updateByPrimaryKey(PtUser record);
}