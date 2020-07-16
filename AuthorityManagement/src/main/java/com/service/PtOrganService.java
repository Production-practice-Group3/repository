package com.service;

import com.bean.PtPageBean;
import com.helpbean.OrgansVO;

public interface PtOrganService {
    PtPageBean<OrgansVO> selectByPage(int pageSize,int pageNumber);
}
