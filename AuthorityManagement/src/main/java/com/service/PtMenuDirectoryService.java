package com.service;

import com.bean.PtPageBean;
import com.bean.PtTree;
import com.helpbean.ResVo;

public interface PtMenuDirectoryService {

	/**
	 * 获取展示的资源列表
	 * @return
	 */
	public PtPageBean<ResVo> getResources(int pageSize,int pageNumber);
	
	/**
	 * 删除资源信息
	 */
	public int deleteRes(int id);

	
	/**
	 * 新增资源信息
	 */
	public int insert(String dir_name, int parent_id,String isitem);

	/**
	 * 根据menuid获取资源
	 * @param menu_id
	 * @return
	 */
	public ResVo getResource(int menu_id);

	/**
	 * 更新资源信息
	 * 
	 */
	public int update(String dir_name, int parent_id, String isitem, int uuid);

	/**
	 * 资源树
	 * @return
	 */
	public PtTree getResourcesByParentId();

}
