package com.dao;

import java.util.List;

import com.bean.PtRRoleOrgan;
import com.bean.PtRUserDutyOrg;

public interface PtRUserDutyOrgMapper {
    int deleteByPrimaryKey(Integer userDutyid);

    int insert(PtRUserDutyOrg record);

    int insertSelective(PtRUserDutyOrg record);

    PtRUserDutyOrg selectByPrimaryKey(Integer userDutyid);
    
    List<PtRRoleOrgan> selectByUserid(Integer userid);//通过用户id找岗位
    
    int deleteByUserid(Integer userDutyid);//通过用户id删除数据

    int updateByPrimaryKeySelective(PtRUserDutyOrg record);

    int updateByPrimaryKey(PtRUserDutyOrg record);
    
    List<PtRRoleOrgan> selectByDutyID(Integer DutyID);//通过岗位id找岗位
}