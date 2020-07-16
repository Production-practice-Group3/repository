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
	
	/**
	 * 增加岗位信息
	 * @param dutiesVO
	 */
	public int insert(DutiesVO dutiesVO);
	
	/**
	 * 根据id查找岗位信息
	 * @param dutyId
	 * @return
	 */
	public DutiesVO getDuty(int dutyId);
	
	/**
	 * 更新岗位信息
	 * @param dutiesVO
	 * @return
	 */
	public int update(DutiesVO dutiesVO);
	
	/**
	 * 根据id删除岗位信息
	 * @param id
	 * @return
	 */
	public int remove(int id);
}
