package com.service;

import com.bean.PtOrgan;
import com.bean.PtPageBean;
import com.helpbean.OrgansVO;

public interface PtOrganService {
	/**
	 * 分页展示组织信息列表
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
    PtPageBean<OrgansVO> selectByPage(int pageSize,int pageNumber);

    /**
     * 新增组织信息
     * @param organ
     * @return
     */
	int insertOrgan(PtOrgan organ);
}
