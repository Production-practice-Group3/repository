package com.service;

import com.bean.PtTree;

import java.util.ArrayList;
import java.util.List;

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
	
	/**
	 * 根据id查找组织信息
	 * @param uuid
	 * @return
	 */
	public PtOrgan selectByPrimaryKey(Integer uuid);
	
	/**
	 * 修改组织信息
	 * @param organ
	 * @return
	 */
	int updateOrgan(PtOrgan organ);
	/**
	 * 修改组织信息
	 * @param organ
	 * @return
	 */
	int update(PtOrgan organ);
	
	/**
	 * 删除组织信息
	 * @param uuid
	 * @return
	 */
	int removeOrgan(Integer uuid);
	
	/**
	 * 判断是否可修改id1的父组织为id2
	 * @param id1
	 * @param id2
	 * @return
	 */
	int check(int id1,int id2);
	
	/**
	 * 找到所有的下层节点
	 * @param id
	 * @return
	 */
	ArrayList<Integer> findChild(ArrayList<Integer> id);
	
	/**
	 * 建立组织树
	 * @return
	 */
	PtTree buildOrgTree();
	List<PtTree> buildChild(int id);
}
