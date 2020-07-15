package com.service;

import java.util.List;

import com.bean.PtPageBean;
import com.helpbean.DutiesVO;

public interface PtDutyService {

	/**
	 * 获取展示的岗位列表
	 * @return
	 */
	public PtPageBean<DutiesVO> getDuties(int pageSize,int pageNumber);
}
