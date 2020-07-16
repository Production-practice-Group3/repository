package com.service;

import com.bean.PtPageBean;
import com.helpbean.ResVo;

public interface PtMenuDirectoryService {

	/**
	 * 获取展示的资源列表
	 * @return
	 */
	public PtPageBean<ResVo> getResources(int pageSize,int pageNumber);
}
